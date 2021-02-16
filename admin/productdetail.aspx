<%@ Page language="c#" Inherits="SCard.admin.productDetail" ResponseEncoding="utf-8" CodeFile="productDetail.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>鲜花详细信息</title>
        <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
        <meta content="C#" name="CODE_LANGUAGE">
        <meta content="JavaScript" name="vs_defaultClientScript">
        <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
        <LINK href="style.css" type="text/css" rel="stylesheet">
    </HEAD>
    <body>
        <form id="Form1" method="post" runat="server">
            <table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid fixed'>
                <tr>
                    <td width='140' class='category'>
                        鲜花详细信息</td>
                    <td class='category'>带<font class='t2'>*</font>为必填</td>
                </tr>
                <tr>
                    <td>
                        鲜花名称</td>
                    <td><asp:textbox id="txtName" Width="150" runat="server"></asp:textbox>
                        <font class='t2'>*</font></td>
                </tr>
                <tr>
                    <td>所属类别</td>
                    <td><asp:dropdownlist id="ddlCategory" Width="150" runat="server"></asp:dropdownlist>
                        <font class='t2'>*</font></td>
                </tr>
               
                <tr>
                    <td>成本价</td>
                    <td><asp:textbox id="txtCPrice" Width="150" runat="server"></asp:textbox>
                        <font class='t2'>*</font></td>
                </tr>
                <tr>
                    <td>原价</td>
                    <td><asp:textbox id="txtFPrice" Width="150" runat="server"></asp:textbox>
                        <font class='t2'>*</font></td>
                </tr>
                <tr>
                    <td>现价</td>
                    <td><asp:textbox id="txtNPrice" Width="150" runat="server"></asp:textbox>
                        <font class='t2'>*</font></td>
                </tr>
                <tr>
                    <td vAlign="top">
                        图片<br>
                        <font class='t1'>(图片格式必须为.gif或.jpg,大小建议:200*128)</font>
                    </td>
                    <td><INPUT id="uploadFile" onpropertychange="document.all.myimg.src='file:///'+this.value"
                            size="40" type="file" runat="server" NAME="uploadFile"><br>
                        <IMG id="myimg" src="..\images\showimg.gif" border="0" runat="server">
                    </td>
                </tr>
                <tr>
                    <td vAlign="top">
                        买家必读</td>
                    <td><asp:textbox id="txtBewrite" runat="server" Width="400" TextMode="MultiLine" Rows="10" Columns="30"></asp:textbox></td>
                </tr>
                <tr>
                    <td vAlign="top">
                        详情介绍</td>
                    <td><asp:textbox id="txtUseMode" runat="server" Width="400" TextMode="MultiLine" Rows="7" Columns="30"></asp:textbox></td>
                </tr>
                <tr>
                    <td vAlign="top">
                        &nbsp;鲜花简介</td>
                    <td><asp:textbox id="txtValidity" runat="server" Width="400" TextMode="MultiLine" Rows="3" Columns="30"></asp:textbox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAlter" Text="修改" Runat="server" onclick="btnAlter_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
