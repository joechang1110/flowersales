<%@ Page language="c#" Inherits="SCard.myFav" ResponseEncoding="utf-8" CodeFile="LeaveWord.aspx.cs" %>

<%@ Register Src="pageFooter.ascx" TagName="pageFooter" TagPrefix="uc1" %>
<%@ Register Src="pageHeader.ascx" TagName="pageHeader" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>我的收藏</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	 
		<LINK href="style/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body style="text-align: center">
		<form id="Form1" method="post" runat="server">
			<div align="left" style="text-align: center">
                <uc2:pageHeader ID="PageHeader1" runat="server" />
                &nbsp;</div>
            请对该商品进行点评，留下您的宝贵意见~<br>
            &nbsp; &nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="163px" TextMode="MultiLine" Width="723px"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
            <a href="index.aspx">
                返回首页</a>&nbsp;
		</form>
	</body>
</HTML>
