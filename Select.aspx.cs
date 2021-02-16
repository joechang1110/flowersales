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
	/// Select 腔晡猁佽隴﹝
	/// </summary>
	public partial class Select : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{
			 if( !IsPostBack )
            {
                setSelectClass();//堂隅濬梗
                
                if( Request.QueryString["class"] != null && Request.QueryString["text"] != null )//婓翋珜換徹懂腔刲坰腔濬倰睿珅豪靡
                {
                    string strClass = Request.QueryString["class"].ToString();
                    string strText = Request.QueryString["text"].ToString();

                    strClass = CleanString.htmlInputText( strClass );
                    strText = CleanString.htmlInputText( Server.UrlDecode(strText) );
                    
                    CData();//煦濬蹈桶堂隅
                    getSelectResult(strClass, strText);//脤戙
                }    
            }
		}

        private void CData()//煦濬蹈桶堂隅
        {
            DBConn myDB = new DBConn();
            string sql = "select * from Category";
            CRepeater.DataSource = myDB.getDataReader( sql );
            CRepeater.DataBind();
            myDB.Close();
        }

        private void setSelectClass()//堂隅 濬梗恁遺
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

        private void getSelectResult(string strClass, string strText)//脤戙
        {
            string mySql= "select * from Products order by PID desc";

            if( strClass.Equals("-1") )
            {
                mySql= "select * from Products where PName like '%" + strText + "%' order by PID desc";
            }
            else
            {
                mySql= "select * from Products where CID=" + strClass + " and PName like '%" + strText + "%' order by PID desc";
            }

            MySqlPager SqlPager = new MySqlPager();
			SqlPager.setAttribute( SqlPager1, "PDataList", mySql, "PID desc", 10);
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
            string strText = txtSelect.Text;

            strText = CleanString.htmlInputText( strText );
                    
            getSelectResult(strClass, strText);//脤戙
        }
	}
}
