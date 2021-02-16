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
    /// orderList 的摘要说明。
    /// </summary>
    public partial class orderList : System.Web.UI.Page
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
                if (Request.QueryString["ac"] != null)
                {
                    string mySql = "update  [Order] set OState=" + (string)(Request.QueryString["ac"]) + " where OID='" + (string)(Request.QueryString["oid"]) + "'";
                    DBConn myDB = new DBConn();
                    myDB.ExecuteNonQuery(mySql);
                    myDB.Close();

                }

                getData();
            }
        }

        private void getData()//绑定数据
        {
            string sql = "select * from [Order] order by OID desc";
            MySqlPager SqlPager = new MySqlPager();
            SqlPager.setAttribute(SqlPager1, "OrderDataGrid", sql, "OID desc", 20);
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
            this.OrderDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.OrderDataGrid_ItemDataBound);

        }
        #endregion

        private void OrderDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string strOState = e.Item.Cells[3].Text;
                switch (strOState)
                {
                    case "0":
                        strOState = "未处理";
                        break;
                    case "1":
                        strOState = "完成";
                        break;
                    case "2":
                        strOState = "等待";
                        break;
                    default:
                        strOState = "其他";
                        break;
                }
                e.Item.Cells[3].Text = strOState;
            }
        }

        protected void btnSelect_Click(object sender, System.EventArgs e)
        {
            string strSelect = txtSelect.Text;
            string mySql = "select * from [Order] order by OID desc";

            switch (ddlSelect.SelectedValue)
            {
                case "0":
                    mySql = "select * from [Order] where OID like '%" + strSelect + "%' order by OID desc";
                    break;
                case "1":
                    mySql = "select * from [Order] where TName like '%" + strSelect + "%' order by OID desc";
                    break;
                case "2":
                    mySql = "select * from [Order] where Email like '%" + strSelect + "%' order by OID desc";
                    break;
            }
            MySqlPager SqlPager = new MySqlPager();
            SqlPager.setAttribute(SqlPager1, "OrderDataGrid", mySql, "OID desc", 20);
        }
    }
}
