<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Info_Bm.aspx.cs" Inherits="SCard.admin.Info_Bm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>bmInfoView</title>
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
 
    <link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#EAF1F9">
    <form id="Form1" method="post" runat="server">
   
        <table bordercolor="#F0F5F9" width="802" align="center" border="1">
            <tr>
                <td width="792">
                    <font face="宋体">以下是邮递信息的说明</font></td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DataGrid ID="DataGrid1" runat="server" BorderStyle="None" Width="662px" BorderColor="#E0E0E0"
                        BorderWidth="1px" BackColor="White" CellPadding="4" AutoGenerateColumns="False" AllowPaging="True"  >
                        <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                        <SelectedItemStyle Font-Bold="True" ForeColor="#663399" BackColor="#FFCC66"></SelectedItemStyle>
                        <ItemStyle ForeColor="#330099" BackColor="White"></ItemStyle>
                        <HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></HeaderStyle>
                        <Columns>
                            <asp:HyperLinkColumn
                                DataTextField="名称" HeaderText="邮递方式"></asp:HyperLinkColumn>
                                         <asp:HyperLinkColumn
                                DataTextField="备注" HeaderText="邮递说明"></asp:HyperLinkColumn>
                            <asp:HyperLinkColumn DataNavigateUrlField="id" DataNavigateUrlFormatString="?EditID={0}"
                                HeaderText="编辑" Text="编辑"></asp:HyperLinkColumn>
                                
                            <asp:HyperLinkColumn Text="删除" DataNavigateUrlField="id" DataNavigateUrlFormatString="?Id={0}"
                                HeaderText="删除"></asp:HyperLinkColumn>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC" Mode="NumericPages"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td>
                    <font face="宋体">共有
                        <asp:Label ID="lbl_count" runat="server" ForeColor="Red"></asp:Label>条记录</font></td>
            </tr>
            <tr bgcolor="#F0F5F9">
                <td align="center" bgcolor="#F0F5F9">               添加信息
                  <table  border="0" align="center" bordercolor="#F0F5F9" style="width: 534px">
                        <tr>
                          <td colspan="2" nowrap style="height: 18px" ></td>
                        </tr>
                        <tr>
                            <td nowrap style="width: 80px; height: 28px;">
                                <font face="宋体">邮递名称：</font></td>
                            <td width="47%" align="left" nowrap style="height: 28px; width: 467px;">
                          <asp:TextBox ID="txtTitle" runat="server" Width="327px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td nowrap style="width: 80px; height: 22px;">
                                邮递说明：</td>
                            <td align="left" nowrap style="width: 467px; height: 22px;">
                          <asp:TextBox ID="txtRate" runat="server" Width="327px"></asp:TextBox></td>
                        </tr>
                  </table>
                  <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="增加" /><br />
                    <asp:Button ID="EditButton" runat="server" OnClick="EditButton_Click" Text="编辑" Visible="False" /></td>
            </tr>
      </table>
    </form>
</body>
</html>
