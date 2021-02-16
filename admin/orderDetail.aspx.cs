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
	/// orderDetail 的摘要说明。
	/// </summary>
	public partial class orderDetail : System.Web.UI.Page
	{
    
		protected void Page_Load(object sender, System.EventArgs e)
		{
             
            if( !IsPostBack )
            {
                /*if( Request.QueryString["oid"] == null )
                {
                    Response.Write("<script>");
                    Response.Write("alert('没有这张订单!!!');");
                    Response.Write("</script>");
                    Response.End();
                    return;
                }*/

                string strOID = Request.QueryString["oid"].ToString();

                getOrderData(strOID);//获取订单信息

                string strOState = lblOState.Text;
                switch( strOState )
                {
                    case "0":
                        strOState = "<font color=#ff6600>未处理</font>";
                        break;
                    case "1":
                        strOState = "<font color=#0099cc>完成</font>";
                        break;
                    case "2":
                        strOState = "等待";
                        break;
                    default:
                        strOState = "其他";
                        break;
                }                                   
                lblOState.Text = strOState; 

            }
		}

        private void getOrderData( string strOID )
        {
            DBConn myDB = new DBConn();
            string sql="select * from [Order] where OID='" + strOID + "'";
            SqlDataReader dr  = myDB.getDataReader( sql );
            if( dr.Read() )
            {
                lblOrderID.Text = dr["OID"].ToString();
                lblTName.Text = dr["TName"].ToString();
                string strEmail = dr["Email"].ToString();
                lblEmail.Text = "<a href='mailto:" + strEmail + "'>" + strEmail + "</a>";
                lblPhone.Text = dr["Phone"].ToString();
                lblPID.Text = dr["PID"].ToString();
                lblPName.Text = dr["PName"].ToString();
                lblPPrice.Text = double.Parse( dr["PPrice"].ToString() ).ToString("C");
                lblPNum.Text = dr["PNum"].ToString();
                lblTotalPrice.Text = double.Parse( dr["TotalPrice"].ToString() ).ToString("C");
                lblPubdate.Text = dr["Pubdate"].ToString();
                lblOState.Text = dr["OState"].ToString();

                if (lblPID.Text=="0") lblDetailP.Text = "<a href='../P_OderInfo.aspx?id=" + dr["OID"].ToString() + "' target='_blank'>查看批量购买的产品详情</a>";
          
            }
            /*else
            {
                Response.Write("<script>");
                Response.Write("alert('没有订单编号为[ " + strOID + " ]这条记录!!!');");
                Response.Write("</script>");
            }*/
            dr.Close();
            myDB.Close();
        }
 
	}
}
