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
    public partial class uLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool isAdmin(string strAdmin, string strPassword)
        {
            bool bTemp = false;

            DBConn myDB = new DBConn();
            string mySql = "select * from tblUser where UserName='" + strAdmin + "' and Psw='" + strPassword + "'";
            SqlDataReader mydr = myDB.getDataReader(mySql);
            if (mydr.Read())
            {
                bTemp = true;
            }
            else
            {
                bTemp = false;
            }

            mydr.Close();
            myDB.Close();

            return bTemp;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strAdminname = tname.Text;
            string strAdminPW = tpass.Text;

            if (strAdminname == String.Empty || strAdminPW == String.Empty)
            {
                Response.Write("<script>");
                Response.Write("alert('用户名/密码 不能为空!!!');");
                Response.Write("</script>");
                return;
            }


            if (isAdmin(strAdminname, strAdminPW))
            {
                Session["User"] = strAdminname;
                Response.Write("<script>alert('成功登陆');</script>");
                Response.Write("<script>parent.location.href='index.aspx';</script>");
            }
            else
            {
                Response.Write("<script>");
                Response.Write("alert('用户名/密码 不正确!!!');");
                Response.Write("</script>");
            }

        }
    }
}