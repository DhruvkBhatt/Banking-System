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
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx?ReturnUrl=Transaction.aspx"); }
            // Session["my_account_no"] = 1234;
            if (!IsPostBack)
            {

                getvalue1();

            }

            //romove sessiona value
            Session["my_account_no"] = 1234;
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
        private void getvalue1()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Account_info where Account_no = @Account_no", con);
                cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    if (rdr["Account_no"].ToString() == Session["my_account_no"].ToString())
                    {
                        bal.Text = "Now Your bal is" + rdr["Balance"].ToString();

                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (chkamt() != -1 && chkacc() !=-1)
            {
                string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    // Begin a transaction. The connection needs to 
                    // be open before we begin a transaction
                    SqlTransaction transaction = con.BeginTransaction();
                    int amount = 0;
                    try
                    {
                        try
                        {
                            amount = Int32.Parse(txtAmt.Text.ToString());
                        }
                        catch {
                            Label2.Text = "Enter text in amount";
                        }

                        // Associate the first update command with the transaction
                        SqlCommand cmd = new SqlCommand
                           ("Update Account_info set Balance = Balance - " + amount + " where Account_no = @account_no2", con, transaction);

                        cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                       

                        cmd.ExecuteNonQuery();
                        // Associate the second update command with the transaction
                       
                       
                        cmd = new SqlCommand
                          ("Update Account_info set Balance = Balance + " + amount + " where Account_no = @account_no1", con, transaction);
                        cmd.Parameters.AddWithValue("@account_no1", txtAcc.Text);
                        cmd.ExecuteNonQuery();



                        //store data in database
                        // Associate the third update command with the transaction
                        cmd = new SqlCommand
                          ("INSERT INTO Transaction_db(Amount, Reciver_Account_no, Sender_account_no) VALUES(" + amount + " ,@account_no1,@account_no2)", con, transaction);
                        cmd.Parameters.AddWithValue("@account_no2", Session["my_account_no"].ToString());
                        cmd.Parameters.AddWithValue("@account_no1", txtAcc.Text);
                        cmd.ExecuteNonQuery();
                        // If all goes well commit the transaction
                        transaction.Commit();
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "Transaction successfully Done";
                    }
                    catch
                    {
                        // If anything goes wrong, rollback the transaction
                        transaction.Rollback();
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Transaction rolled back";
                    }
                    finally { getvalue1(); }
                }
            }
        }
        private int chkamt()
        {
            // For Checking Ammount is sufficient or not
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlCommand cmd;
            SqlDataReader rdr;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("select * from Account_info where Account_no = @Account_no", con);
                cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    if (rdr["Account_no"].ToString() == Session["my_account_no"].ToString())
                    {
                        int temo = Int32.Parse(rdr["Balance"].ToString());
                        if (temo < Int32.Parse(txtAmt.Text.ToString()))
                        {
                            Label2.ForeColor = System.Drawing.Color.Red;
                            Label2.Text = "Insuffecient Balance";
                            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('insuffecient bal')</script>");
                            return -1;
                        }
                        else { return 0; }
                    }
                }
                return 0;
            }
        }
        private int chkacc()
        {
            //for checking account no
            string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlCommand cmd;
           
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("select * from Account_info where Account_no =@Account_no ", con);
                cmd.Parameters.AddWithValue("@Account_no", txtAcc.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
               
                if (dt.Rows.Count > 0)
                {
                    return 0;
                }
                else
                {
                    Label2.Text = "Invalid Account Number";
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Account No ')</script>");
                    return -1;
                }
            }
        }
        private void str()
        {

        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}