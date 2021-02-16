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
using System.Web.Security;

namespace SCard
{
    /// <summary>
    /// orderinfo 的摘要说明。
    /// </summary>
    public partial class orderinfo : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label lblPFPrice;
        protected System.Web.UI.WebControls.Label lblPNPrice;
        protected System.Web.UI.WebControls.Label lblIsStock;
        protected System.Web.UI.HtmlControls.HtmlImage myImg;
        protected System.Web.UI.WebControls.Label lblPName1;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["myOrder"] == null)
                {
                    Response.Redirect("index.aspx");
                    return;
                }

                //返回操作
                if (Request.QueryString["key"] == null || Request.QueryString["key"].ToString() == String.Empty)
                {
                    Response.Redirect("index.aspx");
                    return;
                }
                string strBack = Request.QueryString["key"].ToString();
                strBack = Server.UrlDecode(strBack);
                lblBack.Text = "<a href='index.aspx'>返回</a>";

                Order myOrder = (Order)Session["myOrder"];
                string strOID = myOrder.OID;
                string strPID = myOrder.PID;
                string strPName = myOrder.PName;
                string strPNum = myOrder.PNum;
                string strPPrice = myOrder.PPrice;
                string strTotalPrice = myOrder.TotalPrice;
                string strTName = myOrder.TName;
                string strEmail = myOrder.Email;
                string strPhone = myOrder.Phone;
                string strPCPrice = myOrder.PCPrice;//成本


                strOID = getNewOrderID(); //订单号
                string sql = "";
                DBConn myDB = new DBConn();


                if (strPID == "0")
                {
                    //没有ID 为批量购物的订单
                    //清空购物车,添加批量记录
                    strPName = "批量购买产品,请查看详情";
                    strPNum = "0";
                    strPPrice = "0";

                    sql = "select * from [viwBasket] where tblUser='" + (string)Session["User"] + "'order by ID desc";

                    DataSet ds1 = myDB.getDataSet(sql);


                    foreach (DataRow row in ds1.Tables[0].Rows)
                    {
                        string sql1 = "";
                        string tblUser, Pid, isN, isMoney, OrderNo;
                        tblUser = row["tblUser"].ToString();
                        isN = row["isN"].ToString();
                        isMoney = row["isMoney"].ToString();
                        OrderNo = strOID;
                        Pid = row["Pid"].ToString();

                        sql1 = "Insert into tblP_Order(tblUser,Pid,isN,isMoney,OrderNo) values ( '" +
                            tblUser + "', '" + Pid + "', '" + isN + "', " + isMoney + ", '" + OrderNo + "')";
                        myDB.ExecuteNonQuery(sql1);

                        myDB.ExecuteNonQuery("Update Products Set PStock = PStock - " + isN + ",PSellNum = PSellNum + " + isN + " WHERE PID = " + Pid);

                    }

                    sql = "delete from [tblBasket] where tblUser='" + (string)Session["User"] + "'";
                    myDB.ExecuteNonQuery(sql);//删除购物车


                    sql = "insert into [Order](OID,PID,PName,PNum,PPrice,TotalPrice,Pubdate,TName,Email,Phone,PCPrice) values('" +
                     strOID + "'," + strPID + ",'" + strPName + "'," + strPNum + "," + strPPrice + "," + strTotalPrice + ",'" +
                     DateTime.Now + "','" + strTName + "','" + strEmail + "','" + strPhone + "',0)";


                }
                else
                {
                    sql = "insert into [Order](OID,PID,PName,PNum,PPrice,TotalPrice,Pubdate,TName,Email,Phone,PCPrice) values('" +
                          strOID + "'," + strPID + ",'" + strPName + "'," + strPNum + "," + strPPrice + "," + strTotalPrice + ",'" +
                          DateTime.Now + "','" + strTName + "','" + strEmail + "','" + strPhone + "'," + strPCPrice + ")";

                    myDB.ExecuteNonQuery("Update Products Set PStock = PStock - " + strPNum + ",PSellNum = PSellNum + " + strPNum + " WHERE PID = " + strPID);

                }


                myDB.ExecuteNonQuery(sql);


                myOrder.OID = strOID;
                Session["myOrder"] = myOrder;

                if (strPID == "0") lblDetailP.Text = "<a href='P_OderInfo.aspx?id=" + strOID + "' target='_blank'>查看批量购买的产品详情</a>";

                lblOrderID.Text = strOID;
                lblPName.Text = strPName;
                lblPNum.Text = strPNum;
                lblPPrice.Text = strPPrice;
                lblTotalPrice.Text = strTotalPrice;
                lblTName.Text = strTName;
                lblEmail.Text = strEmail;
                lblPhone.Text = strPhone;
                Label1.Text = myDB.LookUp("select * from tbluser where UserName='" + strTName + "'", "真实姓名");

                myDB.Close();
            }
        }


        private string getNewOrderID()//获取新的流水帐号
        {
            string strOrderID = "";

            DateTime myTime = System.DateTime.Now;
            strOrderID = myTime.Year.ToString();
            strOrderID += myTime.Month.ToString("00");
            strOrderID += myTime.Day.ToString("00");
            strOrderID += myTime.Hour.ToString("00");
            strOrderID += myTime.Minute.ToString("00");
            strOrderID += myTime.Second.ToString("00");
            strOrderID += myTime.Millisecond.ToString("000");//毫秒

            DBConn myDB = new DBConn();
            string sql = "select OID from [Order] order by OID desc";
            SqlDataReader dr = myDB.getDataReader(sql);
            if (dr.Read())
            {
                string strTemp = dr["OID"].ToString();
                int iTemp = Int32.Parse(strTemp.Substring(strTemp.Length - 2, 2)) + 1;
                strOrderID += (iTemp % 100).ToString("00");
            }
            else
            {
                strOrderID += "00";
            }
            dr.Close();
            myDB.Close();

            return strOrderID;
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


    }
}
