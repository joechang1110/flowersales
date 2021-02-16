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

namespace SCard
{
    /// <summary>
    /// orderList 的摘要说明。
    /// </summary>
    public partial class myFav : System.Web.UI.Page
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {

 
        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {


            if (Session["User"] != null)
            {
                string Pid = Request.QueryString["id"].ToString();
                string tblUser = (String)Session["User"];
                string sql = "insert into [tblLeaveWord](UserName,Pid,isNote) values ( '" + tblUser + "', '" + Pid + "', '" + TextBox1.Text + "')";

                DBConn myDB = new DBConn();
                myDB.ExecuteNonQuery(sql);               
                myDB.Close();
                Response.Redirect("productDisplay.aspx?id=" + Request.QueryString["id"].ToString());
               
            }
            else
            {
                Response.Write("<script>alert('未登陆无法评论~');</script>");
            }
           

        }
}
}
