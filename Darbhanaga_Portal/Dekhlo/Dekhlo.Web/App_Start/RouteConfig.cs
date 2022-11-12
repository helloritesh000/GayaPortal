using Dekhlo.Web.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Dekhlo.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("favicon.ico");
            //routes.Add("WithTitle", new SeoFriendlyRoute("Home/{action}/{id}",
            //new RouteValueDictionary(new { controller = "Home", action = "Index", id = UrlParameter.Optional }),
            //new RouteValueDictionary(new { id = @"\d+" }),
            //new MvcRouteHandler()));

            routes.MapRoute(
             "Sitemap",
             "sitemap.xml",
              new { controller = "Home", action = "SitemapXml" }
             );

            routes.MapRoute(
             "Robot",
             "robots.txt",
              new { controller = "Home", action = "RobotsText" }
             );

            routes.MapRoute(
                name: "WithTitle",
                url: "Home/{action}/{id}/{title}/{type}", // URL 
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional, title = UrlParameter.Optional, type = UrlParameter.Optional }, // URL Defaults 
                constraints: new { id = @"\d+" }
                // URL Constraints );
                );

            routes.MapRoute(
                name: "WithTitleType",
                url: "Home/{action}/{type}", // URL 
                defaults: new { controller = "Home", action = "Index", type = UrlParameter.Optional } // URL Defaults 
                // URL Constraints );
                );

            //routes.MapRoute(
            //    name: "WithTitle",
            //    url: "Home/{action}/{id}/{title}", // URL 
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional, title = UrlParameter.Optional }, // URL Defaults 
            //    constraints: new { id = @"\d+" }
            //    // URL Constraints );
            //    );

            routes.MapRoute(
                name: "WithoutTitle",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            //routes.MapRoute(
            //    name: "WithTitle",
            //    url: "{controller}/{action}/{id}/{title}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional, title = UrlParameter.Optional }
            //);
        }
    }
}