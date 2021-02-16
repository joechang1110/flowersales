<%@ Page Language="c#" Inherits="SCard.productsList" ResponseEncoding="utf-8" CodeFile="productsList.aspx.cs" %>

<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="pageHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="pageFooter" Src="pageFooter.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>鲜花列表 --花语花店鲜花销售网站</title>
    <link href="style/style.css" type="text/css" rel="stylesheet">
</head>
<body>
    <uc1:pageHeader ID="PageHeader1" runat="server"></uc1:pageHeader>
    <form id="Form1" method="post" runat="server">
        <table width="760" class="LMubg" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" height="0" bgcolor="#e9e9e9">
                </td>
            </tr>
            <tr>
                <td width="10">
                </td>
                <td width="200">
                    <!-- 絳瑤沭 -->
                    <a href="index.aspx">首页</a> &gt;
                    <asp:Label ID="lblDaohang" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <!-- 刲坰沭羲宎{ -->
                    <table width="100%">
                        <tr>
                            <td width="60" align="center">
                                <img src="images/leibie.gif"></td>
                            <td width="45" align="center">
                                按分类</td>
                            <td width="60" align="center">
                                <asp:DropDownList ID="ddlClass" runat="server">
                                </asp:DropDownList></td>
                            <td width="45" align="center">
                                关键字</td>
                            <td width="100" align="center">
                                <asp:TextBox ID="txtSelect" runat="server"></asp:TextBox></td>
                            <td width="40" align="right">
                                <asp:Button ID="btnSelect" Style="color: #ff0000" runat="server" Text="查&nbsp;&nbsp;詢"
                                    Width="60" OnClick="btnSelect_Click"></asp:Button></td>
                            <td align="right">
                                <img src="images/index_dc_20.gif"></td>
                        </tr>
                    </table>
                    <!-- }刲坰沭賦旰 -->
                </td>
            </tr>
            <tr>
                <td colspan="3" height="0" bgcolor="#e9e9e9">
                </td>
            </tr>
        </table>
        <table width="760" class="ZWenbg" cellpadding="2" cellspacing="2">
            <tr valign="top">
                <td width="185">
                    <!-- 淏恅酘晚羲宎{ -->
                    <!-- 煦濬蹈桶羲宎{  -->
                    <table width="179" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td width="179" colspan="3" background="images/fenlei.gif" height="24">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>鲜花分类</b></td>
                            </tr>
                            <tr>
                                <td class="LFramebg">
                                </td>
                                <td align="center" height="100" class="LMubg" valign="top">
                                    <asp:Repeater ID="CRepeater" runat="server">
                                        <HeaderTemplate>
                                            <table width="177">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td width="12" align="center" valign="top">
                                                    <img border="0" src="images/bullet.gif" width="10" height="10"></td>
                                                <td>
                                                    <a href='productsList.aspx?cid=<%#DataBinder.Eval(Container.DataItem,"CID")%>'>
                                                        <%#DataBinder.Eval(Container.DataItem,"CName")%>
                                                    </a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                                <td class="RFramebg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="XFramebg">
                                </td>
                            </tr>
                    </table>
                    <!-- }煦濬蹈桶賦旰  -->
                    <table height="10">
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <!-- 煦濬勤茼腔种珅豪蹈桶羲宎{  -->
                    <table cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td width="179" colspan="3" background="images/fenlei.gif" height="24">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>热销排行榜</b></td>
                            </tr>
                            <tr>
                                <td class="LFramebg">
                                </td>
                                <td align="center" height="200" valign="top">
                                    <asp:Repeater ID="HotRepeater" runat="server">
                                        <HeaderTemplate>
                                            <table width="177">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td width="12" align="center" valign="top">
                                                    <img border="0" src="images/p_01.jpg" width="10" height="10"></td>
                                                <td>
                                                    <a href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                                        <%#DataBinder.Eval(Container.DataItem,"PName")%>
                                                    </a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                                <td class="RFramebg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="XFramebg">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- }煦濬勤茼腔种珅豪蹈桶賦旰  -->
                    <table height="10">
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <!-- 諦誧督昢羲宎{  -->
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="179" colspan="3" height="24" background="images/fenlei.gif">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>客户服务</b></td>
                        </tr>
                        <tr>
                            <td class="LFramebg">
                            </td>
                            <td align="center" height="150" valign="top">
                                <table cellspacing="5" width="177">
                                    <tr>
                                        <td>
                                            <img src="images/myInfo/tel.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <img src="images/myInfo/line.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font color="#754f75"><strong>123456789</strong></font></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="images/myInfo/QQ.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <img src="images/myInfo/line.gif"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <font color="#754f75"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 123456789</strong></font></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="images/myInfo/mail.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <img src="images/myInfo/line.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <font color="#754f75"><strong>123456789@163.com</strong></font></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="RFramebg">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <img src="images/fenleiD.gif" width="179"></td>
                        </tr>
                    </table>
                    <!-- }諦誧督昢賦旰  -->
                    <!-- }淏恅酘晚賦旰 -->
                </td>
                <td width="100%" align="right">
                    <!-- 淏恅衵晚羲宎{ -->
                    <!-- 珅豪蹈桶羲宎{  -->
                    <table width="98%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="22" width="135" background="images/xiangxiT.gif">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #ffffff"><b>[ 鲜花列表]</b></span></td>
                            <td background="images/xiangxiZ.gif">
                                &nbsp;</td>
                            <td width="2" background="images/xiangxiW.gif">
                            </td>
                        </tr>
                    </table>
                    <table width="98%" cellpadding="0" cellspacing="0">
                        <tr height="600" valign="top">
                            <td class="LFramebg">
                            </td>
                            <td valign="top" class="LMubg">
                                <asp:DataList ID="PDataList" Width="100%" runat="server" RepeatDirection="Horizontal"
                                    RepeatColumns="3" ShowHeader="False" ShowFooter="False" CellPadding="10" CellSpacing="3">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="100" align="center">
                                                    <a href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                                        <img border="0" width=81 height=110  alt='<%#DataBinder.Eval(Container.DataItem,"PName")%>'
                                                            src='showPP.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                                    </a>
                                                </td>
                                                <td width="140" align="left">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <%#DataBinder.Eval(Container.DataItem,"PName")%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;&nbsp;原價: <del>ㄓ<%#String.Format("{0:f}",DataBinder.Eval(Container.DataItem,"PFPrice"))%></del></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                &nbsp;&nbsp;現價: <font color="#CC0033">ㄓ<%#String.Format("{0:f}",DataBinder.Eval(Container.DataItem,"PNPrice"))%></font></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <td>
                                                    [ <a href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>查看详情</a>
                                                    ]</td>
                                                <td align="left">
                                                    &nbsp;&nbsp;<img src="images/emoney.gif">
                                                    [<a target="_blank" href='makeOrder.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>购买</a>]
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td class="RFramebg">
                            </td>
                        </tr>
                        <tr>
                            <td class="LFramebg">
                            </td>
                            <td class="LMubg">
                                <cc1:SqlPager ID="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev"
                                    CacheDuration="0"></cc1:SqlPager>
                            </td>
                            <td class="RFramebg">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="XFramebg">
                            </td>
                        </tr>
                    </table>
                    <!-- }珅豪蹈桶賦旰  -->
                    <!-- }淏恅衵晚賦旰 -->
                </td>
            </tr>
             </table>
    </form>
    <uc1:pageFooter ID="PageFooter1" runat="server"></uc1:pageFooter>
</body>
</html>
