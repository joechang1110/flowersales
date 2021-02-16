<%@ Page language="c#" Inherits="SCard.admin.productAlter" ResponseEncoding="utf-8" CodeFile="productAlter.aspx.cs" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>productAlter</title>
        <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
        <meta name="CODE_LANGUAGE" Content="C#">
        <meta name="vs_defaultClientScript" content="JavaScript">
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <LINK href="style.css" type="text/css" rel="stylesheet">
    </HEAD>
    <body>
        <form id="Form1" method="post" runat="server">
            <div align=left>
                <asp:TextBox id="txtSelect" Width=150 runat="server"></asp:TextBox>
                <asp:DropDownList id="ddlSelect" runat="server">
                    <asp:ListItem Value="0" Selected="True">编号</asp:ListItem>
                    <asp:ListItem Value="1">名称</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList id="ddlClass" runat="server"></asp:DropDownList>&nbsp;&nbsp;
                <asp:Button id="btnSelect" runat="server" Text="查询" onclick="btnSelect_Click"></asp:Button>
            </div><br>
            
            
            <asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%" cellpadding='4'
                cellspacing='1' CssClass='grid fixed'>
                <HeaderStyle HorizontalAlign="Center" CssClass="category"></HeaderStyle>
                <Columns>
                    <asp:BoundColumn DataField="PID" HeaderText="编号">
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PName" HeaderText="名称">
                        <HeaderStyle ForeColor=#0F83EC></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="CName" HeaderText="类别">
                        <HeaderStyle ForeColor=#0F83EC></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PStock" HeaderText="库存">
                        <HeaderStyle ForeColor=#0F83EC Width=50px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PSellNum" HeaderText="销售数量">
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:TemplateColumn>
                        <HeaderStyle Width=80px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <a target=_blank href='productDetail.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>详细信息</a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                        <HeaderStyle Width=40px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <a  href='productImport.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                入货</a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn>
                        <HeaderStyle Width=80px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <a target=_blank href='productData.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
                                仓库管理</a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:ButtonColumn Text="删除" CommandName="Delete">
                        <HeaderStyle Width=40px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonColumn>
                </Columns>
            </asp:DataGrid>
            <cc1:SqlPager id="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev" CacheDuration="0"></cc1:SqlPager>
        </form>
    </body>
</HTML>
