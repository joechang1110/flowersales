<%@ Page language="c#" Inherits="SCard.index" ResponseEncoding="utf-8" CodeFile="index.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="pageHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="pageFooter" Src="pageFooter.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>花语花店鲜花销售网站</title>     
        <LINK href="style/style.css" type="text/css" rel="stylesheet">
    </HEAD>
    <body>
        <uc1:pageheader id="PageHeader1" runat="server"></uc1:pageheader>
        <form id="SelectForm" method="post" runat="server">
            <table width="760" class="LMubg" cellpadding=0 cellspacing=0>
                <tr><td colspan=3 height=0 bgcolor=#e9e9e9></td></tr>
                <tr>
                    <td width=2></td>
                    <td width="208">
                        <!-- 导航条 首页-->
                        <table><tr><td><IMG src="images/index_dc_20L.gif"></td></tr></table>
                    </td>
                    <td>
             
                <!-- 搜索条开始{ -->
                <table width="100%">
                    <tr>
                        <td width=60 align=center><IMG src="images/leibie.gif"></td>
                        <td width=45 align=center>按分类</td>
                        <td width=60 align=center><asp:dropdownlist id="ddlClass" runat="server"></asp:dropdownlist></td>
                        <td width=45 align=center>关键字</td>
                        <td width=100 align=center><asp:textbox id="txtSelect" runat="server"></asp:textbox></td>
                        <td width=40 align=right><asp:button id="btnSelect" style="WIDTH: 60px; COLOR:#ff0000" runat="server" Text="查&nbsp;&nbsp;询" onclick="btnSelect_Click"></asp:button></td>
                        <td align=right><IMG src="images/index_dc_20.gif"></td>
                    </tr>
                </table> 
                <!-- }搜索条结束 --> 
                
                    </td>
                </tr>
                <tr><td colspan=3 height=0 bgcolor=#e2e2e2></td></tr>
            </table>
        </form>
        <table width="760" class="ZWenbg" cellpadding=2 cellspacing=2>
            <tr vAlign="top">
                <td width="185">
                <!-- 左边开始 -->
                    <!-- 分类列表开始 -->
                    <table width="179" cellSpacing="0" cellPadding="0">
                        <tr>
                            <td width="179" colspan=3 background="images/fenlei.gif" height="24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>鲜花分类</b></td>
                        </tr>
                        <tr>
                            <td class="LFramebg"></td>
                            <td align="center" height=100 class="LMubg" valign=top>
                                <asp:repeater id="CRepeater" runat="server">
                                    <HeaderTemplate>
                                        <table width="177">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td width="12" align=center valign=top><img border="0" src="images/bullet.gif" width="10" height="10"></td>
                                            <td>
                                                <A href='productsList.aspx?cid=<%#DataBinder.Eval(Container.DataItem,"CID")%>'>
                                                    <%#DataBinder.Eval(Container.DataItem,"CName")%>
                                                </A>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate> 
                                </asp:repeater>        
                            </td>
                            <td class="RFramebg"></td>
                        </tr>
                        <tr>
                            <td colspan=3 class="XFramebg"></td>
                        </tr>
                    </table>
                    <!-- }分类列表结束  -->
                    <table height=10><tr><td></td></tr></table>
                    <!-- 推荐列表开始{  -->   
                    <table cellSpacing="0" cellPadding="0">
                        <tr>
                            <td width="179" colspan=3 height="24" background="images/fenlei.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>精品推荐</b></td>
                        </tr>
                        <tr>
                            <td class="LFramebg"></td>
                            <td align="center" height=200 valign=top>
                                <asp:repeater id="JRepeater" runat="server">
                                    <HeaderTemplate>
                                        <table width="177">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td width="12" align=center valign=top><img border="0" src="images/p_01.jpg" width="12" height="12"></td>
                                            <td>
                                                <A href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                                    <%#DataBinder.Eval(Container.DataItem,"PName")%>
                                                </A>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate> 
                                </asp:repeater> 
                             </td>
                             <td class="RFramebg"></td>
                        </tr>
                        <tr>
                            <td colspan=3 class="XFramebg"></td>
                        </tr>
                    </table>
                    <!-- }推荐列表结束  --> 
                    <table height=10><tr><td></td></tr></table>
                     
                     
                    <table cellSpacing="0" cellPadding="0">
                        <tr>
                            <td width="179" colspan=3 height="24" background="images/fenlei.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>客户服务</b></td>
                        </tr>
                        <tr>
                            <td class="LFramebg"></td>
                            <td align="center" height=150 valign=top>  
                                <table cellspacing=5 width="177">
                                    <tr>
                                        <td><img src="images/myInfo/tel.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align=center><img src="images/myInfo/line.gif"></td>
                                    </tr>
                                    <tr>
										<td align=center><font color="#754f75"><strong>123456789</strong></font></td>
                                    </tr>
                                    <tr>
                                        <td><img src="images/myInfo/QQ.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align=center style="height: 3px"><img src="images/myInfo/line.gif"></td>
                                    </tr>
                                    <tr>
                                        <td>
											<font color="#754f75"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                                                123456789</STRONG></font></td>
                                    </tr>
                                    <tr>
                                        <td><img src="images/myInfo/mail.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align=center><img src="images/myInfo/line.gif"></td>
                                    </tr>
                                    <tr>
                                        <td align=center><font color="#754f75"><strong>123456789@163.com</strong></font></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="RFramebg"></td>
                        </tr>
                        <tr>
                            <td colspan=3><IMG src="images/fenleiD.gif" width="179"></td>
                        </tr>
                    </table>
                   
                   
                    <table height=10><tr><td></td></tr></table>
                    
        <!-- 左边结束 -->
        </TD>
        <td width=100% align=right>
        <!-- 右边开始{ -->
	            <table cellSpacing="0" cellPadding="0" width="98%">
                <tr>
                    <td height="22" width="135" background="images/T2.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12px;COLOR: #ffffff"><b>[ 热卖花束 ]</b></span></td>
                    <td background="images/Z2.gif">
                        <table width="98%" cellSpacing="0" cellPadding="0">
                            <tr>
                                <td align="left" style="height: 16px" ><!-- 公告栏 -->
                                    &nbsp;<marquee id="info" onMouseOver="info.stop()" onMouseOut="info.start()" scrollDelay="180" direction="left" width="98%"><asp:label ForeColor=#ff0000 id="lblAnnounce" Runat="server"></asp:label></marquee>
                                </td>
                            </tr>
                        </table>  
                    </td>
                    <td width="2" background="images/W2.gif"></td>
                </tr>
            </table>
            <!-- 热卖鲜花列表开始{  -->
            <table width="98%" cellpadding="0" cellspacing="0" height=300>
                <tr>
                    <td class="LFramebg"></td>
                    <td valign="top" class="LMubg">  
                        <asp:datalist id="HDataList" Width="100%" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"
                            ShowHeader="False" ShowFooter="False" CellPadding="10" CellSpacing="3"  >
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="100" align="center">
                                            <a href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'><img border=0 width=81 height=110 alt='<%#DataBinder.Eval(Container.DataItem,"PName")%>' src='showPP.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                            </a>
                                        </td>
                                        <td width="140" align="left">
                                            <table>
                                                <tr>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"PName")%></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">&nbsp;&nbsp;原价:
                                                        <del>
                                                            ￥<%#String.Format("{0:f}",DataBinder.Eval(Container.DataItem,"PFPrice"))%></del></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">&nbsp;&nbsp;现价: <font color="#CC0033">￥<%#String.Format("{0:f}",DataBinder.Eval(Container.DataItem,"PNPrice"))%></font></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>[ <A href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>查看详情</A>
                                            ]</td>
                                        <td align="left">&nbsp;&nbsp;<img src="images/emoney.gif"> [<A target=_blank href='makeOrder.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>购买</A>]
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:datalist>
                    </td>
                    <td class="RFramebg"></td>
                </tr>
                <tr><td colspan=3 class="XFramebg"></td></tr>
            </table>
            <!-- }热卖列表鲜花结束  -->
            <table height=10><tr><td></td></tr></table>
            <table><tr><td align=center><a href="productDisplay.aspx?id=9" target=_blank></a></td></tr></table>
            <table height=10><tr><td></td></tr></table>
            <!-- 最新上架列表开始{  -->
            <table width="98%" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="22" width="135" background="images/T3.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12px;COLOR: #ffffff"><B>[ 最新上架 ]</B></span></td>
                    <td background="images/Z3.gif">&nbsp;</td>
                    <td width="2" background="images/W3.gif"></td>
                </tr>
            </table>
            <table width="98%" cellpadding=0 cellspacing=0 height=200>
                <tr>
                    <td class="LFramebg"></td>
                    <td valign="top" class="LMubg">
                        <asp:DataList id="NDataList" Width="100%" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"
                            ShowHeader="False" ShowFooter="False" CellPadding="10" CellSpacing="3">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="100" align="center">
                                            <a href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'><img border=0 width=81 height=110 alt='<%#DataBinder.Eval(Container.DataItem,"PName")%>' src='showPP.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                            </a>
                                        </td>
                                        <td width="140" align="left">
                                            <table>
                                                <tr>
                                                    <td><%#DataBinder.Eval(Container.DataItem,"PName")%></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">&nbsp;&nbsp;原价:
                                                        <del>
                                                            ￥<%#String.Format("{0:f}",DataBinder.Eval(Container.DataItem,"PFPrice"))%></del></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">&nbsp;&nbsp;现价: <font color="#CC0033">￥<%#String.Format("{0:f}",DataBinder.Eval(Container.DataItem,"PNPrice"))%></font></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>[ <A href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>查看详情</A>
                                            ]</td>
                                        <td align="left">&nbsp;&nbsp;<img src="images/emoney.gif"> [<A target=_blank href='makeOrder.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>购买</A>]
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList> 
                    </td>
                    <td class="RFramebg"></td>
                </tr>
                <tr><td colspan=3 class="XFramebg"></td></tr>
            </table>
            <!-- }最新上架列表结束  -->
        <!-- }右边结束 -->
        </td></TR></TABLE>
        <uc1:pageFooter id="PageFooter1" runat="server" OnLoad="PageFooter1_Load"></uc1:pageFooter>
    </body>
</HTML>
