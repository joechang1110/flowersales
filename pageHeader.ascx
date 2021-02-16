<%@ Control Language="c#" Inherits="SCard.pageHeader" CodeFile="pageHeader.ascx.cs" %>
<!-- 珜芛羲宎 -->

<table width=830 height=22 background=images/sh.gif>
    <tr>
        <td style="text-align: center; font-size: 120%; color: gold; font-family: Arial;" >
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            <em><span style="font-family: @細明體"><strong style="font-size: large; color: blue; font-family:@細明體"><span style="color: #6600ff; font-family: @細明體">&nbsp;&nbsp; 花语花店鲜花销售网站</span></strong> 
            </span></em>&nbsp;<asp:Label  id="lblDateTime" runat="server" style="font-size: small; font-family: Monospace" Font-Names="@黑體"></asp:Label><br />
            <br />
        </td>
    </tr>
</table>

<table height="17" cellpadding=0 cellspacing=0 background=images/indexbg.gif style="width: 757px">
    <tr align=center height=27>
        <td height="13" background=images/index_1.gif style="width: 5px"></td>
        <td style="width: 26px"></td>
        <td width="62"><a href=index.aspx>首 页</a></td>
        <td width=10><img src=images/line.gif></td>
        <td style="width: 80px" ><a href=productsList.aspx>鲜花列表</a></td>
        <td width=10><img src=images/line.gif></td>
        <%=strLg %>
          <td style="width: 83px"><a href=orderSelect.aspx>订单查询</a></td>
        <td width=10><img src=images/line.gif></td>
          <td style="width: 92px"><a href=message.aspx>用户留言</a></td>
        <td style="width: 16px"><img src=images/line.gif></td>       
       
        <td background=images/index_2.gif style="width: 5px"></td>
    </tr>
</table>
<table width=760 class="ZWenbg" ><tr><td></td></tr></table>
<!-- 珜芛賦旰 -->
