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
    public partial class Loan_req : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx"); }

        }

        protected void btnreq_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                //Session["my_account_no"] = 1234;
                try
                {
                string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Loan_req (Account_no,Loan_Reason,Amount) VALUES(@Account_no,@reason,@amount) ", con);
                    cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                    cmd.Parameters.AddWithValue("@amount", txtamount.Text);
                    cmd.Parameters.AddWithValue("@reason", textreason.Text);
                    cmd.ExecuteNonQuery();
                }
                    Label1.Text = "You successfully requested loan";
                }
                catch
                {
                    Label1.Text = "request again";
                }
            }
        }
    }
    }
