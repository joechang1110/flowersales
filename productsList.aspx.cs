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
	/// productsList 腔晡猁佽隴﹝
	/// </summary>
	public partial class productsList : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if( !IsPostBack )
			{
                ViewState["CID"] = null;

                if(Request.QueryString["cid"] != null)
                {
                    string strCID = Request.QueryString["cid"].ToString();
                    ViewState["CID"] = CleanString.htmlInputText( strCID );
                }

                CData();//煦濬蹈桶堂隅
                PData();//珅豪蹈桶堂隅
                HData();//煦濬勤茼腔种珅豪蹈桶堂隅

                setSelectClass();//堂隅濬梗
			}
		}

        private void setSelectClass()
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

        private void CData()//煦濬蹈桶堂隅
        {
            DBConn myDB = new DBConn();
            string sql = "select * from Category";
            CRepeater.DataSource = myDB.getDataReader( sql );
            CRepeater.DataBind();
            myDB.Close();
        }

        private void PData()//珅豪蹈桶堂隅
        {
            if( ViewState["CID"] == null )
            {
                MySqlPager SqlPager = new MySqlPager();
				SqlPager.setAttribute( SqlPager1, "PDataList", "select * from Products order by PID desc", "PID desc", 12);
                
                lblDaohang.Text = "所有鲜花";
            }
            else
            {
                string strCID = ViewState["CID"].ToString();
                DBConn myDB = new DBConn();
                string sql="select * from Products where CID=" + strCID + " order by PID desc";
                try
                {
                    MySqlPager SqlPager = new MySqlPager();
					SqlPager.setAttribute( SqlPager1, "PDataList", sql, "PID desc", 12);
                }
                catch
                {
                    Response.Write("<script>");
                    Response.Write("alert('没有记录!!!');");
                    Response.Write("</script>");
                    myDB.Close();
                    Response.Redirect("index.aspx");
                    return;
                }
                myDB.Close();

                DBConn DB = new DBConn();
                string mySql = "select * from Category where CID=" + strCID;
                SqlDataReader dr = DB.getDataReader( mySql );
                if( dr.Read() )
                {
                    lblDaohang.Text = dr["CName"].ToString();
                }
                else
                {
                    Response.Write("<script>");
                    Response.Write("alert('没有这个类别!!!');");
                    Response.Write("</script>");
                    dr.Close();
                    DB.Close();
                    Response.Redirect("index.aspx");
                    return;
                }
                dr.Close();
                DB.Close();
            }
        }

        private void HData()//煦濬勤茼腔种珅豪蹈桶堂隅
        {
            if( ViewState["CID"] == null )
            {
                DBConn myDB = new DBConn();
				string sql = "SELECT TOP 5 * FROM Products WHERE PSellNum>0 ORDER BY PSellNum DESC,PID";
                HotRepeater.DataSource = myDB.getDataReader( sql );
                HotRepeater.DataBind();
                myDB.Close();
            }
            else
            {
                string strCID = ViewState["CID"].ToString();

                DBConn myDB = new DBConn();
                string sql = "SELECT top 5 * From Products Where PSellNum>0 and CID=" + strCID + " order by PSellNum desc,PID";
                HotRepeater.DataSource = myDB.getDataReader( sql );
                HotRepeater.DataBind();
                myDB.Close();
            }
            
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
	}
}
