using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web.Security;
namespace project_S_E.Registration
{
    public partial class One_time_password : System.Web.UI.Page
    {
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx?ReturnUrl=One_time_password.aspx"); }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Session["my_account_no"] = 1234;//remove this line
                string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand
                           ("Update Account_info set Password=@password where Account_no = @account_no2", con);


                    
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand
                           ("Update Account_info set New_user = 0 where Account_no = @account_no2", con);
                    cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                    cmd.ExecuteNonQuery();
                }
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand
                        ("INSERT INTO User_db(Account_no, Account_type_no,Email_id) VALUES( @account_no2, @account_type_no,@email)", con);
                    cmd.Parameters.AddWithValue("@account_type_no", Session["account_type_no"].ToString());
                    cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.ExecuteNonQuery();
                }
                Response.Redirect("Registration_page.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid User Name and/or Password";
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Account No and/or Password')</script>");
            }
            
        }
    }
}