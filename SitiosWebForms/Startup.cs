using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SitiosWebForms.Startup))]
namespace SitiosWebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
