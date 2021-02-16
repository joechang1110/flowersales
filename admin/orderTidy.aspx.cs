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
    /// orderTidy 的摘要说明。
    /// </summary>
    public partial class orderTidy : System.Web.UI.Page
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {
            //权限检查
            if (Session["adminName"] == null || Session["adminName"].ToString() == String.Empty)
            {
                Response.Write("<font color=#ff0000>对不起,您没足够权限访问此页!!</font>");
                Response.Write("<a href=index.aspx >重新登陆</a>");
                Response.End();
                return;
            }

            if (!IsPostBack)
            {
                getData();

            }
        }

        private void getData()
        {
            string sql = "select * from [Order] where OState=0 order by OID";
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

        protected void delP(string sql)//下面调用
        {//删除P量的ID

            DBConn myDB = new DBConn();
            DataSet ds1 = myDB.getDataSet(sql);
            foreach (DataRow row in ds1.Tables[0].Rows)//将表中的数据从头到尾按行读一遍
            {
                myDB.ExecuteNonQuery("delete from tblP_Order where OrderNo='" + row["OID"].ToString() + "'");
                //将“删除”变成“选择”，这些要删除的订单，订单号不同，所以用FOREACH方法，从第一行开始找对应的订单进行删除
            }

            myDB.Close();

        }
        protected void btnDelete_Click(object sender, System.EventArgs e)
        {

            string mySql = "DELETE * FROM [Order] WHERE [OState]=0 AND [Pubdate]='1800-1-1'";//初始化
            DBConn myDB = new DBConn();
            switch (ddlDelete.SelectedValue)
            {
                case "0":
                    mySql = "DELETE FROM [Order] WHERE [OState]=0 AND [Pubdate]<=('" + DateTime.Now.AddMonths(-1) + "')";
                    break;
                case "1":
                    mySql = "DELETE FROM [Order] WHERE [OState]=0 AND [Pubdate]<=('" + DateTime.Now.AddDays(-7) + "')";
                    break;
                case "2":
                    mySql = "DELETE FROM [Order] WHERE [OState]=0 AND [Pubdate]<=('" + DateTime.Now.AddDays(-1) + "')";
                    break;
                case "3":
                    mySql = "DELETE FROM [Order] WHERE [OState]=0 AND [Pubdate]<=('" + DateTime.Now.AddHours(-1) + "')";
                    break;
            }

            delP(mySql.Replace("DELETE", "Select * "));//调用上面
            myDB.ExecuteNonQuery(mySql);
            myDB.Close();

            Response.Write("<script>");
            Response.Write("alert('成功删除特定记录!!!');");
            Response.Write("</script>");

            getData();
        }

        protected void ddlDelete_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            btnDelete.Attributes.Add("onclick", "javascript:return confirm('确定删除[ " + ddlDelete.Items[ddlDelete.SelectedIndex].Text + " ]?');");
        }
    }
}
