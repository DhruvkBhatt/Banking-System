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
    public partial class Debit_req : System.Web.UI.Page
    {
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
            Session.Abandon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx?ReturnUrl=Debit_req.aspx"); }
            Label2.Text = "";
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {


            label1.Text = Calendar2.SelectedDate.ToLongDateString();


            Calendar2.Visible = false;
            Session["date"] = 1;


        }
        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.CompareTo(DateTime.Today) < 0 || e.Day.IsWeekend || e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { int a=Int32.Parse((Session["date"].ToString())) ; }
           catch
            {
                Label2.Text = "Select date first";

            }
            try
            {
                if (Int32.Parse((Session["date"].ToString())) == 1)
                {
                    int parsedValue;
                    if (!int.TryParse(TextBox2.Text, out parsedValue))
                    {
                        Label2.Text = "This is a number only field";
                        return;
                    }
                    // Session["my_account_no"]=1234;
                    try
                    {
                        string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(cs))
                        {

                            con.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO Debit_req (Ammount,Date,Req_account) VALUES(@amount,@date,@Account_no); ", con);
                            cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());
                            cmd.Parameters.AddWithValue("@amount", TextBox2.Text);
                            cmd.Parameters.AddWithValue("@date", label1.Text);
                            cmd.ExecuteNonQuery();
                            Label2.Text = "request Succesful";
                        }
                    }
                    catch
                    {
                        Label2.Text = "request again";
                    }

                }
                else
                {
                    Label2.Text = "Select date first";
                }
            }
            catch { Label2.Text = "Select date first"; }        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
