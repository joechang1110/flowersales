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
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace SCard.admin
{
	/// <summary>
	/// edit_tzs 的摘要说明。
	/// </summary>
    public partial class View_User : System.Web.UI.Page
    {
        public string sisState;
 
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(!this.IsPostBack)
			{
                sisState = Request.Params["id"];
				this.datanew();
			}

             
		}
		
		private void datanew()
		{

            string DBPath = ConfigurationManager.AppSettings["DataBasePath"];
            string connStr = (DBPath);
            SqlConnection con = new SqlConnection(connStr);
        
            string sql;

            sql = "select * from viwUser";
            con.Open();
           
			SqlDataAdapter sda=new SqlDataAdapter(sql ,con);
			DataSet ds=new DataSet();
            sda.Fill(ds, "viwUser");
            this.dgnew.DataKeyField = "Userid";//DataKeyField存的是定位的键值
            this.dgnew.DataSource = ds.Tables["viwUser"];
			this.dgnew.DataBind();
			
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
			this.dgnew.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dgnew_PageIndexChanged);
			this.dgnew.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgnew_DeleteCommand);
			this.dgnew.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgnew_ItemDataBound);

		}
		#endregion

		private void dgnew_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			this.dgnew.CurrentPageIndex=e.NewPageIndex;
			this.datanew();
		}

		private void dgnew_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if(e.Item.ItemType==ListItemType.Item||e.Item.ItemType==ListItemType.AlternatingItem)
			{
				e.Item.Attributes.Add("onmouseover","c=this.style.backgroundColor;this.style.backgroundColor='#eeeeff'");
				e.Item.Attributes.Add("onmouseout","this.style.backgroundColor=c;");
 				((LinkButton)(e.Item.Cells[4].Controls[0])).Attributes.Add("onclick","return confirm('真得要删除吗？')");
			}
           
		}
       
		private void dgnew_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{

			string id=this.dgnew.DataKeys[e.Item.ItemIndex].ToString();

            string DBPath = ConfigurationManager.AppSettings["DataBasePath"];
            string connStr = (DBPath);
            SqlConnection con = new SqlConnection(connStr);
           
            SqlCommand cmd = new SqlCommand("delete from tblUser where id='" + id + "'", con);
			con.Open();
			cmd.ExecuteNonQuery();
			try
			{
				this.datanew();
			}
			catch
			{
				if (this.dgnew.CurrentPageIndex>0)
				{
					this.dgnew.CurrentPageIndex-=1;
					this.datanew();
				}
			}
		}

    //try 语句DataGrid中删除最后一页的记录时出错的解决办法,返回到上一页

      
}
}
