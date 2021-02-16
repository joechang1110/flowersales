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

namespace SCard.admin
{
	/// <summary>
	/// messageDetail 的摘要说明。
	/// </summary>
	public partial class messageDetail : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{
            if( Session["adminName"]==null || Session["adminName"].ToString() == String.Empty )
            {
                Response.Write("<font color=#ff0000>对不起,您没足够权限访问此页!!</font>");
                Response.Write("<a href=index.aspx>重新登陆</a>");
                Response.End();
                return;
            }

            if( !IsPostBack )
            {
                string strID = Request.QueryString["id"].ToString();//由messageelist转入详细信息的id
                alterState( strID ); //改变信息 状态
                getData( strID ); //获取信息内容
            }
		}

        private void alterState( string strID )
        {
            string mySql = "update message set MState=1 where MState<>1 and MID=" + strID;
            DBConn myDB = new DBConn();
            myDB.ExecuteNonQuery(mySql);
            myDB.Close();
        }

        private void getData( string strID )
        {
            string mySql = "select * from message where MID=" + strID;
            DBConn myDB = new DBConn(); 
            SqlDataReader mydr  = myDB.getDataReader( mySql );
            if( mydr.Read() )
            {
                lblUName.Text = mydr["UName"].ToString();
                lblUPhone.Text = mydr["UPhone"].ToString();
                string strUEmail = mydr["UEmail"].ToString();
                lblUEmail.Text = "<a href='mailto:" + strUEmail + "'>" + strUEmail + "</a>";
                lblMTitle.Text = mydr["MTitle"].ToString();
                txtMContent.Text = CleanString.htmlOutputText( mydr["MContent"].ToString() ); 
                lblDate.Text = mydr["Pubdate"].ToString();
            }
           
            mydr.Close();
            myDB.Close();
        }

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

        }
		#endregion
	}
}
