using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Dekhlo.Web.Models
{
    public class OtpMessage
    {
        [Display(Name = "Enter your mobile number")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "Please enter a 10 digit mobile number")]
        [MaxLength(10, ErrorMessage = "Please enter a 10 digit mobile number")]
        [Required(ErrorMessage = "Please enter your mobile nummber to get OTP")]
        public string MobileNumber { get; set; }

        [Display(Name = "Enter OTP Verification Code")]
        public string OtpVerificationCode { get; set; }
    }
}