<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="SCard.Reg" %>

<%@ Register Src="pageFooter.ascx" TagName="pageFooter" TagPrefix="uc1" %>
<%@ Register Src="pageHeader.ascx" TagName="pageHeader" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
 
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc2:pageHeader ID="PageHeader1" runat="server" />
      <table border="0" align="center" class="webname">
        <tr>
          <td bgcolor="#F0F5F9" style="height: 18px">
              </td>
          <td bgcolor="#F0F5F9" style="height: 18px; font-weight: bold; font-size: small;">
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;用户修改个人信息 &nbsp;          </td>
        </tr>
        <tr>
          <td bgcolor="#F0F5F9">&nbsp;用户登录ID</td>
          <td bgcolor="#F0F5F9">&nbsp;
          <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
        </tr>
          <tr>
              <td bgcolor="#f0f5f9">
                  用户姓名</td>
              <td bgcolor="#f0f5f9">
                  &nbsp;
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
          </tr>
        <tr>
          <td bgcolor="#F0F5F9">&nbsp;密码</td>
          <td bgcolor="#F0F5F9">&nbsp;
          <asp:TextBox ID="txtPsw" runat="server" TextMode="Password"></asp:TextBox><br />
              密码不修改则空</td>
        </tr>
        <tr>
          <td bgcolor="#F0F5F9" style="height: 22px">&nbsp;年龄</td>
          <td bgcolor="#F0F5F9" style="height: 22px">&nbsp;
          <asp:TextBox ID="txtOld" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <td bgcolor="#F0F5F9">          &nbsp;联系方式</td>
          <td bgcolor="#F0F5F9">          &nbsp;
              <asp:TextBox ID="txtZh" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <td bgcolor="#F0F5F9" style="height: 21px">
              家庭住址</td>
          <td bgcolor="#F0F5F9" style="height: 21px">&nbsp;
            <asp:TextBox ID="txtNode" runat="server" Height="111px" 
                  TextMode="MultiLine" Width="257px"></asp:TextBox>
              <br />
          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" Height="25px" Width="56px" /><br />          </td>
        </tr>
      </table>
    </div>
        &nbsp;
        <uc1:pageFooter ID="PageFooter1" runat="server" />
    </form>
</body>
</html>
