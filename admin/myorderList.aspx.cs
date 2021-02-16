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
    /// orderList 的摘要说明。会员直接点“我的订单”，进入该界面
    /// </summary>
    public partial class myorderList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }

        private void getData()
        {
            string sql = "select * from [Order] where TName='" + (string)Session["User"] + "'order by OID desc";
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

    }
}
