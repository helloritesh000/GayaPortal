using Dekhlo.Web.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Xml.Linq;


namespace Dekhlo.Web.Seo
{
    public class SiteMapGenerate
    {
        PORTALEntitiy db = new PORTALEntitiy();
        public IReadOnlyCollection<SitemapNode> GetSitemapNodes(UrlHelper urlHelper)
        {
            RouteCollection c = new RouteCollection();

            List<SitemapNode> nodes = new List<SitemapNode>();
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.Index, id = UrlParameter.Optional }),
                    Frequency=SitemapFrequency.Hourly,
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.AboutUs, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.SoftwareDevelopment, id = UrlParameter.Optional }),
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.BookBusTicket, id = UrlParameter.Optional }),
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.BookHotel, id = UrlParameter.Optional }),
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.BookMovieTicket, id = UrlParameter.Optional }),
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.ShareYourMemories, id = UrlParameter.Optional }),
                    Frequency = SitemapFrequency.Daily,
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.PopularSearches, id = UrlParameter.Optional }),
                    Frequency = SitemapFrequency.Hourly,
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.ContactUs, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.EmailUs, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.CancellationReturns, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.FAQ, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.Payments, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.FeatureAds, id = UrlParameter.Optional }),
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.JoinDarbhanngaCity, id = UrlParameter.Optional }),
                    Priority = 1
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.TermsAndCondition, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.AdvertiseWithUs, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.ImportantLinks, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.LocationWhereWeAre, id = UrlParameter.Optional }),
                    Priority = 0.8
                });
            nodes.Add(
                new SitemapNode()
                {
                    Url = urlHelper.AbsoluteRouteUrl("WithoutTitle", new { controller = ControllerName.Home, action = HomeControllerAction.PostFreeAddListing, id = UrlParameter.Optional }),
                    Frequency = SitemapFrequency.Hourly,
                    Priority = 1
                });

            List<Memory> memories = db.Memories.ToList();
            if (memories != null && memories.Count > 0)
            {
                nodes.AddRange(memories.Where(m => !String.IsNullOrEmpty(m.Title)).Select(m =>
                    new SitemapNode()
                    {
                        Url = urlHelper.AbsoluteRouteUrl("WithTitle", new { controller = ControllerName.Home, action = HomeControllerAction.ShareYourMemoriesSingle, id = m.Id, title = m.Title }),
                        Priority = 1
                    }).ToList());


                nodes.AddRange(memories.Where(m => !String.IsNullOrEmpty(m.Title)).Select(m =>
                    new SitemapNode()
                    {
                        Url = urlHelper.AbsoluteRouteUrl("WithTitle", new { controller = ControllerName.Home, action = HomeControllerAction.ShareYourMemoryEdit, id = m.Id, title = m.Title }),
                        Priority = 1
                    }).ToList());
            }

            List<SearchYourNeed> searchYourNeeds = db.SearchYourNeeds.Include("SearchYourNeedLink").ToList();
            if (searchYourNeeds != null && searchYourNeeds.Count > 0)
            {
                nodes.AddRange(searchYourNeeds.Where(m => !String.IsNullOrEmpty(m.SearchYourNeedLink.LinkType)).Select(m =>
                    new SitemapNode()
                    {
                        Url = urlHelper.AbsoluteRouteUrl("WithTitleType", new { controller = ControllerName.Home, action = HomeControllerAction.SearchYourNeeds, type = m.SearchYourNeedLink.LinkType }),
                        Frequency = SitemapFrequency.Hourly,
                        Priority = 1
                    }).ToList());
            }

            List<Post> posts = db.Posts.ToList();
            if (searchYourNeeds != null && searchYourNeeds.Count > 0)
            {
                nodes.AddRange(posts.Where(m => !String.IsNullOrEmpty(m.PostTitle)).Select(m =>
                    new SitemapNode()
                    {
                        Url = urlHelper.AbsoluteRouteUrl("WithTitle", new { controller = ControllerName.Home, action = HomeControllerAction.PostFreeEditListing, id = m.Id, title = m.PostTitle }),
                        Priority = 1
                    }).ToList());

                nodes.AddRange(posts.Where(m => !String.IsNullOrEmpty(m.PostTitle)).Select(m =>
                    new SitemapNode()
                    {
                        Url = urlHelper.AbsoluteRouteUrl("WithTitle", new { controller = ControllerName.Home, action = HomeControllerAction.SinglePost, id = m.Id, title = m.PostTitle }),
                        Priority = 1
                    }).ToList());
            }

            List<Cateogry> cateogries = db.Cateogries.ToList();
            if (cateogries != null && cateogries.Count > 0)
            {
                nodes.AddRange(cateogries.Where(m => !String.IsNullOrEmpty(m.CateogryName)).Select(m =>
                    new SitemapNode()
                    {
                        Url = urlHelper.AbsoluteRouteUrl("WithTitle", new { controller = ControllerName.Home, action = HomeControllerAction.CateogryWisePost, id = m.Id, title = m.CateogryName }),
                        Frequency = SitemapFrequency.Hourly,
                        Priority = 1
                    }).ToList());
            }
            //nodes.Add(
            //   new SitemapNode()
            //   {
            //       Url = urlHelper.AbsoluteRouteUrl("HomeGetAbout"),
            //       Priority = 0.9
            //   });
            //nodes.Add(
            //   new SitemapNode()
            //   {
            //       Url = urlHelper.AbsoluteRouteUrl("HomeGetContact"),
            //       Priority = 0.9
            //   });
            //foreach (int productId in productRepository.GetProductIds())
            //{
            //    nodes.Add(
            //       new SitemapNode()
            //       {
            //           Url = urlHelper.AbsoluteRouteUrl("ProductGetProduct", new { id = productId }),
            //           Frequency = SitemapFrequency.Weekly,
            //           Priority = 0.8
            //       });
            //}
            return nodes;
        }


        public string GetSitemapDocument(IEnumerable<SitemapNode> sitemapNodes)
        {
            XNamespace xmlns = "http://www.sitemaps.org/schemas/sitemap/0.9";
            XElement root = new XElement(xmlns + "urlset");

            foreach (SitemapNode sitemapNode in sitemapNodes)
            {
                XElement urlElement = new XElement(
                    xmlns + "url",
                    new XElement(xmlns + "loc", Uri.EscapeUriString(sitemapNode.Url)),
                    sitemapNode.LastModified == null ? null : new XElement(
                        xmlns + "lastmod",
                        sitemapNode.LastModified.Value.ToLocalTime().ToString("yyyy-MM-ddTHH:mm:sszzz")),
                    sitemapNode.Frequency == null ? null : new XElement(
                        xmlns + "changefreq",
                        sitemapNode.Frequency.Value.ToString().ToLowerInvariant()),
                    sitemapNode.Priority == null ? null : new XElement(
                        xmlns + "priority",
                        sitemapNode.Priority.Value.ToString("F1", CultureInfo.InvariantCulture)));
                root.Add(urlElement);
            }

            XDocument document = new XDocument(root);
            return document.ToString();
        }
    }
    public static class UrlHelperExtensions
    {
        public static string AbsoluteRouteUrl(
            this UrlHelper urlHelper,
            string routeName,
            object routeValues = null)
        {
            string scheme = urlHelper.RequestContext.HttpContext.Request.Url.Scheme;
            return urlHelper.RouteUrl(routeName, routeValues, scheme);
        }
    }
}