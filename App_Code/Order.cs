using System;

namespace SCard
{
	/// <summary>
	/// Order 的摘要说明。
	/// </summary>
	public class Order
	{
        private string strOID;
        private string strPID;
        private string strPName;
        private string strPNum;
        private string strPPrice;
        private string strTotalPrice;
        private string strTName;
        private string strEmail;
        private string strPhone;
        private string strPCPrice;//成本

		public Order()
		{
            strOID = string.Empty;
            strPID = string.Empty;
			strPName = string.Empty;
            strPNum = string.Empty;
            strPPrice = string.Empty;
            strTotalPrice = string.Empty;
            strTName = string.Empty;
            strEmail = string.Empty;
            strPhone = string.Empty;
            strPCPrice = string.Empty;
		}

		public string OID
		{
			get{ return strOID;}
			set{ strOID = value; }
		}

		public string PID
		{
			get{ return strPID;}
			set{ strPID = value; }
		}

		public string PName
		{
			get{ return strPName;}
			set{ strPName = value; }
		}

		public string PNum
		{
			get{ return strPNum;}
			set{ strPNum = value; }
		}

		public string PPrice
		{
			get{ return strPPrice;}
			set{ strPPrice = value; }
		}

		public string TotalPrice
		{
			get{ return strTotalPrice;}
			set{ strTotalPrice = value; }
		}

		public string TName
		{
			get{ return strTName;}
			set{ strTName = value; }
		}

		public string Email
		{
			get{ return strEmail;}
			set{ strEmail = value; }
		}

		public string Phone
		{
			get{ return strPhone;}
			set{ strPhone = value; }
		}

		public string PCPrice
		{
			get{ return strPCPrice;}
			set{ strPCPrice = value; }
		}

	}
}
