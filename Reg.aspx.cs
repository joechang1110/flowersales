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

namespace SCard
{

    public partial class Reg : System.Web.UI.Page
    {
 
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
            if (this.txtPsw.Text.ToString().Length == 0)
            {
                Response.Write("<script>alert('密码不能为空')</script>");
                return;
            }

            if (this.txtPsw.Text.ToString() != txtPsw1.Text.ToString())
            {
                Response.Write("<script>alert('再次输入的密码不一致')</script>");
                return;
            }

            string UserName, Psw, 性别, 年龄, 备注, 联系方式, 真实姓名;

            UserName = this.txtUserName.Text;
            Psw = this.txtPsw.Text;
            性别 = this.dplSex.Text;
            年龄 = this.txtOld.Text;
            备注 = this.txtNode.Text;
            联系方式 = this.txtZh.Text;
            真实姓名 = this.TextBox1.Text;

            SqlCommand command = new SqlCommand("select * from tblUser where UserName='" + UserName+ "'", con);
            SqlDataReader sdr = command.ExecuteReader();
            if (sdr.Read())
            {
                Response.Write("<script>alert('用户名重复')</script>");
                sdr.Close();
                return;
            }
            sdr.Close();
            string sSql = "Insert into tblUser(UserName,Psw,性别,年龄,备注,联系方式,真实姓名) values ( '" + UserName + "', '" + Psw + "', '" + 性别 + "', '" + 年龄 + "', '" + 备注 + "', '" + 联系方式 + "','" + 真实姓名  + "')";
            SqlCommand cmd = new SqlCommand(sSql, con);
            cmd.ExecuteNonQuery();

            Session["User"] = txtUserName.Text.ToString();

            Response.Write("<script>alert('注册成功')</script>");
     
            Response.Write("<script>location.href='index.aspx';</script>");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
 
            dplSex.Items.Add("男");
            dplSex.Items.Add("女");

        }
      
    }


}
