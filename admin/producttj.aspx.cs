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
    /// productHot 的摘要说明。
    /// </summary>
    public partial class productHot : System.Web.UI.Page
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


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string 进货, 销售;
            DBConn db1 = new DBConn();

            进货 = db1.LookUp("select sum(ismoney) as '1' from viwlog  where isDate between '" + TextBox1.Text + " 00:00:00' and '" + TextBox2.Text + " 23:59:00'", "1");
            销售 = db1.LookUp("select sum(totalprice) as '1' from [order]  where pubdate between '" + TextBox1.Text + " 00:00:00' and '" + TextBox2.Text + " 23:59:00'", "1");
            if (销售 == "") 销售 = "0";
            if (进货 == "") 进货 = "0";
            lblNote.Text = "利润= " + (double.Parse(销售) - double.Parse(进货));
        }
    }
}
