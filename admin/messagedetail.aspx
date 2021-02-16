<%@ Page language="c#" Inherits="SCard.admin.messageDetail" CodeFile="messageDetail.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>留言板详细信息</title>
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
                    <td width='140' class='category'>留言板详细信息</td>
                    <td class='category'>带<font class='t2'>*</font>为必填</td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><asp:Label ID="lblUName" Runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>联系电话</td>
                    <td><asp:Label ID="lblUPhone" Runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>E-mail <font class='t2'>*</font></td>
                    <td><asp:Label ID="lblUEmail" Runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>标题 <font class='t2'>*</font></td>
                    <td><asp:Label ID="lblMTitle" Runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td vAlign="top">
                        内容 <font class='t2'>*</font><br>
                        (300字以内)
                    </td>
                    <td><asp:textbox id="txtMContent" runat="server" Width="400" TextMode="MultiLine" Rows="15" Columns="30"></asp:textbox></td>
                </tr>
                <tr>
                    <td>日期:</td>
                    <td><asp:Label ID="lblDate" Runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <INPUT type="button" onclick="self.close()" value="关闭">
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
