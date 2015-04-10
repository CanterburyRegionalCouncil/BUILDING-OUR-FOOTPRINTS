using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Maps.Capture.BuildingFootprint.Startup))]
namespace Maps.Capture.BuildingFootprint
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
