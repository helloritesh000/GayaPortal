using Dekhlo.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;

namespace Dekhlo.Web.Controllers
{
    [HandleErrorCustom(View = "Error")]
    public class SmsUtility
    {
        private PORTALEntitiy db = new PORTALEntitiy();
        public string SendSms(string otpUrl)
        {
            string result = "";
            OtpService.SmsGatewayClient otpClient = new OtpService.SmsGatewayClient("BasicHttpBinding_ISmsGateway");
            result = otpClient.SendOtp(otpUrl);
            return result;
        }
    }
}