<%@ Page language="c#" Inherits="SCard.admin.adminSelf" CodeFile="adminSelf.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>adminSelf</title>
        <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
        <meta name="CODE_LANGUAGE" Content="C#">
        <meta name="vs_defaultClientScript" content="JavaScript">
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <LINK href="style.css" type="text/css" rel="stylesheet">
    </HEAD>
    <body>
        <form id="Form1" method="post" runat="server">
            <table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid'>
                <tr>
                    <td width='140' class='category'></td>
                    <td class='category'>修改自己的管理登录设置</td>
                </tr>
                <tr>
                    <td>登录名</td>
                    <td>
                        <asp:TextBox id="txtAdmin" ReadOnly=True Width=150 runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="HEIGHT: 31px">新密码</td>
                    <td style="HEIGHT: 31px"><asp:TextBox id="txtPassword" MaxLength="25" Width=150 runat="server" TextMode="Password"></asp:TextBox>
                        为了保证您的资料的安全性，请将密码长度设置为6位以上</td>
                </tr>
                <tr>
                    <td>
                        确认密码</td>
                    <td><asp:TextBox id="txtRPassword" MaxLength="25" Width=150 runat="server" TextMode="Password"></asp:TextBox>&nbsp;
                        <asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="两次输入的密码不一致" Font-Bold="True"
                            ControlToCompare="txtPassword" ControlToValidate="txtRPassword"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button id="btnOK" runat="server" Text="修 改" onclick="btnOK_Click"></asp:Button></td>
                </tr>
            </table>
        </form>
    </body>
</HTML>
