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
    public partial class Statement : System.Web.UI.Page
    {
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("loginPage.aspx?ReturnUrl=Statement.aspx"); }
            // Session["my_account_no"] = 1234;
            //     string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            //    using (SqlConnection con = new SqlConnection(cs))
            //    {
            //        SqlCommand cmd = new SqlCommand(" select Amount, Reciver_Account_no, Transaction_date from Transaction_db where Sender_account_no = @Account_no;", con);
            //        cmd.Parameters.AddWithValue("@Account_no", Session["my_account_no"].ToString());

            //        con.Open();
            //        SqlDataReader rdr = cmd.ExecuteReader();

            //        if (rdr.Read())
            //        {
            //           // GridView1.DataBind = rdr;
            //            if ((int)rdr["new_user"] == 1)
            //            {

            //                Response.Redirect("One_time_password.aspx");
            //            }


            //        }
            //        else
            //        {

            //        }
            //    }
        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}