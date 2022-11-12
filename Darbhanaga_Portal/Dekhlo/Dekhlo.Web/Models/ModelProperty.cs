
namespace Dekhlo.Web.Models
{
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class ModelProperty
    {
        public UserRegistration ObjUserRegistration { get; set; }
        public Post ObjPost { get; set; }
        public Pvc ObjPvc { get; set; }

        public LoginModel ObjLoginModel { get; set; }
        public RegisterModel ObjRegisterModel { get; set; }

        public Memory ObjMemory { get; set; }
        public SearchYourNeed ObjSearchYourNeed { get; set; }
        public SearchYourNeedLink ObjSearchYourNeedLink { get; set; }

        public PageContent ObjPageContent { get; set; }
        public Enquiry ObjEnquiry { get; set; }
       

    }
}