using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dekhlo.Web.Models
{
    public class StatusEnum
    {
        public const string Active = "Active";
        public const string Inactive = "Inactive";
        public const string Blocked = "Blocked";
        public const string Draft = "Draft";
        public const string Published = "Published";
        public const string Created = "Created";
        public const string Inprogress = "Inprogress";
        public const string Resolved = "Resolved";

    }

    public class PostTypeEnum
    {
        public const string Free = "Free";
        public const string Paid = "Paid";

    }

    //public enum UserTypeEnum
    //{
    //    Carpenter = "Carpenter",
    //    Plumber = "Plumber",
    //    Electrician = "Electrician",
    //    Pandit = "Pandit",
    //    GeneralStaff = "GeneralStaff",
    //    ShoeMaker = "ShoeMaker",
    //    Cook = "Cook",
    //    TentHouse = "TentHouse",
    //    ToiletCleaningStaff = "ToiletCleaningStaff",
    //    Driver = "Driver",

    //}
}