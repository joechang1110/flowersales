<%@ Page language="c#" Inherits="SCard.admin.orderDetail" ResponseEncoding="utf-8" CodeFile="orderDetail.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>订单详细信息</title>
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
					<td width='140' class='category'>订单编号：</td>
					<td class='category'><asp:label id="lblOrderID" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td colspan="2" class='category'>买家的信息</td>
				</tr>
				<tr>
					<td align="right">姓 名：</td>
					<td><asp:label id="lblTName" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">电子邮件：</td>
					<td><asp:label id="lblEmail" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">联系电话：</td>
					<td><asp:label id="lblPhone" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td colspan="2" class='category'>
                        所购鲜花信息 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp;&nbsp;
                        <asp:Label ID="lblDetailP" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
				</tr>
				<tr>
					<td align="right">编 号：</td>
					<td><asp:label id="lblPID" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">名 称：</td>
					<td><asp:label id="lblPName" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">单 价：</td>
					<td><asp:label id="lblPPrice" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">数 量：</td>
					<td><asp:label id="lblPNum" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">总 价：</td>
					<td><asp:label ForeColor="#CC0033" id="lblTotalPrice" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td colspan="2" class='category'>其他信息</td>
				</tr>
				<tr>
					<td align="right">创建时间：</td>
					<td><asp:label id="lblPubdate" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">状 态：</td>
					<td><asp:label id="lblOState" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td colspan="2" class='category'></td>
				</tr>
				<tr>
					<td colspan="2">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						
						<INPUT type="button" onClick="self.close()" value="关闭">
					</td>
				</tr>
			</table>
		</form>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</body>
</HTML>
