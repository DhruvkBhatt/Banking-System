﻿using System;
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
    public partial class interest_change : System.Web.UI.Page
    {
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["my_account_no"] == null) { Response.Redirect("../loginPage.aspx?ReturnUrl=Admin/interest_change.aspx"); }
        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}