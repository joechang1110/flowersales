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

namespace SCard.admin
{
    /// <summary>
    /// productDetail 的摘要说明。
    /// </summary>
    public partial class productDetail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {
            //权限检查
            if (Session["adminName"] == null || Session["adminName"].ToString() == String.Empty)
            {
                Response.Write("<font color=#ff0000 style='FONT-SIZE: 12px'>对不起,您没足够权限访问此页!!</font><br>");
                Response.Write("<a href=index.aspx target=_top style='FONT-SIZE: 12px'>重新登陆</a><br>");
                Response.End();
                return;
            }

            if (!IsPostBack)
            {
                getCategory();//绑定类别下拉列表


                if (Request.QueryString["id"] == null)
                {
                    Response.Write("没有这个鲜花");
                    Response.End();
                }
                string strID = Request.QueryString["id"].ToString().Trim();

                //获取ID对应的鲜花信息
                DBConn myDB1 = new DBConn();
                string sqlP = "select * from Products where PID=" + strID;
                SqlDataReader dr = myDB1.getDataReader(sqlP);

                if (dr.Read())
                {
                    myimg.Src = "../showPP.aspx?id=" + dr["PID"].ToString();
                    ViewState["PID"] = dr["PID"].ToString();
                    txtName.Text = CleanString.htmlOutputText(dr["PName"].ToString());
                    txtCPrice.Text = double.Parse(dr["PCPrice"].ToString()).ToString("f2");//小数点后面的位数2位
                    txtFPrice.Text = double.Parse(dr["PFPrice"].ToString()).ToString("f2");
                    txtNPrice.Text = double.Parse(dr["PNPrice"].ToString()).ToString("f2");
                    txtBewrite.Text = CleanString.htmlOutputText(dr["PBewrite"].ToString());
                    txtUseMode.Text = CleanString.htmlOutputText(dr["PUseMode"].ToString());
                    txtValidity.Text = CleanString.htmlOutputText(dr["PValidity"].ToString());

                    try//分类
                    {
                        ddlCategory.SelectedValue = dr["CID"].ToString();
                    }
                    catch
                    {
                        ddlCategory.SelectedIndex = 0;
                    }

                }

                dr.Close();
                myDB1.Close();
            }


        }

        private void getCategory()//绑定类别下拉列表
        {
            DBConn myDB = new DBConn();
            string sql = "select * from Category";
            ddlCategory.DataSource = myDB.getDataReader(sql);
            ddlCategory.DataTextField = "CName";
            ddlCategory.DataValueField = "CID";
            ddlCategory.DataBind();
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


        protected void btnAlter_Click(object sender, System.EventArgs e)
        {
            if (ViewState["PID"] == null)
            {
                Response.Write("<script>");
                Response.Write("alert('更新失败!!!');");
                Response.Write("</script>");
                return;
            }
            string strID = ViewState["PID"].ToString();

            string strName = txtName.Text.Trim();
            string strCID = ddlCategory.SelectedValue;
            string strCPrice = txtCPrice.Text.Trim();
            string strFPrice = txtFPrice.Text.Trim();
            string strNPrice = txtNPrice.Text.Trim();
            string strBewrite = txtBewrite.Text.Trim();
            string strUseMode = txtUseMode.Text.Trim();
            string strValidity = txtValidity.Text.Trim();

            if (strName == String.Empty || strCPrice == String.Empty || strCID == String.Empty ||
                strFPrice == String.Empty || strNPrice == String.Empty)
            {
                Response.Write("<script>");
                Response.Write("alert('必选项不能为空!!!');");
                Response.Write("</script>");
                return;
            }
            else if (strName.Length > 35)
            {
                Response.Write("<script>");
                Response.Write("alert('输入鲜花名称太长了!!!');");
                Response.Write("</script>");
                return;
            }

            try
            {
                double.Parse(strCPrice);
            }
            catch
            {
                Response.Write("<script>");
                Response.Write("alert('请检查 成本价 的格式!!!');");
                Response.Write("</script>");
                return;
            }
            try
            {
                double.Parse(strFPrice);
            }
            catch
            {
                Response.Write("<script>");
                Response.Write("alert('请检查 原价 的格式!!!');");
                Response.Write("</script>");
                return;
            }
            try
            {
                double.Parse(strNPrice);
            }
            catch
            {
                Response.Write("<script>");
                Response.Write("alert('请检查 现价 的格式!!!');");
                Response.Write("</script>");
                return;
            }

            if (uploadFile.PostedFile.FileName.Trim() != String.Empty && (Path.GetExtension(uploadFile.PostedFile.FileName) != ".gif" && Path.GetExtension(uploadFile.PostedFile.FileName) != ".jpg"))
            {
                Response.Write("<Script>alert('上传的图片格式必须为gif或jpg!!')</Script>");
                return;
            }

            strBewrite = CleanString.htmlInputText(strBewrite);
            strUseMode = CleanString.htmlInputText(strUseMode);
            strValidity = CleanString.htmlInputText(strValidity);

            string sql = "update Products set PName='" + strName + "',CID=" + strCID + ",PCPrice=" + strCPrice +
                        ",PFPrice=" + strFPrice + ",PNPrice=" + strNPrice + ",PBewrite='" + strBewrite +
                        "',PUseMode='" + strUseMode + "',PValidity='" + strValidity + "' where PID=" + strID;

            DBConn myDB = new DBConn();
            myDB.ExecuteNonQuery(sql);
            myDB.Close();

            if (uploadFile.PostedFile.FileName.Trim() != String.Empty)
            {
                //----------- update图片
                Stream imagedatastream;
                string DBPath = ConfigurationManager.AppSettings["DataBasePath"];
                string connStr = (DBPath);
                SqlConnection myConn = new SqlConnection(connStr);
                imagedatastream = Request.Files["uploadFile"].InputStream;
                int imagedatalen = Request.Files["uploadFile"].ContentLength;
                string imagedatatype = Request.Files["uploadFile"].ContentType;

                byte[] image = new byte[imagedatalen];
                imagedatastream.Read(image, 0, imagedatalen);

                String Psql = "update Products set PPicture=@imgdata where PID=" + strID;

                SqlCommand Pcommand = new SqlCommand(Psql, myConn);

                SqlParameter imgdata = new SqlParameter("@imgdata", SqlDbType.Image);
                imgdata.Value = image;
                Pcommand.Parameters.Add(imgdata);

                myConn.Open();
                Pcommand.ExecuteReader();
                myConn.Close();

            }

            Response.Write("<script>");
            Response.Write("alert('成功更新!!!');");
            Response.Write("</script>");

        }
    }
}
