using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace project_S_E
{
    public partial class Ch_pwd : System.Web.UI.Page
    {
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx?ReturnUrl=Ch_pwd.aspx"); }
            // Session["my_account_no"] = 1234;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(chkpwd())
            {
                string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand
                           ("Update Account_info set Password=@password where Account_no = @account_no2", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Password succesfully changed";
                }
            }

        }
        private bool chkpwd()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Account_info where Account_no =@Account_no and Password=@password", con);
                cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                cmd.Parameters.AddWithValue("@password", txtoldpwd.Text);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                        return true;
                }
                lblMessage.Text = "Invalid Old Password";
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Password')</script>");

                return false;
                }
        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}