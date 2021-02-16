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
	/// categoryAlter 腔晡猁佽隴﹝
	/// </summary>
	public partial class categoryAlter : System.Web.UI.Page
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

		private void getData()//堂隅杅擂
		{
			DBConn myDB = new DBConn();
			string sql="select * from Category order by CID desc";
			DataGrid1.DataSource  = myDB.getDataReader(sql);
			DataGrid1.DataBind();
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
            this.DataGrid1.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_CancelCommand);
            this.DataGrid1.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_EditCommand);
            this.DataGrid1.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_UpdateCommand);
            this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
            this.DataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemDataBound);

        }
		#endregion

		private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        
		{
			DataGrid1.EditItemIndex = e.Item.ItemIndex;//鳳懂赻杅擂埭諷璃腔勤砓腔坰竘ㄛ蔚坳董跤諷璃笢猁晤憮腔砐腔坰竘
			getData();
		}

		private void DataGrid1_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
            DataGrid1.EditItemIndex = -1;
			getData();
		}

		private void DataGrid1_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			string strid = e.Item.Cells[0].Text;

            TextBox tb = (TextBox)(e.Item.Cells[1].Controls[0]);
           
            string strName =tb.Text.Trim();
			if( strName == String.Empty )
			{
				Response.Write("<script>");
				Response.Write("alert('请输入类别名称!!!');");
				Response.Write("</script>");
				return;
			}
			else if( strName.Length > 20 )
			{
				Response.Write("<script>");
				Response.Write("alert('输入类别名称太长了!!!');");
				Response.Write("</script>");
				return;
			}

			DBConn myDB = new DBConn();
			string sql="update Category set CName='" + strName + "' where CID=" + strid;
			myDB.ExecuteNonQuery(sql);
			myDB.Close();

            Response.Write("<script>");
            Response.Write("alert('更新成功!!!');");
            Response.Write("</script>");

			DataGrid1.EditItemIndex  = -1;//豖隙善晤憮袨怓
			getData();
		}

		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
                //鳳勤砓笢腔濬倰迵諷璃笢腔砐腔濬倰岆瘁饜ㄛ等啋跡笢腔砐腔濬倰岆瘁饜
            { 
                string strid = e.Item.Cells[0].Text;
                DBConn myDB = new DBConn();
                string sql="Delete from Category where CID="+strid;
                myDB.ExecuteNonQuery(sql);
                myDB.Close();

                getData();
            }
		}

        private void DataGrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) //瓚剿岆瘁岆蹈桶笢腔砐ㄛ瓚剿蹈桶笢腔砐岆瘁岆迵杅擂堂隅腔
            { 
                //刉壺            
                LinkButton delBttn = (LinkButton) e.Item.Cells[3].Controls[0]; 
                delBttn.Attributes.Add("onclick", "javascript:return confirm('确定删除[ " + CleanString.htmlOutputText(e.Item.Cells[1].Text) + " ]?');"); 
            } 

        }


}
}
