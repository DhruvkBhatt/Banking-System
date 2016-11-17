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
namespace project_S_E
{
    public partial class loginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["my_account_no"] = txtAccno.Text;
        }
        private bool AuthenticateUser(string username, string password)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Account_info where Account_no =@Account_no and Password=@password", con);
                cmd.Parameters.AddWithValue("@Account_no", txtAccno.Text);
                cmd.Parameters.AddWithValue("@password", txtPWD.Text);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                Session["my_account_no"] = txtAccno.Text;
                if (rdr.Read())
                {
                    
                    if (DropDownList1.SelectedItem.ToString().Equals("saving")) {
                        Session["account_type_no"] = 's';
                    }
                    else if (DropDownList1.SelectedItem.ToString().Equals("current"))
                    {
                        Session["account_type_no"] = 'c';
                    }
                    else
                    {
                        Session["account_type_no"] = 's';
                    }
                    
                    if ((int)rdr["New_user"] == 1)
                    {

                       Response.Redirect("One_time_password.aspx");
                       // return true;
                    }

                    return true;
                }
                else
                {
                    return false;
                }
                con.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {





                if (AuthenticateUser(txtAccno.Text, txtPWD.Text))
                {
                    if (string.Compare(txtAccno.Text, "admin1")==0)
                    {
                       // Response.Redirect("~/Admin/Admin.aspx");
                    }
                    FormsAuthentication.RedirectFromLoginPage(txtAccno.Text,chkBoxRememberMe.Checked);
                }
                else
                {
                    Label1.Text = "Invalid User Name and/or Password";
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Account No and/or Password')</script>");
                }

            }
        }


    }
}
