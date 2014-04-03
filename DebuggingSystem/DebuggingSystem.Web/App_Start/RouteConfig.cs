using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DebuggingSystem.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Delete bug",
                url: "Projects/{action}/{bugId}",
                defaults: new
                {
                    controller = "Projects"
                }
                );

            routes.MapRoute(
                name: "Delete user",
                url: "Administration/{action}/{Id}",
                defaults: new
                {
                    controller = "Administration"
                }
                );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}