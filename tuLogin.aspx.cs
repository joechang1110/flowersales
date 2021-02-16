using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.Configuration;

namespace SCard
{
    public partial class tuLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            Session["User"] = null;
                Response.Write("<script>parent.location.href='index.aspx';</script>");
                  

        }
    }
}