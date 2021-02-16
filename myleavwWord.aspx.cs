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
    /// orderList 的摘要说明。
    /// </summary>
    public partial class myFav : System.Web.UI.Page
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {


            if (!IsPostBack)
            {
                if (Request.QueryString["did"] != null)
                {
                    string Pid = Request.QueryString["did"].ToString();

                    string sql = "delete from  [tblLeaveWord] where id=" + Pid;

                    DBConn myDB = new DBConn();

                    myDB.ExecuteNonQuery(sql);
                    myDB.Close();
                }

                getData();
            }
        }

        private void getData()//绑定数据
        {


            string sql = "select * from [tblLeaveWord]  order by ID desc";
 
            MySqlPager SqlPager = new MySqlPager();
            SqlPager.setAttribute(SqlPager1, "FavDataGrid", sql, "3000000-ID", 20);
        }
 


        protected void OrderDataGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
