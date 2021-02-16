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
    /// orderList 腔晡猁佽隴﹝
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

                    string sql = "delete from  [tblBasket] where id=" + Pid;

                    DBConn myDB = new DBConn();

                    myDB.ExecuteNonQuery(sql);
                    myDB.Close();
                }

                if (Session["User"] != null)
                {
                    txtName.Enabled = false;
                    txtName.Text = (string)Session["User"];
                    DBConn db1 = new DBConn();
                    TextBox1.Text = db1.LookUp("select 真实姓名 from tblUser  where UserName='" + (string)Session["User"] + "'", "真实姓名");
                    lblTotalPric.Text = db1.LookUp("select sum(ismoney) as '1' from viwBasket  where tblUser='" + (string)Session["User"] + "'", "1");
                }
                else
                {

                    Response.Write("<script>alert('未登陆禁止订购');window.close();</script>");
                    Response.End();
                    return;
                }

                getData();

                string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
                string connStr = (DBPath);
                SqlConnection con = new SqlConnection(connStr);
       
                con.Open();
               string  sql1 = "select * from tblMode";
                SqlDataAdapter sda1 = new SqlDataAdapter(sql1, con);

                DataSet ds1 = new DataSet();
                sda1.Fill(ds1, "tblMode");

                foreach (DataRow row in ds1.Tables[0].Rows)
                {
                    this.dplBm.Items.Add(row["名称"].ToString());
                }

            }
        }

        private void getData()
        {
            string sql = "select * from [viwBasket] where tblUser='" + (string)Session["User"] + "'order by ID desc";
            MySqlPager SqlPager = new MySqlPager();
            SqlPager.setAttribute(SqlPager1, "FavDataGrid", sql, "ID desc", 20);
        }

        #region Web 敦极扢數汜傖腔測鎢
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 蜆覃蚚岆 ASP.NET Web 敦极扢數垀斛剒腔﹝
            //

            base.OnInit(e);
        }

        /// <summary>
        /// 扢數盓厥垀剒腔源楊 - 祥猁妏蚚測鎢晤憮党蜊
        /// 森源楊腔囀﹝
        /// </summary>

        #endregion


        protected void btnOK_Click(object sender, System.EventArgs e)
        {
 
            string strName = txtName.Text.Trim();
            string strEmail = txtEmail.Text.Trim();
            string strPhone = txtPhone.Text.Trim();


            if (strName == String.Empty || strEmail == String.Empty || strPhone == String.Empty)
            {
                Response.Write("<script>");
                Response.Write("alert('请把必填项添上!!!');");
                Response.Write("</script>");
                return;
            }


            if (lblTotalPric.Text == String.Empty || lblTotalPric.Text == "0")
            {
               
                Response.Write("<script>");
                Response.Write("alert('购物车空,没办法生成订单!!!');");
                Response.Write("</script>");
                return;
            }
 
         
            if (Session["CheckCode"].ToString() != txtCheck.Text.Trim())
            {
                Response.Write("<script>");
                Response.Write("alert('输入的验证码有误！请重新输入')");
                Response.Write("</script>");
                return;
            }

            Order myOrder = new Order();
            myOrder.PID = "0"; //杻隅蠶講劃昜腔梓妎
            myOrder.TotalPrice = lblTotalPric.Text;
            myOrder.TName = CleanString.htmlInputText(strName);
            myOrder.Email = strEmail;
            myOrder.Phone = CleanString.htmlInputText(strPhone);

          Session["myOrder"]=  myOrder;
            Response.Redirect("orderinfo.aspx?key=" + Server.UrlEncode("makeOrder.aspx?id=" ));

        }
        

        protected void btnClear_Click(object sender, System.EventArgs e)
        {
     
            txtEmail.Text = "";
            txtPhone.Text = "";
      

            txtCheck.Text = "";
        }

}
}
