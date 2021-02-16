<%@ Page language="c#" Inherits="SCard.admin.adminAdd" CodeFile="adminAdd.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>adminAdd</title>
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
			        <td width='140' class='category'>新增管理员</td>
			        <td class='category'></td>
		        </tr>
                <tr>
                    <td>管理名</td>
                    <td>
                        <asp:TextBox id="txtName" MaxLength="25" Width=150 runat="server"></asp:TextBox>
                        用作后台管理登录名
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <asp:TextBox id="txtPassword" MaxLength="25" Width=150 runat="server" TextMode="Password"></asp:TextBox>
                        为了保证您信息的安全性，请将密码设置为6位以上
                    </td>
                </tr>
                <tr>
                    <td>
                        确认密码
                    </td>
                    <td>
                        <asp:TextBox id="txtRPassword" MaxLength="25" Width=150 runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="两次输入的密码不一致" Font-Bold="True"
                            ControlToCompare="txtPassword" ControlToValidate="txtRPassword"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button id="btnAdd" runat="server" Text="添加" onclick="btnAdd_Click"></asp:Button></td>
                </tr>
            </table>
        </form>
    </body>
</HTML>
