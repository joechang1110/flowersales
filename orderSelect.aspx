<%@ Page language="c#" Inherits="SCard.orderSelect" CodeFile="orderSelect.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="pageFooter" Src="pageFooter.ascx" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="pageHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>订单查询 -- 花语花店鲜花销售网站</title>


        <LINK href="style/style.css" type="text/css" rel="stylesheet">
    </HEAD>
    <body>
        <uc1:pageheader id="PageHeader1" runat="server"></uc1:pageheader>
        <table class="ZWenbg" cellSpacing="2" cellPadding="2" width="760">
            <tr>
                <td align="center" valign=top height=400>
                    <!-- 正文开始{ -->
                    <table height=100 width=500>
                        <tr><td height=30></td></tr>
                        <tr>
                            <td align=center valign=top><FONT style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #ff6600">订单查询</FONT></td>
                        </tr>
                    </table>
                    <form id="Form1" method="post" runat="server">
                        <table id="tableSelect" width="500" runat="server" bgcolor=#e3e3ef cellpadding=0 cellspacing=0>
                            <tr><td colspan=3 bgcolor=#6699dc></td></tr>
                            <tr><td colspan=3 bgcolor=#ffffff></td></tr>
                            <tr><td height=5></td></tr>
                            <tr>
                                <td colspan=2 align=center><FONT color="#0000ff">请输入该订单的相应资料：</FONT></td>
                                <td></td>
                            </tr>
                            <tr><td height=5></td></tr>
                            <tr><td colspan=3 bgcolor=#d2d2d2></td></tr>
                            <tr><td colspan=3 bgcolor=#f2f2f2></td></tr>
                            <tr><td height=15></td></tr>
                            <tr>
                                <td width=130 align="right">订单编号：</td>
                                <td width=180><asp:textbox id="txtOrderid" runat="server" Width="150px"></asp:textbox><FONT color="#cc0033">*</FONT></td>
                                <td></td>
                            </tr>
                            <tr><td height=5></td></tr>
                            <tr>
                                <td align="right" style="height: 22px">用户名：</td>
                                <td style="height: 22px"><asp:textbox id="txtName" Width="150px" Runat="server" MaxLength="20"></asp:textbox><FONT color="#cc0033">*</FONT></td>
                                <td style="height: 22px"></td>
                            </tr>
                            <tr><td height=5></td></tr>
                            <tr>
                                <td align="right">电子邮件：</td>
                                <td><asp:textbox id="txtEmail" Width="150px" Runat="server" MaxLength="20"></asp:textbox><FONT color="#cc0033">*</FONT></td>
                                <td><asp:imagebutton Width=75 Height=21 id="ibtnSelect" runat="server" ImageUrl="images/orderSelect.gif" ></asp:imagebutton></td>
                            </tr>
                            <tr><td height=15></td></tr>
                            <tr><td colspan=3 bgcolor=#d2d2d2></td></tr>
                        </table>
                        
                        <table id="tableInfo" cellSpacing="1" cellPadding="4" width="500" align="center" bgColor="#006699"
                            runat="server">
                            <tr bgColor=#33a0ff>
                                <td width="140"><font color="#ffcc00">订单编号：</font></td>
                                <td><asp:label id="lblOrderID" runat="server" ForeColor="#ffcc00" Font-Bold="True"></asp:label>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="lblDetailP" runat="server" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="category" colSpan="2"><font color="#ffffff">买家的信息</font></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">姓 名：</td>
                                <td><asp:label id="lblTName" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">电子邮件：</td>
                                <td><asp:label id="lblEmail" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">联系电话：</td>
                                <td><asp:label id="lblPhone" runat="server"></asp:label></td>
                            </tr>
                            <tr>
                                <td colSpan="2"><font color="#ffffff">所购鲜花信息</font></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">编 号：</td>
                                <td><asp:label id="lblPID" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">名 称：</td>
                                <td><asp:label id="lblPName" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">单 价：</td>
                                <td><asp:label id="lblPPrice" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">数 量：</td>
                                <td><asp:label id="lblPNum" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">总 价：</td>
                                <td><asp:label id="lblTotalPrice" runat="server"></asp:label></td>
                            </tr>
                            <tr>
                                <td colSpan="2"><font color="#ffffff">其他信息</font></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">创建时间：</td>
                                <td><asp:label id="lblPubdate" runat="server"></asp:label></td>
                            </tr>
                            <tr bgColor="#ffffff">
                                <td align="right">状 态：</td>
                                <td><asp:label id="lblOState" runat="server"></asp:label></td>
                            </tr>
                        </table>
                        <br><br><br>
                    </form>
                    <!-- }正文结束 --></td>
            </tr>
        </table>
        <uc1:pagefooter id="PageFooter1" runat="server"></uc1:pagefooter>
    </body>
</HTML>
