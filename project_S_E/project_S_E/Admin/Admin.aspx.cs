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
    public partial class Admin_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("../loginPage.aspx"); }
            Label1.Text = "";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.Visible = true;
        }

        protected void btnint_Click(object sender, EventArgs e)
        {
            savingcalint();
            curint();
        }
        private void savingcalint()
        {
            
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Account_type where Account_type_no = 's';", con);
                //cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                con.Open();

                float interest = 0;
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        
                        try
                        {
                            interest = float.Parse((string)rdr["Interest"].ToString());
                        }
                        catch { }
                        interest = interest / 100;
                       // cmd.Cancel();
                        // cmd = new SqlCommand("select * from Account_info where Account_no = @Account_no", con);
                        //cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                        //con.Open();
                        //rdr = cmd.ExecuteReader();
                    }
                }
                    SqlCommand cmd1 = new SqlCommand
                            ("Update Account_info set Balance = Balance + " + interest + "*Balance where Account_type_no = 's'", con);
                    int i=cmd1.ExecuteNonQuery();
                    //..cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                    
                }
            }

        private void curint()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Account_type where Account_type_no = 'c';", con);
                //cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                con.Open();

                float interest = 0;
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {

                        try
                        {
                            interest = float.Parse((string)rdr["Interest"].ToString());
                        }
                        catch { }
                        interest = interest / 100;
                        // cmd.Cancel();
                        // cmd = new SqlCommand("select * from Account_info where Account_no = @Account_no", con);
                        //cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                        //con.Open();
                        //rdr = cmd.ExecuteReader();
                    }
                }
                SqlCommand cmd1 = new SqlCommand
                        ("Update Account_info set Balance = Balance + " + interest + "*Balance where Account_type_no = 'c'", con);
                int i = cmd1.ExecuteNonQuery();
                //..cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                Label1.Text = "Successfully updated";
            }
        }

        protected void btnCharge_Click(object sender, EventArgs e)
        {
            Response.Redirect("interest_change.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_account.aspx");
        }

        protected void btndeb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Debit_req.aspx");
        }
    }
    }
