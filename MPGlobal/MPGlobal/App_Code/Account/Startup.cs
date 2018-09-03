using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MPGlobal.Startup))]
namespace MPGlobal
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
