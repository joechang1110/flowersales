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

namespace SCard.admin
{
	/// <summary>
	/// adminList 腔晡猁佽隴﹝
	/// </summary>
	public partial class adminList : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{
            //癹潰脤
            if( Session["adminName"]==null || Session["adminName"].ToString() == String.Empty )
            {
                Response.Write("<font color=#ff0000>对不起,您没足够权限访问此页!!</font>");
                Response.Write("<a href=index.aspx>重新登陆</a>");
                Response.End();
                return;
            }

            if( !IsPostBack )
            {
                getData();
            }
		}

        private void getData()
        {
            DBConn myDB = new DBConn();
            string sql="select * from admin order by addtime";
            adminDataGrid.DataSource  = myDB.getDataReader(sql);
            adminDataGrid.DataBind();
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
            this.adminDataGrid.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.adminDataGrid_DeleteCommand);
            this.adminDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.adminDataGrid_ItemDataBound);

        }
		#endregion

        private void adminDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
            { 
                //刉壺            
                LinkButton delBttn = (LinkButton) e.Item.Cells[0].Controls[0]; 
                if( Session["adminName"].ToString().ToUpper() == e.Item.Cells[1].Text.ToUpper() )
                {
                    e.Item.Cells[0].Controls[0].Visible = false;//祥珆尨※刉壺§偌聽
                }
                delBttn.Attributes.Add("onclick", "javascript:return confirm('确定删除[ " + CleanString.htmlOutputText(e.Item.Cells[1].Text) + " ]?');"); 
            } 
        }

        private void adminDataGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string strAdmin = e.Item.Cells[1].Text;
            DBConn myDB = new DBConn();
            string sql="Delete from admin where username='" + strAdmin +"'";
            myDB.ExecuteNonQuery(sql);
            myDB.Close();

            getData();
        }
	}
}
