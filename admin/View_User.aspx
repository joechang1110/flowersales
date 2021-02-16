<%@ Page language="c#" Inherits="SCard.admin.View_User" CodeFile="View_User.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>edit_tzs</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="Style.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="742" border="0">
					<TR>
					  <TD style="WIDTH: 51px; HEIGHT: 34px" vAlign="top"></TD>
					  <TD   vAlign="top" style="height: 34px"></TD>
				  </TR>
					<TR>
						<TD style="WIDTH: 51px; HEIGHT: 412px" vAlign="top"></TD>
						<TD style="HEIGHT: 412px" vAlign="top">
							<asp:DataGrid id="dgnew" runat="server" AutoGenerateColumns="False" Width="608px" AllowPaging="True"
								GridLines="None" HorizontalAlign="Center" AllowSorting="True" CellPadding="4" ForeColor="#F3F3F3"   Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
								<AlternatingItemStyle HorizontalAlign="Center" BackColor="White" ForeColor="#284775"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333"></ItemStyle>
								<HeaderStyle HorizontalAlign="Center" ForeColor="White" VerticalAlign="Middle" BackColor="#F3F3F3" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="Userid" SortExpression="Userid" HeaderText="编号">
										<HeaderStyle Width="40px"></HeaderStyle>
									</asp:BoundColumn>
									<asp:HyperLinkColumn DataNavigateUrlField="userName" DataNavigateUrlFormatString="../edit.aspx?id={0}" DataTextField="userName"
										HeaderText="用户名称" Target="_blank"></asp:HyperLinkColumn>
                                    <asp:HyperLinkColumn HeaderText="性别" DataTextField="性别">
                                        </asp:HyperLinkColumn>
                                    <asp:HyperLinkColumn HeaderText="年龄" DataTextField="年龄"></asp:HyperLinkColumn>
									<asp:ButtonColumn Text="删除" CommandName="Delete">
										<HeaderStyle Width="40px"></HeaderStyle>
									</asp:ButtonColumn>
								</Columns>
								<PagerStyle VerticalAlign="Middle" Font-Size="Larger" HorizontalAlign="Center" BackColor="#F3F3F3" ForeColor="Teal" Mode="NumericPages" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True"></PagerStyle>
                                <FooterStyle BackColor="#F3F3F3" Font-Bold="True" ForeColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                                <EditItemStyle BackColor="#999999" />
                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
							</asp:DataGrid></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
