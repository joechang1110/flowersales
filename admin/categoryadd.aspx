<%@ Page language="c#" Inherits="SCard.admin.categoryAdd" ResponseEncoding="utf-8" CodeFile="categoryAdd.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>categoryAdd</title>
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
			        <td width='140' class='category'>添加分类</td>
			        <td class='category'></td>
		        </tr>
		        <tr>
			        <td>新分类的名称</td>
			        <td>
			            <asp:TextBox id="TextBox1" MaxLength="25" Width=150 runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
			            <asp:Button id="Button1" runat="server" Text="添 加" onclick="Button1_Click"></asp:Button>
			        </td>
		        </tr>
		        <tr>
			        <td></td>
			        <td>
			            <asp:Repeater id="Repeater1" runat="server">
				            <ItemTemplate>
					            <%#DataBinder.Eval(Container.DataItem,"CName")%>
					            <br>
				            </ItemTemplate>
			            </asp:Repeater>
			        </td>
		        </tr>
	        </table>
		</form>
	</body>
</HTML>
