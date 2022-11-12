using Dekhlo.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Dekhlo.Web.Controllers
{
    public class HandleErrorCustom : HandleErrorAttribute
    {
        private PORTALEntitiy db = new PORTALEntitiy();
        public override void OnException(ExceptionContext filterContext)
        {
            try
            {
                string action = filterContext.RouteData.Values["action"].ToString();
                string controller = filterContext.RouteData.Values["controller"].ToString();
                string methodType = filterContext.HttpContext.Request.HttpMethod;
                Exception exception = filterContext.Exception;
                string userId = (filterContext.HttpContext != null && filterContext.HttpContext.User != null)
                    ? filterContext.HttpContext.User.Identity.Name : "";
                if (exception != null)
                {
                    db.ExceptionLoggers.Add(new ExceptionLogger
                    {
                        ExceptionPath = "Action : " + action + ", Controller : " + controller + ", Type : " + methodType,
                        ExceptionMessage = exception.Message,
                        ExceptionStackTrace = exception.StackTrace,
                        ExceptionLoggedBy = userId,
                        ExceptionLoggedOn = DateTime.Now
                    });
                    db.SaveChanges();
                }
            }
            catch (Exception)
            {

            }
            //filterContext.Result = new ViewResult { View = System.Web.Mvc.view };
            base.OnException(filterContext);
        }
    }
}