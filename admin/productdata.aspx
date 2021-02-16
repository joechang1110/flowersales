<%@ Page language="c#" Inherits="SCard.admin.productData" ResponseEncoding="utf-8" CodeFile="productData.aspx.cs" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>仓库管理</title>
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
                    <td width='140' class='category'>鲜花名称:</td>
                    <td class='category' colspan=4>
                        <asp:Label id="lblPName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align=right>库　　　&nbsp;&nbsp; 存:</td>
                    <td align=center style="width: 144px"><asp:Label id="lblPStock" runat="server" style="z-index: 100; left: 180px; position: absolute; top: 43px"></asp:Label></td>
                    <td colspan=3>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align=right>
                        累积销售数量:</td>
                    <td align=center style="width: 144px"><asp:Button id="btnResetPSellNum" Text="重新累积" Runat="server" onclick="btnResetPSellNum_Click" style="z-index: 100; left: 328px; position: absolute; top: 67px"></asp:Button>
                    </td>
                    <td align=right colspan="3">
                        <asp:Label id="lblPSellNum" runat="server" style="z-index: 100; left: 180px; position: absolute; top: 71px"></asp:Label>
                        &nbsp;</td>
                </tr>
            </table>
            <br>
        
        <br><br>
        <br><br>
        <br><br>
        </form>
    </body>
</HTML>
