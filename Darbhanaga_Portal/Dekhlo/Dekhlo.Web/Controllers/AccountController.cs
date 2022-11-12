using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using Dekhlo.Web.Filters;
using Dekhlo.Web.Models;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Configuration;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Data;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View = "Error")]
    [Authorize]
    //[InitializeSimpleMembership]
    public class AccountController : Controller
    {
        private PORTALEntitiy dbContext = new PORTALEntitiy();


        //
        // GET: /Account/Login

        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(ModelProperty mp, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                LoginModel model = mp.ObjLoginModel;
                if (WebSecurity.Login(model.UserName, model.Password, persistCookie: model.RememberMe))
                {
                    StoreSession(model.UserName);
                    return RedirectToLocal(returnUrl);
                }
            }

            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "The user name or password provided is incorrect.");
            return View(mp);
        }

        private void StoreSession(string userName)
        {
            UserRegistration userRegistration = dbContext.UserRegistrations.Where(m => m.UserName.ToLower() == userName.ToLower()).FirstOrDefault();
            Session["LoggedInUserId"] = userRegistration.Id;
        }

        //
        // POST: /Account/LogOff

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            WebSecurity.Logout();

            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/Register

        [AllowAnonymous]
        public ActionResult Register()
        {
            return View("Login");
        }

        //
        // POST: /Account/Register

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Register(ModelProperty mp)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                try
                {
                    using (UsersContext db = new UsersContext())
                    {
                        RegisterModel model = mp.ObjRegisterModel;
                        model.UserName = model.MobileNumber;// Utility.FrameUserName(model.FirstName, model.LastName);
                        Logon user = db.Logons.FirstOrDefault(u => u.UserName.ToLower() == model.UserName.ToLower());

                        if (user == null)
                        {
                            //// Insert name into the profile table
                            //db.Logons.Add(new Logon { UserName = model.UserName });
                            //db.SaveChanges();

                            WebSecurity.CreateUserAndAccount(model.UserName, model.Password,null, true);

                            UserRegistration userRegistration = new UserRegistration();
                            userRegistration.UserName = model.UserName;
                            userRegistration.FirstName = model.FirstName;
                            userRegistration.LastName = model.LastName;
                            userRegistration.EmailId = model.Email;
                            userRegistration.MobileNo = model.MobileNumber;
                            userRegistration.CreatedOn = DateTime.Now;
                            userRegistration.Status = dbContext.StatusConditions.FirstOrDefault(m => m.StatusName == "Created").Id;
                            dbContext.UserRegistrations.Add(userRegistration);
                            dbContext.SaveChanges();

                            string response;
                            string otpUrl = ConfigurationManager.AppSettings["SmsUrl"];
                            int SmsMinTime = Convert.ToInt32(ConfigurationManager.AppSettings["SmsMinTime"]);
                            int SmsMaxTime = Convert.ToInt32(ConfigurationManager.AppSettings["SmsMaxTime"]);
                            string optMessage = ConfigurationManager.AppSettings["OtpMessage"];
                            if (new TimeSpan(DateTime.UtcNow.AddHours(5.5).Hour, DateTime.UtcNow.AddHours(5.5).Minute, DateTime.UtcNow.AddHours(5.5).Second).TotalHours > SmsMinTime
                                && new TimeSpan(DateTime.UtcNow.AddHours(5.5).Hour, DateTime.UtcNow.AddHours(5.5).Minute, DateTime.UtcNow.AddHours(5.5).Second).TotalHours < SmsMaxTime)
                            {
                                string otpCodeGenerated = Get6DigitRandomNumber();

                                Otp otpToInsert = new Otp();
                                otpToInsert.CreatedOn = DateTime.Now;
                                otpToInsert.IsActive=true;
                                otpToInsert.IsVerified=false;
                                otpToInsert.OtpCode = otpCodeGenerated;
                                otpToInsert.UserId = userRegistration.Id;

                                dbContext.Otps.Add(otpToInsert);
                                dbContext.SaveChanges();


                                string otpMessage = optMessage.Replace("[OtpCode]", otpCodeGenerated);
                                otpUrl = otpUrl.Replace("[MobileNumber]", "91" + userRegistration.MobileNo);
                                otpUrl = otpUrl.Replace("[Message]", otpMessage);
                                otpUrl = otpUrl.Replace("&amp;", "&");
                                response = new SmsUtility().SendSms(otpUrl);
                                if (String.IsNullOrEmpty(response) || response.Contains("exceeded time limit"))
                                    ViewBag.Message = "OTP not sent. Please try between 9:00 AM to 8:00 PM";
                                else if (!String.IsNullOrEmpty(response) && new Regex(@"^[0-9-_]+$").IsMatch(response))
                                {
                                    OtpMessage otp = new OtpMessage { MobileNumber = userRegistration.MobileNo };
                                    ViewBag.Message = "OTP sent successfully.";
                                    ViewBag.IsOtpsent = true;
                                    ViewBag.PasswordEntered = model.Password;
                                    return View("GetOtp", otp);
                                }
                                else if(response.Contains("Errored"))
                                {
                                    ViewBag.Message = "Please reload the page and try again";
                                }
                            }
                            else
                            {
                                ViewBag.Message = "OTP not sent. Please try between 9:00 AM to 8:00 PM";
                            }

                            //WebSecurity.Login(model.UserName, model.Password);
                            //StoreSession(model.UserName);
                            //return RedirectToAction("Index", "Home");
                        }
                        else
                        {
                            ModelState.AddModelError("UserName", "Mobile number already exists. Get OTP to reset password.");
                            ViewBag.Message = "Mobile number already exists.Click on Get OTP to reset password.";
                            ViewBag.ShowOtp = true;
                        }
                    }
                }
                catch (MembershipCreateUserException e)
                {
                    ModelState.AddModelError("", ErrorCodeToString(e.StatusCode));
                }
            }

            // If we got this far, something failed, redisplay form
            return View("Login", mp);
        }

        //
        // POST: /Account/Disassociate

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Disassociate(string provider, string providerUserId)
        {
            string ownerAccount = OAuthWebSecurity.GetUserName(provider, providerUserId);
            ManageMessageId? message = null;

            // Only disassociate the account if the currently logged in user is the owner
            if (ownerAccount == User.Identity.Name)
            {
                // Use a transaction to prevent the user from deleting their last login credential
                using (var scope = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions { IsolationLevel = System.Transactions.IsolationLevel.Serializable }))
                {
                    bool hasLocalAccount = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
                    if (hasLocalAccount || OAuthWebSecurity.GetAccountsFromUserName(User.Identity.Name).Count > 1)
                    {
                        OAuthWebSecurity.DeleteAccount(provider, providerUserId);
                        scope.Complete();
                        message = ManageMessageId.RemoveLoginSuccess;
                    }
                }
            }

            return RedirectToAction("Manage", new { Message = message });
        }

        //
        // GET: /Account/Manage

        public ActionResult Manage(ManageMessageId? message)
        {
            LocalPasswordModel model = null;
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
                : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
                : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : "";
            ViewBag.HasLocalPassword = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
            ViewBag.ReturnUrl = Url.Action("Manage");
            if (TempData["OldPass"] != null && !string.IsNullOrEmpty(TempData["OldPass"].ToString()))
                {
                    model = new LocalPasswordModel { OldPassword = TempData["OldPass"].ToString() };
                }
            return View(model);
        }

        //
        // POST: /Account/Manage

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Manage(LocalPasswordModel model)
        {
            bool hasLocalAccount = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
            ViewBag.HasLocalPassword = hasLocalAccount;
            ViewBag.ReturnUrl = Url.Action("Manage");
            if (hasLocalAccount)
            {
                if (ModelState.IsValid)
                {
                    // ChangePassword will throw an exception rather than return false in certain failure scenarios.
                    bool changePasswordSucceeded;
                    try
                    {
                        changePasswordSucceeded = WebSecurity.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword);
                    }
                    catch (Exception)
                    {
                        changePasswordSucceeded = false;
                    }

                    if (changePasswordSucceeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.ChangePasswordSuccess });
                    }
                    else
                    {
                        ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                    }
                }
            }
            else
            {
                // User does not have a local password so remove any validation errors caused by a missing
                // OldPassword field
                ModelState state = ModelState["OldPassword"];
                if (state != null)
                {
                    state.Errors.Clear();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        WebSecurity.CreateAccount(User.Identity.Name, model.NewPassword);
                        return RedirectToAction("Manage", new { Message = ManageMessageId.SetPasswordSuccess });
                    }
                    catch (Exception e)
                    {
                        ModelState.AddModelError("", e);
                    }
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // POST: /Account/ExternalLogin

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            return new ExternalLoginResult(provider, Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/ExternalLoginCallback

        [AllowAnonymous]
        public ActionResult ExternalLoginCallback(string returnUrl)
        {
            AuthenticationResult result = OAuthWebSecurity.VerifyAuthentication(Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
            IDictionary<string, string> datas = result.ExtraData;
            if (!result.IsSuccessful)
            {
                return RedirectToAction("ExternalLoginFailure");
            }

            if (OAuthWebSecurity.Login(result.Provider, result.ProviderUserId, createPersistentCookie: false))
            {
                StoreSession(OAuthWebSecurity.GetUserName(result.Provider, result.ProviderUserId));
                return RedirectToLocal(returnUrl);
            }

            if (User.Identity.IsAuthenticated)
            {
                // If the current user is logged in add the new account
                OAuthWebSecurity.CreateOrUpdateAccount(result.Provider, result.ProviderUserId, User.Identity.Name);
                StoreSession(OAuthWebSecurity.GetUserName(result.Provider, result.ProviderUserId));
                return RedirectToLocal(returnUrl);
            }
            else
            {
                // User is new, ask for their desired membership name
                string loginData = OAuthWebSecurity.SerializeProviderUserId(result.Provider, result.ProviderUserId);
                ViewBag.ProviderDisplayName = OAuthWebSecurity.GetOAuthClientData(result.Provider).DisplayName;
                ViewBag.ReturnUrl = returnUrl;
                string userJsonData = GetResponseData("https://graph.facebook.com/me?fields=id,name,email,picture,middle_name,first_name,name_format,birthday,gender,last_name&access_token=" + datas["accesstoken"]);
                dynamic jsonDe = JsonConvert.DeserializeObject(userJsonData);
                string userEmail = "";// jsonDe["email"];
                string firstName = jsonDe["first_name"];
                string middleName = jsonDe["middle_name"];
                string birthday = jsonDe["birthday"];
                string gender = jsonDe["gender"];
                string lastName = jsonDe["last_name"];
                string userName = result.UserName.Replace(" ", "");
                string ProfilePicUrl = jsonDe["picture"]["data"]["url"];

                RegisterExternalLoginModel registerExternalLoginModel = new RegisterExternalLoginModel();
                registerExternalLoginModel.UserName = userName;
                registerExternalLoginModel.Email = userEmail;
                registerExternalLoginModel.ProfilePicUrl = ProfilePicUrl;
                registerExternalLoginModel.ExternalLoginData = loginData;
                registerExternalLoginModel.FirstName = firstName;
                registerExternalLoginModel.MiddleName = middleName;
                registerExternalLoginModel.LastName = lastName;


                return View("ExternalLoginConfirmation", registerExternalLoginModel);
            }
        }


        [AllowAnonymous]
        private ActionResult CheckMobileAlreadyExist(string mobileNumber)
        {
            if (dbContext.UserRegistrations.Where(m => m.MobileNo == mobileNumber).Count() > 0)
                return Content("Mobile Number is present in our database please click to get <a href='" + "/Account/GetOtp" + "'>Get OTP</a>");
            return Content("Not Found");
        }

        [HttpPost]
        private bool GetOtp(string mobileNumber)
        {
            if (dbContext.UserRegistrations.Where(m => m.MobileNo == mobileNumber).Count() > 0)
            {

            }
            return true;
        }
        internal string GetResponseData(string uri)
        {
            using (WebResponse wr = WebRequest.Create(uri).GetResponse())
            {
                using (StreamReader sr = new StreamReader(wr.GetResponseStream()))
                {
                    return sr.ReadToEnd();
                }
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLoginConfirmation(RegisterExternalLoginModel model, string returnUrl)
        {
            string provider = null;
            string providerUserId = null;

            if (User.Identity.IsAuthenticated || !OAuthWebSecurity.TryDeserializeProviderUserId(model.ExternalLoginData, out provider, out providerUserId))
            {
                return RedirectToAction("Manage");
            }

            if (ModelState.IsValid)
            {
                // Insert a new user into the database
                using (UsersContext db = new UsersContext())
                {
                    Logon user = db.Logons.FirstOrDefault(u => u.UserName.ToLower() == model.UserName.ToLower());
                    // Check if user already exists
                    if (user == null)
                    {
                        // Insert name into the profile table
                        db.Logons.Add(new Logon { UserName = model.UserName });
                        db.SaveChanges();

                        UserRegistration userRegistration = new UserRegistration();
                        userRegistration.UserName = model.MobileNumber;
                        userRegistration.FirstName = model.FirstName;
                        userRegistration.MiddleName = model.MiddleName;
                        userRegistration.LastName = model.LastName;
                        userRegistration.EmailId = model.Email;
                        userRegistration.MobileNo = model.MobileNumber;
                        userRegistration.CreatedOn = DateTime.Now;
                        userRegistration.Status = 1;

                        var webClient = new WebClient();
                        byte[] fileData = webClient.DownloadData(model.ProfilePicUrl);

                        userRegistration.ProfilePic = fileData;
                        dbContext.UserRegistrations.Add(userRegistration);
                        dbContext.SaveChanges();

                        OAuthWebSecurity.CreateOrUpdateAccount(provider, providerUserId, model.UserName);
                        OAuthWebSecurity.Login(provider, providerUserId, createPersistentCookie: false);
                        StoreSession(model.UserName);
                        return RedirectToLocal(returnUrl);
                    }
                    else
                    {
                        ModelState.AddModelError("UserName", "User name already exists. Please enter a different user name.");
                    }
                }
            }

            ViewBag.ProviderDisplayName = OAuthWebSecurity.GetOAuthClientData(provider).DisplayName;
            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // GET: /Account/ExternalLoginFailure

        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        [AllowAnonymous]
        [ChildActionOnly]
        public ActionResult ExternalLoginsList(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return PartialView("_ExternalLoginsListPartial", OAuthWebSecurity.RegisteredClientData);
        }

        [ChildActionOnly]
        public ActionResult RemoveExternalLogins()
        {
            ICollection<OAuthAccount> accounts = OAuthWebSecurity.GetAccountsFromUserName(User.Identity.Name);
            List<ExternalLogin> externalLogins = new List<ExternalLogin>();
            foreach (OAuthAccount account in accounts)
            {
                AuthenticationClientData clientData = OAuthWebSecurity.GetOAuthClientData(account.Provider);

                externalLogins.Add(new ExternalLogin
                {
                    Provider = account.Provider,
                    ProviderDisplayName = clientData.DisplayName,
                    ProviderUserId = account.ProviderUserId,
                });
            }

            ViewBag.ShowRemoveButton = externalLogins.Count > 1 || OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
            return PartialView("_RemoveExternalLoginsPartial", externalLogins);
        }

        [AllowAnonymous]
        public ActionResult GetOtp()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult GetOtp(OtpMessage otp, FormCollection formCollection)
        {
            string response;
            if (ModelState.IsValid)
            {
                if (otp != null && !String.IsNullOrEmpty(otp.MobileNumber) && String.IsNullOrEmpty(otp.OtpVerificationCode))
                {
                    UserRegistration userRegistration = dbContext.UserRegistrations.FirstOrDefault(m => m.MobileNo == otp.MobileNumber);
                    
                    if (userRegistration != null)
                    {
                        string otpUrl = ConfigurationManager.AppSettings["SmsUrl"];
                        int SmsMinTime = Convert.ToInt32(ConfigurationManager.AppSettings["SmsMinTime"]);
                        int SmsMaxTime = Convert.ToInt32(ConfigurationManager.AppSettings["SmsMaxTime"]);
                        string optMessage = ConfigurationManager.AppSettings["OtpMessage"];
                        if (new TimeSpan(DateTime.UtcNow.AddHours(5.5).Hour, DateTime.UtcNow.AddHours(5.5).Minute, DateTime.UtcNow.AddHours(5.5).Second).TotalHours > SmsMinTime
                            && new TimeSpan(DateTime.UtcNow.AddHours(5.5).Hour, DateTime.UtcNow.AddHours(5.5).Minute, DateTime.UtcNow.AddHours(5.5).Second).TotalHours < SmsMaxTime)
                        {
                            string otpCodeGenerated = Get6DigitRandomNumber();

                            Otp otpToInsert = new Otp();
                            otpToInsert.CreatedOn = DateTime.Now;
                            otpToInsert.IsActive=true;
                            otpToInsert.IsVerified=false;
                            otpToInsert.OtpCode = otpCodeGenerated;
                            otpToInsert.UserId = userRegistration.Id;

                            dbContext.Otps.Add(otpToInsert);
                            dbContext.SaveChanges();


                            string otpMessage = optMessage.Replace("[OtpCode]", otpCodeGenerated);
                            otpUrl = otpUrl.Replace("[MobileNumber]", "91" + otp.MobileNumber);
                            otpUrl = otpUrl.Replace("[Message]", otpMessage);
                            otpUrl = otpUrl.Replace("&amp;", "&");
                            response = new SmsUtility().SendSms(otpUrl);
                            if (String.IsNullOrEmpty(response) || response.Contains("exceeded time limit"))
                                ViewBag.Message = "OTP not sent. Please try between 9:00 AM to 8:00 PM";
                            else if (!String.IsNullOrEmpty(response) && new Regex(@"^[0-9-_]+$").IsMatch(response))
                            {
                                ViewBag.Message = "OTP sent successfully.";
                                ViewBag.IsOtpsent = true;
                            }
                        }
                        else
                        {
                            ViewBag.Message = "OTP not sent. Please try between 9:00 AM to 8:00 PM";
                        }
                    }
                    else
                    {
                        ViewBag.Message = "Mobile number is not registered. Please fill the registration form";
                    }
                }
                else if(otp != null && !String.IsNullOrEmpty(otp.MobileNumber) && !String.IsNullOrEmpty(otp.OtpVerificationCode))
                {
                    List<Otp> otpsDB = dbContext.Otps.Include("UserRegistration").Where(m => m.UserRegistration.MobileNo == otp.MobileNumber
                        && m.OtpCode == otp.OtpVerificationCode && m.IsActive == true && m.IsVerified == false).Select(m => m).ToList();
                    if (otpsDB != null && otpsDB.Count > 0)
                    {
                        otpsDB = dbContext.Otps.Include("UserRegistration").Where(m => m.UserRegistration.MobileNo == otp.MobileNumber
                        && m.IsActive == true && m.IsVerified == false).Select(m => m).ToList();
                        foreach (var otpDB in otpsDB)
                        {
                            otpDB.IsVerified = true;
                            otpDB.IsActive = false;
                            dbContext.Entry(otpDB).State = EntityState.Modified;
                        }
                        dbContext.SaveChanges();

                        UserRegistration userRegistration = otpsDB.FirstOrDefault().UserRegistration;
                        if(userRegistration != null)
                        {
                            int logonUserId = WebSecurity.GetUserId(otp.MobileNumber);
                            webpages_Membership webpages_MembershipExist = dbContext.webpages_Membership.FirstOrDefault(m => m.UserId == logonUserId);
                            if (webpages_MembershipExist == null)//!WebSecurity.UserExists(otp.MobileNumber)
                            {
                                WebSecurity.CreateAccount(otp.MobileNumber, GetRandomPassword());
                            }
                            else if(webpages_MembershipExist != null)
                            {
                                if (!WebSecurity.IsConfirmed(otp.MobileNumber))
                                {
                                    bool isConfirmed = WebSecurity.ConfirmAccount(otp.MobileNumber, webpages_MembershipExist.ConfirmationToken);
                                    if (isConfirmed && formCollection["hdnTokenKey"] != null && !String.IsNullOrEmpty(formCollection["hdnTokenKey"]))
                                    {
                                        WebSecurity.Login(otp.MobileNumber, formCollection["hdnTokenKey"].ToString(), false);
                                        StoreSession(otp.MobileNumber);
                                        return RedirectToAction("Index", "Home");
                                    }
                                    else
                                    {
                                        ViewBag.Message = "There is some problem while setting up your account.Please reload the page and reset your password";
                                    }
                                }
                                else
                                {
                                    string passwordResetToken = WebSecurity.GeneratePasswordResetToken(otp.MobileNumber);
                                    string newPassword = GetRandomPassword();
                                    bool passwordChanged = WebSecurity.ResetPassword(passwordResetToken, newPassword);
                                    if (passwordChanged)
                                    {
                                        WebSecurity.Login(otp.MobileNumber, newPassword, false);
                                        StoreSession(otp.MobileNumber);
                                        TempData["OldPass"] = newPassword;
                                        return RedirectToAction("Manage");
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    ViewBag.Message = "Please enter 10 digit mobile number";
                }
            }
            return View(otp);
        }

        private string GetRandomPassword()
        {
            return System.IO.Path.GetRandomFileName().Replace(".", "");
        }

        void client_DownloadDataCompleted(object sender, DownloadDataCompletedEventArgs e)
        {
            if (e.Error == null && e.Result != null)
            {
                ViewBag.Message = "OTP sent successfully";
            }
            else
            {
                ViewBag.Message = "Error sending OTP";
            }
        }

        void client_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)
        {
            if (e.Error == null && e.Result != null)
            {
                ViewBag.Message = "OTP sent successfully";
            }
            else
            {
                ViewBag.Message = "Error sending OTP";
            }
        }

        private string Get6DigitRandomNumber()
        {
            Random random = new Random();
            string otp = "";
            for (int i = 0; i < 6; i++)
            {
                otp += random.Next(0, 9);
            }
            return otp;
        }

        #region Helpers
        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
        }

        internal class ExternalLoginResult : ActionResult
        {
            public ExternalLoginResult(string provider, string returnUrl)
            {
                Provider = provider;
                ReturnUrl = returnUrl;
            }

            public string Provider { get; private set; }
            public string ReturnUrl { get; private set; }

            public override void ExecuteResult(ControllerContext context)
            {
                OAuthWebSecurity.RequestAuthentication(Provider, ReturnUrl);
            }
        }

        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }


        #endregion
    }
}
