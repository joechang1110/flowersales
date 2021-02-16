<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="SCard.Reg" %>

<%@ Register Src="pageFooter.ascx" TagName="pageFooter" TagPrefix="uc1" %>
<%@ Register Src="pageHeader.ascx" TagName="pageHeader" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
          <td bgcolor="#F0F5F9" style="height: 18px; font-weight: bold; font-size: small;">&nbsp;用户注册信息表 &nbsp;          </td>
        </tr>
  
        <tr>
          <td bgcolor="#F0F5F9">
              &nbsp;性别</td>
          <td bgcolor="#F0F5F9">&nbsp;
          <asp:DropDownList ID="dplSex" runat="server">          </asp:DropDownList></td>
        </tr>
        <tr>
          <td bgcolor="#F0F5F9">&nbsp;用户ID(用于登录)</td>
          <td bgcolor="#F0F5F9">&nbsp;
          <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
        </tr>
          <tr>
              <td bgcolor="#f0f5f9">
                  真实名称</td>
              <td bgcolor="#f0f5f9">
                  &nbsp;
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
          </tr>
        <tr>
          <td bgcolor="#F0F5F9">&nbsp;密码</td>
          <td bgcolor="#F0F5F9">&nbsp;
          <asp:TextBox ID="txtPsw" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
          <td bgcolor="#F0F5F9">&nbsp;确认密码</td>
          <td bgcolor="#F0F5F9">&nbsp;
          <asp:TextBox ID="txtPsw1" runat="server" TextMode="Password"></asp:TextBox></td>
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
          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" Height="25px" Width="56px" /><br />          </td>
        </tr>
      </table>
    </div>
        &nbsp;
        <uc1:pageFooter ID="PageFooter1" runat="server" />
    </form>
</body>
</html>
