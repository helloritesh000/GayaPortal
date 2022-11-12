using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace Dekhlo.SmsService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class SmsGateway : ISmsGateway
    {
        public string SendOtp(string otpUrl)
        {
            string response = "";
            try
            {
                HttpWebRequest webReq = (HttpWebRequest)WebRequest.Create(new Uri(otpUrl, UriKind.Absolute));
                webReq.Method = "GET";
                HttpWebResponse webResponse = (HttpWebResponse)webReq.GetResponse();
                //I don't use the response for anything right now. But I might log the response answer later on.   
                Stream answer = webResponse.GetResponseStream();
                StreamReader _recivedAnswer = new StreamReader(answer);
                response = _recivedAnswer.ReadToEnd();
                if (String.IsNullOrEmpty(response))
                    response = otpUrl;
            }
            catch (Exception ex)
            {
                int res = LogException(ex);
                response = "Errored";
            }
            return response;
        }

        private int LogException(Exception ex)
        {
            int result = 0;
            try
            {
                string DBConnection = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(DBConnection))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "INSERT INTO [dbo].[ExceptionLogger] ([ExceptionPath],[ExceptionMessage],[ExceptionStackTrace],[ExceptionLoggedBy],[ExceptionLoggedOn]) VALUES (@ExceptionPath,@ExceptionMessage,@ExceptionStackTrace,@ExceptionLoggedBy,@ExceptionLoggedOn)";
                        cmd.Parameters.AddWithValue("@ExceptionPath", "Dekhlo.SmsService.SmsGateway.SendOtp");
                        cmd.Parameters.AddWithValue("@ExceptionMessage", ex.Message);
                        cmd.Parameters.AddWithValue("@ExceptionStackTrace", ex.StackTrace);
                        cmd.Parameters.AddWithValue("@ExceptionLoggedBy", "system");
                        cmd.Parameters.AddWithValue("@ExceptionLoggedOn", DateTime.Now);
                        result = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception){}
            return result;
        }
    }
}
