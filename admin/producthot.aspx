<%@ Page language="c#" Inherits="SCard.admin.productHot" ResponseEncoding="utf-8" CodeFile="productHot.aspx.cs" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>productHot</title>
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
			        <td class='category'>
                        热卖鲜花列表 - <font class='t1'>(可以显示12个)</font></td>
		        </tr>
		    </table>
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
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PSellNum" HeaderText="累积售出">
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:ButtonColumn Text="删除" CommandName="Delete" HeaderText="修改">
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonColumn>
                </Columns>
            </asp:DataGrid>
                       
            <br>
            
            <table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid fixed'>
		        <tr>
			        <td class='category'>
                        可选择鲜花列表</td>
			        <td width=210 class='category' align=right>
			            <asp:DropDownList id="ddlClass" AutoPostBack="True" Width=150 runat="server"></asp:DropDownList>&nbsp;&nbsp;
                        <asp:Button id="btnSelect" runat="server" Text="查询" onclick="btnSelect_Click"></asp:Button>&nbsp;&nbsp;
			        </td>
		        </tr>
		    </table>
            <asp:DataGrid id="PDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" cellpadding='4'
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
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PSellNum" HeaderText="累积售出">
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:ButtonColumn Text="添加" CommandName="Delete" HeaderText="修改">
                        <HeaderStyle ForeColor=#0F83EC Width=70px></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonColumn>
                </Columns>
            </asp:DataGrid>
            <cc1:SqlPager id="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev" CacheDuration="0"></cc1:SqlPager>
        </form>
        
        <br><br><br><br>
    </body>
</HTML>
