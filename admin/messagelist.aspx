<%@ Page language="c#" Inherits="SCard.admin.messageList" CodeFile="messageList.aspx.cs" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>messageList</title>
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
                    <td width='140' class='category'><asp:Label ID="lblState" Runat="server"></asp:Label></td>
                    <td class='category'><asp:Label Font-Bold="True" ForeColor="#ff9900" ID="lblNum" Runat="server">0</asp:Label>
                        条</td>
                </tr>
            </table>
            <br>
            <asp:DataGrid id="messageDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" cellpadding='4'
                cellspacing='1' CssClass='grid fixed'>
                <HeaderStyle HorizontalAlign="Center" CssClass="category"></HeaderStyle>
                <Columns>
                    <asp:BoundColumn DataField="MID" HeaderText="编号">
                        <HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="UEmail" HeaderText="E-mail">
                        <HeaderStyle ForeColor="#0F83EC" Width="150px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="MTitle" HeaderText="标题">
                        <HeaderStyle ForeColor="#0F83EC"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Pubdate" HeaderText="时间">
                        <HeaderStyle ForeColor="#0F83EC" Width="140px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:TemplateColumn>
                        <HeaderStyle Width="80px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <a target=_blank href='messageDetail.aspx?id=<%#DataBinder.Eval(Container.DataItem,"MID")%>'>
                                详细信息</a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:ButtonColumn Text="删除" CommandName="Delete">
                        <HeaderStyle Width="40px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonColumn>
                </Columns>
            </asp:DataGrid>
            <cc1:SqlPager id="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev" CacheDuration="0"></cc1:SqlPager>
        </form>
    </body>
</HTML>
