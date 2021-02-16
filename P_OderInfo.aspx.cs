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
using System.Configuration;
using System.IO;



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
                 getData();
            }
        }

        private void getData()
        {


            string sql = "select * from [viwPorder] where orderno='" + Request.QueryString["id"].ToString() + "'";
       
            MySqlPager SqlPager = new MySqlPager();
            SqlPager.setAttribute(SqlPager1, "FavDataGrid", sql, "ID desc", 20);
        }
  }

       
 
}
 