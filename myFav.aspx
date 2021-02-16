<%@ Page language="c#" Inherits="SCard.myFav" ResponseEncoding="utf-8" CodeFile="myFav.aspx.cs" %>

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
			<div align="left">
                &nbsp;</div>
            <uc2:pageHeader ID="PageHeader1" runat="server" />
			<br>
			<asp:DataGrid id="FavDataGrid" runat="server" AutoGenerateColumns="False" Width="84%" cellpadding='4'
				cellspacing='1' CssClass='grid fixed' OnSelectedIndexChanged="OrderDataGrid_SelectedIndexChanged">
				<HeaderStyle HorizontalAlign="Center" CssClass="category"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="ID" HeaderText="编号">
						<HeaderStyle ForeColor="#0F83EC" Width="160px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="isDate" HeaderText="收藏时间">
						<HeaderStyle ForeColor="#0F83EC" Width="150px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
                    <asp:BoundColumn DataField="PID" HeaderText="鲜花编号"></asp:BoundColumn>
					<asp:BoundColumn DataField="PName" HeaderText="鲜花名称">
						<HeaderStyle ForeColor="#0F83EC" Width="170px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn>
						<HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
						<ItemTemplate>
							<a target=_blank href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
								详细信息</a>
						</ItemTemplate>
					</asp:TemplateColumn>
							<asp:TemplateColumn>
						<HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
						<ItemTemplate>
							<a  href='?did=<%#DataBinder.Eval(Container.DataItem,"ID")%>'>
								删除该信息</a>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
			<cc1:SqlPager id="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev" CacheDuration="0" Width="761px"></cc1:SqlPager>
            &nbsp;&nbsp;
            <uc1:pageFooter ID="PageFooter1" runat="server" />
		</form>
	</body>
</HTML>
