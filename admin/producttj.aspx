<%@ Page language="c#" Inherits="SCard.admin.productHot" ResponseEncoding="utf-8" CodeFile="producttj.aspx.cs" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>盈利分析</title>
        <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
        <meta name="CODE_LANGUAGE" Content="C#">
        <meta name="vs_defaultClientScript" content="JavaScript">
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <LINK href="style.css" type="text/css" rel="stylesheet">
        <script language="JavaScript" src="calendar.js"></script>

    </HEAD>
    <body>
        <form id="Form1" method="post" runat="server">
            <table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid fixed'>
		        <tr>
			        <td class='category' style="height: 113px">盈利分析 - <font class='t1'>(可以显示12个) 选择时间段,
                        统计盈利 &nbsp; 盈利= 销售金额--进货金额<br />
                        自<asp:TextBox ID="TextBox1" runat="server"  onFocus="calendar()"></asp:TextBox>
                        至<asp:TextBox ID="TextBox2" runat="server"   onFocus="calendar()"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="统计" OnClick="Button1_Click" />&nbsp;&nbsp;<br />
                        <br />
                        <asp:Label ID="lblNote" runat="server"></asp:Label></font></td>
		        </tr>
		    </table>
            &nbsp;<br>
            &nbsp;
        </form>
        
        <br><br><br><br>
    </body>
</HTML>
