<%@ Page language="c#" Inherits="SCard.admin.otherAnnounce" ResponseEncoding="utf-8" CodeFile="otherAnnounce.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>otherAnnounce</title>
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
                    <td width='140' class='category'>修改公告</td>
                    <td class='category'></td>
                </tr>
                <tr>
                    <td valign='top'>输入公告内容<br></td>
                    <td><asp:TextBox id="txtAnnounce" runat="server" TextMode="MultiLine" Rows="7" style="WIDTH:340px" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button id="btnOk" runat="server" Text="修 改" onclick="btnOk_Click"></asp:Button></td>
                </tr>
            </table>
        </form>
    </body>
</HTML>
