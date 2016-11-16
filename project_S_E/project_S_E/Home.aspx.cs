using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_S_E
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx"); }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ch_pwd.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_detail.aspx");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Statement.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loan_req.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration_page.aspx");
            
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transaction.aspx");
            
        }
    }
}