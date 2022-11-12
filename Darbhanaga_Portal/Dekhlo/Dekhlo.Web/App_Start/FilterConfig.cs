using Dekhlo.Web.Controllers;
using System.Web;
using System.Web.Mvc;

namespace Dekhlo.Web
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute{ View="Error"});
            //filters.Add(new HandleErrorCustom());
            filters.Add(new AuthorizeAttribute());
        }
    }
}