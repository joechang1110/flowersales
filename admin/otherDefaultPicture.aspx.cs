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
    /// otherDoesnotPicture 的摘要说明。
    /// </summary>
    public partial class otherDefaultPicture : System.Web.UI.Page
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

        protected void btnOK_Click(object sender, System.EventArgs e)
        {
            if (uploadFile.PostedFile.FileName.Trim() != String.Empty && (Path.GetExtension(uploadFile.PostedFile.FileName) != ".gif" && Path.GetExtension(uploadFile.PostedFile.FileName) != ".jpg"))
            {//Path.GetExtension返回"指定的路径"字符串的扩展名
                Response.Write("<Script>alert('上传的图片格式必须为.gif或.jpg!!')</Script>");
                return;
            }

            if (uploadFile.PostedFile.FileName.Trim() != String.Empty)
            {

                Stream imagedatastream;//字节流
                string DBPath = ConfigurationManager.AppSettings["DataBasePath"];
                string connStr = (DBPath);
                SqlConnection myConn = new SqlConnection(connStr);
                imagedatastream = Request.Files["uploadFile"].InputStream;//文件路径
                int imagedatalen = Request.Files["uploadFile"].ContentLength;//上传文件的大小
                string imagedatatype = Request.Files["uploadFile"].ContentType;//上传文件的类型
                byte[] image = new byte[imagedatalen];//二进制数组文件---字节流---图片
                imagedatastream.Read(image, 0, imagedatalen);
                String Psql = "update [append] set [image]=@imgdata where [id]='0'";

                SqlCommand Pcommand = new SqlCommand(Psql, myConn);
                SqlParameter imgdata = new SqlParameter("@imgdata", SqlDbType.Image);//图片集对象
                imgdata.Value = image;
                Pcommand.Parameters.Add(imgdata);
                myConn.Open();
                Pcommand.ExecuteReader();
                myConn.Close();
                Response.Write("<script>");
                Response.Write("alert('修改添加!!!');");
                Response.Write("</script>");
            }
        }
    }
}
