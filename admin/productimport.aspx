<%@ Page language="c#" Inherits="SCard.admin.productImport" ResponseEncoding="utf-8" CodeFile="productImport.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>入货()</title>
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
                    <td width='140' class='category'>
                        鲜花名称:</td>
                    <td class='category'><asp:Label id="lblName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td width='140' class='category'>
                        鲜花数量:</td>
                    <td class='category'>
                        <asp:TextBox ID="txtN" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交入库数据" />
                        </td>
                </tr>
            </table>
            
            
            <br>
        </form>
        
        <br><br>
        <br><br>
        <br><br>
    </body>
</HTML>
