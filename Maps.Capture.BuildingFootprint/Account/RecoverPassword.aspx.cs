using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Maps.Capture.BuildingFootprint.Models;

namespace Maps.Capture.BuildingFootprint.Account
{
    public partial class RecoverPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RecoverPassword_Click(object sender, EventArgs e)
        {
            var manager = new UserManager();
            var user = manager.FindByEmail(Email.Text);

            if (user != null)
            {
                //var token = manager.GeneratePasswordResetToken(user.Id);
                //manager.SendEmail(user.Id, "Recover Password for Building our Footprints", "Token = " + token);
            }

            int i = 1;

            //var user = new ApplicationUser() { UserName = UserName.Text, School = school.Text, ClassYear = schoolYear.SelectedValue, FavouriteSubject = favouriteSubject.Text, Suburb = homeSuburb.SelectedValue, Email = UserName.Text, NickName = NickName.Text };
            //IdentityResult result = manager.Create(user, Password.Text);
            //if (result.Succeeded)
            //{
            //    IdentityHelper.SignIn(manager, user, isPersistent: false);
            //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else
            //{
            //    ErrorMessage.Text = result.Errors.FirstOrDefault();
            //}
        }


    }
}