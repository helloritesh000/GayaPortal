using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Web.WebPages.OAuth;
using Dekhlo.Web.Models;

namespace Dekhlo.Web
{
    public static class AuthConfig
    {
        public static void RegisterAuth()
        {
            // To let users of this site log in using their accounts from other sites such as Microsoft, Facebook, and Twitter,
            // you must update this site. For more information visit http://go.microsoft.com/fwlink/?LinkID=252166

            //OAuthWebSecurity.RegisterMicrosoftClient(
            //    clientId: "",
            //    clientSecret: "");

            //OAuthWebSecurity.RegisterTwitterClient(
            //    consumerKey: "",
            //    consumerSecret: "");

            OAuthWebSecurity.RegisterFacebookClient(
                appId: "758786684223438",
                appSecret: "97b237b70e5835b952c6b94da8218042");

            OAuthWebSecurity.RegisterGoogleClient();
            
               // clientId:"553484241712-lf1l0cjtvca9haoa3q4l8spq8emk3ujj.apps.googleusercontent.com",
            //clientSecret:"0uVzyRyIN3Twdl2vm2ebjEus"
        }
    }
}
