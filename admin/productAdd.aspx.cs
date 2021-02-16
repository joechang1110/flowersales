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
using System.IO;

namespace SCard.admin
{
	/// <summary>
	/// productAdd 的摘要说明。
	/// </summary>
	public partial class productAdd : System.Web.UI.Page
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			//权限检查
			if (Session["adminName"] == null || Session["adminName"].ToString() == String.Empty)
			{
				Response.Write("<font color=#ff0000>对不起,您没足够权限访问此页!!</font>");
				Response.Write("<a href=index.aspx>重新登陆</a>");
				Response.End();
				return;
			}

			if (!IsPostBack)
			{
				getCategory();
			}
		}

		private void getCategory()
		{
			DBConn myDB = new DBConn();
			string sql = "select * from Category";
			ddlCategory.DataSource = myDB.getDataReader(sql);
			ddlCategory.DataTextField = "CName";
			ddlCategory.DataValueField = "CID";
			ddlCategory.DataBind();
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

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
			string strName = txtName.Text.Trim();
			string strCID = ddlCategory.SelectedValue;
			string strCPrice = txtCPrice.Text.Trim();
			string strFPrice = txtFPrice.Text.Trim();
			string strNPrice = txtNPrice.Text.Trim();
			string strBewrite = txtBewrite.Text.Trim();
			string strUseMode = txtUseMode.Text.Trim();
			string strValidity = txtValidity.Text.Trim();

			if (strName == String.Empty || strCPrice == String.Empty || strCID == String.Empty ||
				strFPrice == String.Empty || strNPrice == String.Empty)
			{
				Response.Write("<script>");
				Response.Write("alert('必选项不能为空!!!');");
				Response.Write("</script>");
				return;
			}
			else if (strName.Length > 35)
			{
				Response.Write("<script>");
				Response.Write("alert('输入鲜花名称太长了!!!');");
				Response.Write("</script>");
				return;
			}

			try
			{
				double.Parse(strCPrice);
			}
			catch
			{
				Response.Write("<script>");
				Response.Write("alert('请检查 成本价 的格式!!!');");
				Response.Write("</script>");
				return;
			}
			try
			{
				double.Parse(strFPrice);
			}
			catch
			{
				Response.Write("<script>");
				Response.Write("alert('请检查 原价 的格式!!!');");
				Response.Write("</script>");
				return;
			}
			try
			{
				double.Parse(strNPrice);
			}
			catch
			{
				Response.Write("<script>");
				Response.Write("alert('请检查 现价 的格式!!!');");
				Response.Write("</script>");
				return;
			}

			if (uploadFile.PostedFile.FileName.Trim() != String.Empty && (Path.GetExtension(uploadFile.PostedFile.FileName) != ".gif" && Path.GetExtension(uploadFile.PostedFile.FileName) != ".jpg"))
			{
				Response.Write("<Script>alert('上传的图片格式必须为.gif或.jpg!!')</Script>");
				return;
			}

			strBewrite = CleanString.htmlInputText(strBewrite);
			strUseMode = CleanString.htmlInputText(strUseMode);
			strValidity = CleanString.htmlInputText(strValidity);


			string sql = "insert into Products(PName,CID,PCPrice,PFPrice,PNPrice,PBewrite,PUseMode,PValidity) values('" +
					strName + "'," + strCID + "," + strCPrice + "," + strFPrice + "," +
					strNPrice + ",'" + strBewrite + "','" + strUseMode + "','" + strValidity + "')";

			DBConn myDB = new DBConn();
			myDB.ExecuteNonQuery(sql);

			myDB.Close();

			if (uploadFile.PostedFile.FileName.Trim() != String.Empty)
			{
				Stream imagedatastream;
				string DBPath = ConfigurationManager.AppSettings["DataBasePath"];
				string connStr = (DBPath);
				SqlConnection myConn = new SqlConnection(connStr);
				imagedatastream = Request.Files["uploadFile"].InputStream;
				int imagedatalen = Request.Files["uploadFile"].ContentLength;
				string imagedatatype = Request.Files["uploadFile"].ContentType;

				byte[] image = new byte[imagedatalen];
				imagedatastream.Read(image, 0, imagedatalen);

				String Psql = "update Products set PPicture=@imgdata where PID=(select MAX(PID) from products)";

				SqlCommand Pcommand = new SqlCommand(Psql, myConn);

				SqlParameter imgdata = new SqlParameter("@imgdata", SqlDbType.Image);
				imgdata.Value = image;
				Pcommand.Parameters.Add(imgdata);

				myConn.Open();
				Pcommand.ExecuteNonQuery();
				myConn.Close();

			}


			txtName.Text = "";
			txtCPrice.Text = "";
			txtFPrice.Text = "";
			txtNPrice.Text = "";
			txtBewrite.Text = "";
			txtUseMode.Text = "";
			txtValidity.Text = "";
			ddlCategory.SelectedIndex = 0;


			Response.Write("<script>");
			Response.Write("alert('成功添加!!!');");
			Response.Write("</script>");

		}

		protected void btnReset_Click(object sender, System.EventArgs e)
		{
			txtName.Text = "";
			txtCPrice.Text = "";
			txtFPrice.Text = "";
			txtNPrice.Text = "";
			txtBewrite.Text = "";
			txtUseMode.Text = "";
			txtValidity.Text = "";
			ddlCategory.SelectedIndex = 0;
		}
	}
}
