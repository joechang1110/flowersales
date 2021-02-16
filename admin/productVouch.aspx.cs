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
	/// productVouch_aspx 的摘要说明。
	/// </summary>
	public partial class productVouch : System.Web.UI.Page
	{
        protected System.Web.UI.WebControls.DropDownList ddlPName;
    
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
                getddlClassData();
                getPData();//绑定鲜花列表
                getVData();//绑定推荐列表
            }
		}

        private void getPData()
        {
            string mySql="select * from Products Left Outer join Category on  Products.CID = Category.CID where PCommend=0 order by PID desc";
          
            MySqlPager SqlPager = new MySqlPager();
			SqlPager.setAttribute( SqlPager1, "PDataGrid", mySql, "PID desc", 5);
                
        }


        private void getVData()
        {
            string sql="select * from Products Left Outer join Category on  Products.CID = Category.CID where PCommend=1 order by PID desc";

            DBConn myDB = new DBConn();
            DataGrid1.DataSource  = myDB.getDataReader(sql);
            DataGrid1.DataBind();
            myDB.Close();
                
        }

        private void getddlClassData()
        {
            DBConn myDB = new DBConn();
            string sql="select * from Category order by CID desc";
            ddlClass.DataSource  = myDB.getDataReader(sql);
            ddlClass.DataTextField = "CName";
           
            ddlClass.DataBind();
            myDB.Close();
            
            ddlClass.Items.Insert(0,new ListItem("所有分类","-1"));
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
            this.PDataGrid.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.PDataGrid_DeleteCommand);
            this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);

        }
		#endregion

        protected void btnSelect_Click(object sender, System.EventArgs e)
        {
            string mySql = "select * from Products Left Outer join Category on  Products.CID = Category.CID where PCommend=0 order by PID desc";            
 
            string strClass = ddlClass.SelectedValue; 

            if( !strClass.Equals("-1") )
            {
            //    mySql = "select * from Products Left Outer join Category on  Products.CID = Category.CID where PCommend=0 and Category.CName=" + strClass + " order by PID desc";            
                mySql = "select * from Products Left Outer join Category on  Products.CID = Category.CID where PCommend=0 and Category.CName='" + strClass + "' order by PID desc";            
            }  

            MySqlPager SqlPager = new MySqlPager();
			SqlPager.setAttribute( SqlPager1, "PDataGrid", mySql, "PID desc", 5);
        }

        private void PDataGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string strid = e.Item.Cells[0].Text;
            DBConn myDB = new DBConn();
            string sql="update Products set PCommend=1 where PID="+strid;
            myDB.ExecuteNonQuery(sql);
            myDB.Close();

            getPData();//绑定鲜花列表
            getVData();//绑定推荐列表
        }

        private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string strid = e.Item.Cells[0].Text;
            DBConn myDB = new DBConn();
            string sql="update Products set PCommend=0 where PID="+strid;
            myDB.ExecuteNonQuery(sql);
            myDB.Close();

            getPData();
            getVData();
        }


       
	}
}
