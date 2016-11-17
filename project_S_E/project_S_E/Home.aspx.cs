using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
namespace project_S_E
{
    public partial class Home : System.Web.UI.Page
    {
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx?ReturnUrl=Home.aspx"); }
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

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Debit_req.aspx");
        }

        protected void loan_req_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loan_req_status.aspx");
        }
    }
}