using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maps.Capture.BuildingFootprint
{
    public partial class Leaderboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Results.aspx");
            //PersonsSchoolLeaderboardSqlDataSource.SelectParameters["username"].DefaultValue = User.Identity.Name;
        }
    }
}