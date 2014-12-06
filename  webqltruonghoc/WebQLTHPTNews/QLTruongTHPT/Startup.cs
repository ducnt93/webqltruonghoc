using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QLTruongTHPT.Startup))]
namespace QLTruongTHPT
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
