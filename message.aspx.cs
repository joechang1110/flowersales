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
	/// message 的摘要说明。
	/// </summary>
	public partial class message : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{

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

        protected void btnOK_Click(object sender, System.EventArgs e)
        {
            string strUName = txtUserName.Text.Trim();
            string strUPhone = txtUserPhone.Text.Trim();
            string strUEmail = txtEmail.Text.Trim();
            string strMTitle = txtTitle.Text.Trim();
            string strMContent = txtContent.Text.Trim();

            if( strUEmail == String.Empty || strMTitle == String.Empty || strMContent == String.Empty )
            {
                Response.Write("<script>");
                Response.Write("alert('请把必填项添上!!!');");
                Response.Write("</script>");
                return;
            }
            if( strMContent.Length > 300 )
            {
                Response.Write("<script>");
                Response.Write("alert('内容太长了..(300字以内)!!!');");
                Response.Write("</script>");
                return;
            }
            
            //防止恶意刷信息
            if( Session["messageCheck"] != null )
            {
                DateTime myDTime = (DateTime)Session["messageCheck"];
                if( myDTime.AddMilliseconds(30000) > DateTime.Now )
                {
                    Response.Write("<script>");
                    TimeSpan myTime = DateTime.Now - (DateTime)Session["messageCheck"];
                    Response.Write("alert('不能频繁提交,请在" + (30-myTime.Seconds) + "秒后继续!!!');");
                    Response.Write("</script>");
                    return;
                } 
            }

            //过滤输入字符串
            strUName    = CleanString.htmlInputText( strUName );
            strUPhone   = CleanString.htmlInputText( strUPhone );
            strUEmail   = CleanString.htmlInputText( strUEmail );
            strMTitle   = CleanString.htmlInputText( strMTitle );
            strMContent = CleanString.htmlInputText( strMContent );

            string mySql = "insert into [message](UName,UPhone,UEmail,MTitle,MContent,Pubdate) values('" +
                           strUName + "','" + strUPhone + "','" + strUEmail + "','" + strMTitle
                            + "','" + strMContent + "','" + DateTime.Now + "')";
            DBConn myDB = new DBConn();
            myDB.ExecuteNonQuery( mySql );
            myDB.Close();

            Session["messageCheck"] = DateTime.Now; //防止恶意刷信息 记录提交时间
            
            Response.Write("<script>");
            Response.Write ("alert('成功提交！')");
            Response.Write ("</script>");
            txtUserName.Text = "";
            txtUserPhone.Text = "";
            txtEmail.Text = "";
            txtTitle.Text = "";
            txtContent.Text = "";

        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtUserPhone.Text = "";
            txtEmail.Text = "";
            txtTitle.Text = "";
            txtContent.Text = "";
        }
}
}
