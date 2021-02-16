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
    /// otherAnnounce 的摘要说明。
    /// </summary>
    public partial class otherAnnounce : System.Web.UI.Page
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
                getAnnounce();//获取公告信息
            }
        }

        private void getAnnounce()
        {
            string mySql = "select * from append where id='3'";

            DBConn myDB = new DBConn();
            SqlDataReader mydr = myDB.getDataReader(mySql);
            if (mydr.Read())
            {
                txtAnnounce.Text = CleanString.htmlOutputText(mydr["text"].ToString());
            }
            mydr.Close();
            myDB.Close();
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

        }
        #endregion

        protected void btnOk_Click(object sender, System.EventArgs e)
        {
            string strAnnounce = CleanString.htmlInputText(txtAnnounce.Text);
            string mySql = "update [Append] set [text]='" + strAnnounce + "' where [id]='3'";
            DBConn myDB = new DBConn();
            int iNum = myDB.ExecuteNonQuery(mySql);
            myDB.Close();

            if (iNum == 1)
            {
                Response.Write("<script>");
                Response.Write("alert('[公告栏] 修改成功!!!');");
                Response.Write("</script>");
            }
        }
    }
}
