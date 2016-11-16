using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_S_E.Admin
{
    public partial class Add_account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("../loginPage.aspx"); }
        }
    }
}