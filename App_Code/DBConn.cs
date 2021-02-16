using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SCard
{
	/// <summary>
	/// DBConn 的摘要说明。
	/// </summary>
	public class DBConn : System.Web.UI.Page
	{
		private SqlConnection conn;

		public DBConn()
		{
			string DBPath = ConfigurationSettings.AppSettings["DataBasePath"];
			string connStr = (DBPath);
			conn=new SqlConnection(connStr);
			conn.Open();
		}

		public DBConn(string DBPath)
		{
			string connStr = (DBPath);
			conn=new SqlConnection(connStr);
			conn.Open();
		}

		public void Close()//关闭数据库连接
		{
			conn.Close();
			conn = null;
		}

		public SqlDataReader getDataReader(string SQLQuery)
		{
			SqlCommand cmd = new SqlCommand(SQLQuery,conn);
			return cmd.ExecuteReader();
		}

		public int ExecuteNonQuery(string SQLQuery)
		{
			SqlCommand cmd = new SqlCommand(SQLQuery,conn);
			return cmd.ExecuteNonQuery();
		}

		public DataSet getDataSet(string SQLQuery)
		{
			SqlDataAdapter da = new SqlDataAdapter(SQLQuery,conn);
			DataSet ds = new DataSet();
			da.Fill(ds);
			da.Dispose();
			da = null;
			return ds;
		}

		

        public string LookUp(string strSql, string strField)
        {
        
            DataRow dr;
      
            SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                return "";
            }
            dr = ds.Tables[0].Rows[0];
            return dr[strField].ToString();
            ds.Clear();
         
        }



	}
}
