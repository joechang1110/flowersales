<%@ Page language="c#" Inherits="SCard.admin.clearOrders" CodeFile="clearOrders.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>clearOrders</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <LINK href="style.css" type="text/css" rel="stylesheet">
  </head>
  <body>
	    <form id="Form1" method="post" runat="server">
            <table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid fixed'>
                <tr>
                    <td width='140' class='category'>清空订单记录</td>
                    <td class='category'><font class='t1'>[注意:'清空订单记录'前要慎重考虑,一旦清空了,所有数据就会丢失]</font></td>
                </tr>
                <tr>
                    <td>管理名</td>
                    <td>
                        <asp:TextBox id="txtName" ReadOnly=True MaxLength="25" Width=150 runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <asp:TextBox id="txtPassword" MaxLength="25" Width=150 runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button id="btnOK" runat="server" Text="清空所有订单记录" onclick="btnOK_Click"></asp:Button></td>
                </tr>
            </table>
            <div align=right><font class='t1'>[一般'清空所有订单记录'是在年终结算完毕后进行]</font></div>
        </form>
  </body>
</html>
