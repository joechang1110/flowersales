<%@ Page language="c#" Inherits="SCard.admin.initialize" CodeFile="initialize.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>initialize</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid fixed'>
				<tr>
					<td width='140' class='category'>系统初始化</td>
					<td class='category'><font class='t1'>[注意:'初始化'前好慎重考虑,一旦初始化了所有数据就会丢失]</font></td>
				</tr>
				<tr>
					<td>管理名</td>
					<td>
						<asp:TextBox id="txtName" ReadOnly="True" MaxLength="25" Width="150" runat="server"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>密码</td>
					<td>
						<asp:TextBox id="txtPassword" MaxLength="25" Width="150" runat="server" TextMode="Password"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<asp:Button id="btnOK" runat="server" Text="初始化" onclick="btnOK_Click"></asp:Button></td>
				</tr>
			</table>
			<div align="right"><font class='t1'>[初始化不会还原'管理员'和'系统杂项'的信息]</font></div>
		</form>
	</body>
</HTML>
