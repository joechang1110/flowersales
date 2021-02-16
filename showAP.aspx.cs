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
	/// <summary>
	/// showAP 的摘要说明。
	/// </summary>
	public partial class showAP : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
            try
            { 
                String strID="-1";
                strID=Request.QueryString["id"].ToString ();

				string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
				string connStr = (DBPath);
				SqlConnection conn=new SqlConnection(connStr);
                String sql="SELECT * FROM append where id='" + strID + "'";
                SqlCommand command=new SqlCommand(sql,conn);
 
                conn.Open();
                SqlDataReader dr=command.ExecuteReader();
                dr.Read();
                byte[] imgdata = (byte[])dr["image"];
                Response.BinaryWrite(imgdata);
                dr.Close();
                conn.Close();
            }
            catch
            {   
                //打印 没有图片
				string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
				string connStr = (DBPath);
				SqlConnection conn2=new SqlConnection(connStr);
                String sql="SELECT * FROM append where id='0'";
                SqlCommand command=new SqlCommand(sql,conn2);
                conn2.Open();
                SqlDataReader dr=command.ExecuteReader();
                dr.Read();
                byte[] imgdata2 = (byte[])dr["image"];
                Response.BinaryWrite(imgdata2);
                dr.Close();
                conn2.Close();
            }
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
