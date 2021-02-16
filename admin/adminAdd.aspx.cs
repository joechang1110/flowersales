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
using System.Web.Security;

namespace SCard.admin
{
	/// <summary>
	/// adminAdd 腔晡猁佽隴﹝
	/// </summary>
	public partial class adminAdd : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //癹潰脤
            if( Session["adminName"]==null || Session["adminName"].ToString() == String.Empty )
            {
                Response.Write("<font color=#ff0000>对不起,您没足够权限访问此页!!</font>");
                Response.Write("<a href=index.aspx >重新登陆</a>");
                Response.End();
                return;
            }
		}

		

        private bool checkAdmin( string strAdmin )
        {
            bool bTemp = false;
            DBConn myDB = new DBConn();
            string mySql = "select * from admin where username='" + strAdmin + "'";
            SqlDataReader mydr = myDB.getDataReader( mySql );
            if( mydr.Read() )
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

        protected void btnAdd_Click(object sender, System.EventArgs e)
        {
            string strName = txtName.Text;
            string strPassword = txtPassword.Text;
            string strRPassword = txtRPassword.Text;
            
            if( strName == String.Empty )
            {
                Response.Write("<script>");
                Response.Write("alert('请输入管理名!!!');");
                Response.Write("</script>");
                return;
            }
            if( strPassword == String.Empty )
            {
                Response.Write("<script>");
                Response.Write("alert('请输入密码!!!');");
                Response.Write("</script>");
                return;
            }
            if( strRPassword == String.Empty )
            {
                Response.Write("<script>");
                Response.Write("alert('请输入确认密码!!!');");
                Response.Write("</script>");
                return;
            }

            if( checkAdmin( strName ) )
            {
                Response.Write("<script>");
                Response.Write("alert('管理员[ " + strName + " ]已经存在!!!');");
                Response.Write("</script>");
                return;
            }
            if( txtPassword.Text.Length < 6 )
            {
                Response.Write("<script>");
                Response.Write("alert('密码长度至少6位!!!');");
                Response.Write("</script>");
                return;
            }

           // strPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "MD5"); 
           
            DBConn myDB = new DBConn();
            string mySql = "INSERT INTO [Admin]([username],[password],[addtime]) VALUES('" + strName + "','" + strPassword + "','" + DateTime.Now + "')";
            myDB.ExecuteNonQuery( mySql );
            myDB.Close();

            txtName.Text = "";

            Response.Write("<script>");
            Response.Write("alert('管理员添加成功!!!');");
            Response.Write("</script>");
            
        }
	}
}
