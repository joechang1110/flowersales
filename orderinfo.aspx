<%@ Register TagPrefix="uc1" TagName="pageFooter" Src="pageFooter.ascx" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="pageHeader.ascx" %>
<%@ Page language="c#" Inherits="SCard.orderinfo" ResponseEncoding="utf-8" CodeFile="orderinfo.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>确认订单信息 -- 花语花店鲜花销售网站</title>


        <LINK href="style/style.css" type="text/css" rel="stylesheet">
    </HEAD>
    <body>
        <uc1:pageheader id="PageHeader1" runat="server"></uc1:pageheader>
        <table width="760" class="ZWenbg2" cellpadding="2" cellspacing="2">
            <tr>
                <td align="center">
                    <!-- 正文开始{ -->
                    <br>
                        <img width=750 src=images/liucheng02.jpg>
        <br><br>
        <table width="750" cellpadding=0 cellspacing=0>
            <tr>
                <td colspan="2"><img src="images/querendingdan.gif"></td>
            </tr>
            <tr><td height=1 bgcolor=#f7941d></td></tr>
        </table>
        <br>
        <table width=450 cellpadding=0 cellspacing=1 bgcolor=#d5d5d5>
            <tr>
                <td height=25 background=images/bgtiao05.gif>&nbsp;&nbsp;<b>订单编号：</b>
                </td>
            </tr>
            <tr>
                <td height=25 bgcolor=#f6f6f6>&nbsp;&nbsp;&nbsp;&nbsp;
                    <FONT color="#ff0000"><b><asp:label id="lblOrderID" runat="server"></asp:label></b>&nbsp;&nbsp; [**请仔细记录订单号，以备今后查询使用!!]</FONT>
                </td>
            </tr>
            <tr>
                <td background=images/bgtiao05.gif style="height: 25px">&nbsp;&nbsp;<b>所购鲜花信息 &nbsp;
                    &nbsp;
                    <asp:Label ID="lblDetailP" runat="server" ForeColor="Red"></asp:Label></b></td>
            </tr>
            <tr>
                <td>
                    <table width=100% cellpadding=2 cellspacing=2 bgcolor=#f6f6f6>
                        <tr><td></td></tr>
                        <tr>
                            <td align=right width=150>名　　称：</td>
                            <td width=20></td>
                            <td><asp:label id="lblPName" runat="server"></asp:label></td>
                        </tr>
                        <tr>
                            <td align=right>单　　价：</td>
                            <td width=20></td>
                            <td><asp:label id="lblPPrice" runat="server"></asp:label> 元</td>
                        </tr>
                        <tr>
                            <td align=right>数　　量：</td>
                            <td width=20></td>
                            <td><asp:label id="lblPNum" runat="server"></asp:label></td>
                        </tr>
                        <tr>
                            <td align=right>总　　价：</td>
                            <td width=20></td>
                            <td><asp:label Font-Bold=True id="lblTotalPrice" runat="server"></asp:label> 元</td>
                        </tr>
                        <tr><td></td></tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height=25 background=images/bgtiao05.gif>&nbsp;&nbsp;<b>您的信息</b></td>
            </tr>
            <tr>
                <td>
                    <table width=100% cellpadding=2 cellspacing=2 bgcolor=#f6f6f6>
                        <tr><td></td></tr>
                        <tr>
                            <td align=right width=150 style="height: 20px">
                                用户ID：</td>
                            <td width=20 style="height: 20px"></td>
                            <td style="height: 20px"><asp:label ForeColor=#000080 id="lblTName" runat="server"></asp:label></td>
                        </tr>
                        <tr>
                            <td align="right">
                                真实姓名：</td>
                            <td width="20">
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" ForeColor="#000080"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align=right>电子邮件：</td>
                            <td width=20></td>
                            <td><asp:label ForeColor=#000080 id="lblEmail" runat="server"></asp:label></td>
                        </tr>
                        <tr>
                            <td align=right>联系电话：</td>
                            <td width=20></td>
                            <td><asp:label id="lblPhone" runat="server"></asp:label></td>
                        </tr>
                        <tr><td></td></tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        <table width=750>
            <tr><td height=1 bgcolor=#e2e2e2></td></tr>
            <tr>
                <td height=30 align=center>
                    <form id="Form1" >
                        &nbsp; &nbsp; &nbsp;&nbsp;
                        
                        <asp:Label ID="lblBack" Runat="server" Width="77px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </form>
                </td>
            </tr>
        </table>
                    <br>
                    <br>
                    <!-- }正文结束 -->
                </td>
            </tr>
        </table>
        <uc1:pageFooter id="PageFooter1" runat="server"></uc1:pageFooter>
    </body>
</HTML>
