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

namespace SCard
{
	/// <summary>
	/// Default 腔晡猁佽隴﹝
	/// </summary>
	public partial class index : System.Web.UI.Page
	{
        
		protected void Page_Load(object sender, System.EventArgs e)
		{
            if( !IsPostBack )
            {
                CData();//分类列表绑定
                setSelectClass();//绑定类别
                getHotDataList();//热卖鲜花
                getNewDataList();//最新上架
                getTJDataList();//精品推荐

                getAnnounce();//获取公告信息
            }
		}

        private void getAnnounce()//鳳鼠豢陓洘
        {
            string mySql="select * from append where id='3'";
            
            DBConn myDB = new DBConn();
            SqlDataReader mydr  = myDB.getDataReader( mySql );
            if( mydr.Read() )
            {
                lblAnnounce.Text = CleanString.htmlOutputText( mydr["text"].ToString() );
            }
            mydr.Close();
            myDB.Close();        
        }

        private void CData()//煦濬蹈桶堂隅
        {
            DBConn myDB = new DBConn();
            string sql = "select * from Category";
            CRepeater.DataSource = myDB.getDataReader( sql );
            CRepeater.DataBind();
            myDB.Close();
        }

        private void setSelectClass()//堂隅濬梗
        {
            DBConn myDB = new DBConn();
            string mySql = "select CID,CName from Category order by CID desc";
            ddlClass.DataSource  = myDB.getDataReader( mySql );
            ddlClass.DataTextField = "CName";
            ddlClass.DataValueField = "CID";
            ddlClass.DataBind();
            myDB.Close();
            
            ddlClass.Items.Insert(0,new ListItem("所有分类", "-1"));
        }

        private void getHotDataList()//闖珅豪
        {
            DBConn myDB = new DBConn();
            string sql = "select top 10 * from Products where PHot=1 order by PID desc";
            HDataList.DataSource = myDB.getDataReader( sql );
            HDataList.DataBind();
            myDB.Close();  
        }

        private void getNewDataList()//郔陔奻殤
        {
            DBConn myDB = new DBConn();
            string sql = "select top 6 * from Products order by PID desc";
            NDataList.DataSource = myDB.getDataReader( sql );
            NDataList.DataBind();
            myDB.Close();  
        }
        
        private void getTJDataList()//儕芢熱
        {
            DBConn myDB = new DBConn();
            string sql = "select top 10 * from Products where PCommend=1 order by PID desc";
            JRepeater.DataSource = myDB.getDataReader( sql );
            JRepeater.DataBind();
            myDB.Close();  
        }

		#region Web 敦极扢數汜傖腔測鎢
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 蜆覃蚚岆 ASP.NET Web 敦极扢數垀斛剒腔﹝
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 扢數盓厥垀剒腔源楊 - 祥猁妏蚚測鎢晤憮党蜊
		/// 森源楊腔囀﹝
		/// </summary>
		private void InitializeComponent()
		{    

        }
		#endregion

        protected void btnSelect_Click(object sender, System.EventArgs e)
        {
            string strClass = ddlClass.SelectedValue;
            string strText = Server.UrlEncode( txtSelect.Text );

            Response.Redirect("Select.aspx?class=" + strClass + "&text=" + strText);
        }
        protected void PageFooter1_Load(object sender, EventArgs e)
        {

        }
}
}
