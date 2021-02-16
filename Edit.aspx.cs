using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
namespace SCard
{

    public partial class Reg : System.Web.UI.Page
    {
        public string newid;

        protected void Button1_Click(object sender, EventArgs e)
        {


            string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
            string connStr = (DBPath);
            SqlConnection con = new SqlConnection(connStr);
        
            con.Open();
            if (this.txtUserName.Text.ToString().Length == 0)
            {
                Response.Write("<script>alert('用户名称未填写')</script>");
                return;
            }

            string UserName, Psw, 年龄, 联系方式, 备注, 真实姓名;


            UserName = this.txtUserName.Text;
            Psw = this.txtPsw.Text;
            真实姓名 = this.TextBox1.Text;
            联系方式=txtZh.Text;
            年龄 = this.txtOld.Text;
   
            备注 = this.txtNode.Text;
            string sSql;
            if (Psw + "" != "")
            { sSql = "Update tblUser set  username='" + UserName + "',联系方式='" + 联系方式 + "',  真实姓名='" + 真实姓名 + "',Psw='" + Psw + "',年龄='" + 年龄 + "',备注='" + 备注 + "'where UserName='" + Label1.Text + "'"; }
            else
            { sSql = "Update tblUser set  username='" + UserName + "',联系方式='" + 联系方式 + "',  真实姓名='" + 真实姓名 + "',年龄='" + 年龄 + "',备注='" + 备注 + "'where UserName='" + Label1.Text + "'"; }
            

            SqlCommand cmd = new SqlCommand(sSql, con);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('用户信息修改成功！请重新登陆')</script>");
            

        }
        //页面加载
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                newid = Request.Params["id"];
                Label1.Text = newid;

                string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
                string connStr = (DBPath);
                SqlConnection con = new SqlConnection(connStr);

                con.Open();

                SqlCommand command = new SqlCommand("select * from tblUser where UserName='" + newid + "'", con);
                SqlDataReader sdr = command.ExecuteReader();
                if (sdr.Read())
                {
                    txtUserName.Text = sdr["UserName"].ToString();
                    TextBox1.Text = sdr["真实姓名"].ToString();
                    txtPsw.Text = sdr["Psw"].ToString();
                    txtNode.Text = sdr["备注"].ToString();
                    txtZh.Text = sdr["联系方式"].ToString();
                    this.txtOld.Text = sdr["年龄"].ToString();
    
                    sdr.Close();
                    
                }
                else
                {
                    sdr.Close();
                    Response.Write("对不起参数有误");
                    Response.End();
                }

                con.Close();
            }
        }
 
    }
}