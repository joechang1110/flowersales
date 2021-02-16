<%@ Page language="c#" Inherits="SCard.admin.myorderList" ResponseEncoding="utf-8" CodeFile="myorderList.aspx.cs" %>

<%@ Register Src="../pageFooter.ascx" TagName="pageFooter" TagPrefix="uc1" %>
<%@ Register Src="../pageHeader.ascx" TagName="pageHeader" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>orderList</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
<form id="Form1" method="post" runat="server">
			<div align="left">
                &nbsp;</div>
			<br>
			<asp:DataGrid id="OrderDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" cellpadding='4'
				cellspacing='1' CssClass='grid fixed'>
				<HeaderStyle HorizontalAlign="Center" CssClass="category"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="OID" HeaderText="订单编号">
						<HeaderStyle ForeColor="#0F83EC" Width="160px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="TName" HeaderText="姓名">
						<HeaderStyle ForeColor="#0F83EC" Width="150px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Email" HeaderText="电子邮件">
						<HeaderStyle ForeColor="#0F83EC" Width="170px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="OState" HeaderText="状态">
						<HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Pubdate" HeaderText="时间">
						<HeaderStyle ForeColor="#0F83EC" Width="140px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
						<ItemTemplate>
							<a target=_blank href='orderDetail.aspx?oid=<%#DataBinder.Eval(Container.DataItem,"OID")%>'>
								详细信息</a>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
			<cc1:SqlPager id="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev" CacheDuration="0"></cc1:SqlPager>
            &nbsp;
		</form>

	</body>
</HTML>
