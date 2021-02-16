using System;

using System.Configuration;

namespace SCard
{
	/// <summary>
	/// mySqlPager 的摘要说明。
	/// </summary>
	public sealed class MySqlPager : System.Web.UI.Page
	{

        public void setAttribute( DevCenter.SqlPager SqlPager, 
            string strControlToPaginate, string strSelectCommand)
        {
            SqlPager.ControlToPaginate = strControlToPaginate;
			string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
			SqlPager.ConnectionString = (DBPath); 
            //SqlPager.ConnectionString = ConfigurationSettings.AppSettings["ConnStr"];
            SqlPager.SelectCommand = strSelectCommand;
            SqlPager.ItemsPerPage = 10;
            SqlPager.CurrentPageIndex = 0;
            SqlPager.DataBind();
        }

        public void setAttribute( DevCenter.SqlPager SqlPager, 
            string strControlToPaginate, string strSelectCommand,
            int iItemsPerPage)
        {
            SqlPager.ControlToPaginate = strControlToPaginate;
			string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
			SqlPager.ConnectionString = (DBPath); 
			//SqlPager.ConnectionString = ConfigurationSettings.AppSettings["ConnStr"];
            SqlPager.SelectCommand = strSelectCommand;
            SqlPager.ItemsPerPage = iItemsPerPage;
            SqlPager.CurrentPageIndex = 0;
            SqlPager.DataBind();
        }

        public void setAttribute( DevCenter.SqlPager SqlPager, 
            string strControlToPaginate, string strSelectCommand,
            string strSortField, int iItemsPerPage)
        {
            SqlPager.ControlToPaginate = strControlToPaginate;
			string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
			SqlPager.ConnectionString = (DBPath); 
			//SqlPager.ConnectionString = ConfigurationSettings.AppSettings["ConnStr"];
            SqlPager.SelectCommand = strSelectCommand;
            SqlPager.SortField = strSortField;//只能 ASC
            SqlPager.ItemsPerPage = iItemsPerPage;
            SqlPager.CurrentPageIndex = 0;
            SqlPager.DataBind();
        }

        public void setAttribute( DevCenter.SqlPager SqlPager, 
            string strControlToPaginate, string strSelectCommand,
            string strSortField, int iItemsPerPage, int iCurrentPageIndex)
        {
            SqlPager.ControlToPaginate = strControlToPaginate;
			string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
			SqlPager.ConnectionString = (DBPath); 
			//SqlPager.ConnectionString = ConfigurationSettings.AppSettings["ConnStr"];
            SqlPager.SelectCommand = strSelectCommand;
            SqlPager.SortField = strSortField;//只能 ASC
            SqlPager.ItemsPerPage = iItemsPerPage;
            SqlPager.CurrentPageIndex = iCurrentPageIndex;
            SqlPager.DataBind();
        }


	}
}
