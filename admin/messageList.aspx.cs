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
    /// 留言板 信息 (0未读   1已读　menu源中已设定了)
	/// </summary>
	public partial class messageList : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //权限检查
            if( Session["adminName"]==null || Session["adminName"].ToString() == String.Empty )
            {
                Response.Write("<font color=#ff0000>对不起,您没足够权限访问此页!!</font>");
                Response.Write("<a href=index.aspx>重新登陆</a>");
                Response.End();
                return;
            }

            if( !IsPostBack )
            {
                ViewState["MState"] = Request.QueryString["State"].ToString();
                //menu中已设定了State值

                if (ViewState["MState"].ToString().Equals("0"))
                {
                    lblState.Text = "未读信息";
                }
                else
                {
                    lblState.Text = "已读信息";
                }

                getDataCount();//获取记录个数
                getData();
            }
		}

        private void getDataCount()
        {
            string mySql="select count(*) as [num] from [message] where MState=" + ViewState["MState"].ToString();
            DBConn myDB = new DBConn();
            SqlDataReader mydr = myDB.getDataReader( mySql );
            if( mydr.Read() )
            {
                lblNum.Text = mydr["num"].ToString();
            }
            mydr.Close();
            myDB.Close();      
        }

        private void getData()
        {
            string sql="select * from [message] where MState=" + ViewState["MState"].ToString() + " order by MID desc";
			MySqlPager SqlPager = new MySqlPager();
            SqlPager.setAttribute( SqlPager1, "messageDataGrid", sql, "MID desc", 20);
                
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
            this.messageDataGrid.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.messageDataGrid_DeleteCommand);
            this.messageDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.messageDataGrid_ItemDataBound);

        }
		#endregion

        private void messageDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
            { 
                //删除确认            
                LinkButton delBttn = (LinkButton) e.Item.Cells[5].Controls[0]; 
                delBttn.Attributes.Add("onclick","javascript:return confirm('确定删除[ " + CleanString.htmlOutputText(e.Item.Cells[2].Text) + " ]?');"); 
            } 
        }

        private void messageDataGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string strid = e.Item.Cells[0].Text;
            DBConn myDB = new DBConn();
            string sql="Delete from [message] where MID="+strid;
            myDB.ExecuteNonQuery(sql);
            myDB.Close();

            getData();
        }
	}
}
