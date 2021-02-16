namespace SCard
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///	pageHeader 腔晡猁佽隴﹝
	/// </summary>
	public partial class pageHeader : System.Web.UI.UserControl
	{
        protected System.Web.UI.WebControls.Image imgLogo;
        protected System.Web.UI.WebControls.Label lblDataTime;
        protected System.Web.UI.WebControls.Image imgBanner;
        public string strLg = "";

		protected void Page_Load(object sender, System.EventArgs e)
		{
            
                   if (Session["User"] !=null)
             {
                 strLg = "<td width=98><a href=tuLogin.aspx>退出登陆</a></td>" +
 "        <td width=10><img src=images/line.gif></td>" +
 "               <td width=158>" + Session["User"] + "已经登陆 </a></td>" +
  "        <td width=10><img src=images/line.gif></td>" +
 "          <td width=98><a href=Edit.aspx?id=" + Session["User"] + " >修改信息</a></td>" +
 "        <td width=10><img src=images/line.gif></td>"+
 "          <td width=98><a href=myBasket.aspx target=_blank>我的购物车</a></td>" +
 "        <td width=10><img src=images/line.gif></td>" +
  "        <td width=10><img src=images/line.gif></td>" +
 "          <td width=98><a href=admin/myorderlist.aspx target=_blank>我的订单</a></td>" +

 "          <td width=98><a href=myFav.aspx target=_blank>我的收藏</a></td>" +
 "        <td width=10><img src=images/line.gif></td>";


             }else{
                 strLg = "<td width=98><a href=uLogin.aspx>用户登陆</a></td>" +
"        <td width=10><img src=images/line.gif></td>" +
"               <td width=98><a href=Reg.aspx>用户注册</a></td>" +
"        <td width=10><img src=images/line.gif></td>" ;



                   }


               getDataTime();//鳳炵苀奀潔
             
        }

        private void getDataTime()
        {
            DateTime myDate = DateTime.Now;
            string strDate = myDate.ToLongDateString();
            string strW = "";
            switch( myDate.DayOfWeek.ToString() )
            {
                case "Sunday":strW= "星期日"; break;
                case "Monday":strW= "星期一"; break;
                case "Tuesday":strW= "星期二"; break;
                case "Wednesday":strW= "星期三"; break;
                case "Thursday":strW= "星期四"; break;
                case "Friday":strW= "星期五"; break;
                case "Saturday":strW= "星期六"; break;
            }

            lblDateTime.Text = strDate + "&nbsp;" + strW;

        }


       #region Web 敦极扢數汜傖腔測鎢
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 蜆覃蚚岆 ASP.NET Web 敦极扢數垀斛剒腔﹝
            //
            InitializeComponent();
            base.OnInit(e);
        }
		
        /// <summary>
        ///		扢數盓厥垀剒腔源楊 - 祥猁妏蚚測鎢晤憮
        ///		党蜊森源楊腔囀﹝
        /// </summary>
        private void InitializeComponent()
        {

        }
		#endregion
	}
}
