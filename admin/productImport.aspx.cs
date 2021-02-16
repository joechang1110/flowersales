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
using System.IO;

namespace SCard.admin
{
    /// <summary>
    /// productImport 的摘要说明。
    /// </summary>
    public partial class productImport : System.Web.UI.Page
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
                if (Request.QueryString["id"] == null)
                {
                    Response.Write("没有这个鲜花");
                    Response.End();
                }
                string strID = Request.QueryString["id"].ToString().Trim();
                if (strID == String.Empty)
                {
                    strID = "-1";
                }
                DBConn myDB1 = new DBConn();
                string sqlP = "select PName from Products where PID=" + strID;
                SqlDataReader dr = myDB1.getDataReader(sqlP);

                if (dr.Read())
                {
                    lblName.Text = dr["PName"].ToString();
                }

                dr.Close();
                myDB1.Close();

                ViewState["PID"] = strID;
            }
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




        protected void Button1_Click(object sender, EventArgs e)
        {
            string strID = Request.QueryString["id"];
            string iNum;
            if (txtN.Text == String.Empty)
            {
                Response.Write("<script>");
                Response.Write("alert('请填写入货数量!!!');");
                Response.Write("</script>");
                return;
            }
            iNum = this.txtN.Text;
            DBConn myDB2 = new DBConn();
            string mySql = "update Products set PStock=PStock+" + iNum + " where PID=" + strID;
            myDB2.ExecuteNonQuery(mySql);
            //  mySql = "Insert into tblLog(Pid,isN) values ( '" + strID + "', '" + iNum + "')";
            mySql = "update tblLog set isN=isN+" + iNum + "where PID=" + strID;
            myDB2.ExecuteNonQuery(mySql);
            myDB2.Close();
            Response.Write("<script>");
            Response.Write("alert('提交成功数据!!!');location.href='productAlter.aspx';");

            Response.Write("</script>");

        }
    }
}
