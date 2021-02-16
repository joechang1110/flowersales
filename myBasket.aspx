<%@ Page language="c#" Inherits="SCard.myFav" ResponseEncoding="utf-8" CodeFile="myBasket.aspx.cs" %>

<%@ Register Src="pageFooter.ascx" TagName="pageFooter" TagPrefix="uc1" %>
<%@ Register Src="pageHeader.ascx" TagName="pageHeader" TagPrefix="uc2" %>
<%@ Register TagPrefix="cc1" Namespace="DevCenter" Assembly="WebPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>我的购物车</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="style/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body style="text-align: center">
		<form id="Form1" method="post" runat="server">
	            <table cellpadding="2" cellspacing="2" class="ZWenbg2" width="760">
                <tr>
                    <td align="center" style="width: 756px">
                        <!-- 淏恅羲宎{ -->
                <uc2:pageHeader ID="PageHeader1" runat="server" />
                            <img src="images/liucheng01.jpg" width="750" />
                            <br />
                            <table width="750">
                                <tr>
                                    <td background="images/chengse01.gif" height="31">
                                        &nbsp; &nbsp;&nbsp; <font style="font-size: 14px"><b>所购鲜花</b></font></td>
                                </tr>
                            </table>
                            <table cellpadding="5" cellspacing="5" width="750">
                                <tr>
                                    <td align="right" colspan="3" style="text-align: center">
			<asp:DataGrid id="FavDataGrid" runat="server" AutoGenerateColumns="False" Width="92%" cellpadding='4'
				cellspacing='1' CssClass='grid fixed' >
				<HeaderStyle HorizontalAlign="Center" CssClass="category"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="ID" HeaderText="编号">
						<HeaderStyle ForeColor="#0F83EC" Width="50px"></HeaderStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="isDate" HeaderText="加入购物车时间">
						<HeaderStyle ForeColor="#0F83EC" Width="150px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="PName" HeaderText="鲜花名称">
						<HeaderStyle ForeColor="#0F83EC" Width="170px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
					</asp:BoundColumn>
                    <asp:BoundColumn DataField="isN" HeaderText="數量"></asp:BoundColumn>
                    <asp:BoundColumn DataField="isMoney" HeaderText="金額"></asp:BoundColumn>
					<asp:TemplateColumn>
						<HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
						<ItemTemplate>
							<a target=_blank href='productDisplay.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PID")%>'>
								详细信息</a>
						</ItemTemplate>
					</asp:TemplateColumn>
							<asp:TemplateColumn>
						<HeaderStyle ForeColor="#0F83EC" Width="70px"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center"></ItemStyle>
						<ItemTemplate>
							<a  href='?did=<%#DataBinder.Eval(Container.DataItem,"ID")%>'>
								取消购买</a>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
			<cc1:SqlPager id="SqlPager1" runat="server" PagingMode="Cached" PagerStyle="NextPrev" CacheDuration="0" Width="691px"></cc1:SqlPager>
            &nbsp;&nbsp;</td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" width="750">
                                <tr>
                                    <td colspan="2">
                                        <img src="images/tianxiedingdan.gif" /></td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f7941d" height="1">
                                    </td>
                                </tr>
                            </table>
                            <table cellspacing="10" width="750">
                                <tr>
                                    <td colspan="3">
                                        &nbsp; &nbsp; &nbsp;&nbsp;请输入以下信息<font color="#cc0033">带星号为必填项目</font> &nbsp;此次购物总价格
                                        <asp:Label ID="lblTotalPric" runat="server" Font-Bold="True" ForeColor="#ff0033"></asp:Label>元
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="130">
                                        姓名
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" MaxLength="20"></asp:TextBox>
                                        <font color="#cc0033">*</font>
                                    </td>
                                    <td style="width: 355px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 24px">
                                        真實姓名</td>
                                    <td style="height: 24px">
                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="20"></asp:TextBox></td>
                                    <td style="width: 355px; height: 24px">
                                        <span style="color: #808080">请输入真实姓名和电子邮件,以便以后核实资料</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        电子邮件
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="20"></asp:TextBox>
                                        <font color="#cc0033">*</font>
                                    </td>
                                    <td style="width: 355px">
                                        <asp:RegularExpressionValidator ID="REVEmail" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="电子邮件格式错误!!" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height: 24px">
                                        联系电话:
                                    </td>
                                    <td style="height: 24px">
                                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="15" Width="192px"></asp:TextBox>
                                        <span style="color: #cc0033">*</span>
                                    </td>
                                    <td style="width: 355px; height: 24px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                         邮递方式:</td>
                                    <td>
                                        &nbsp;<asp:DropDownList ID="dplBm" runat="server">
                                        </asp:DropDownList></td>
                                    <td style="width: 355px">
                                        <span style="font-size: 10pt"><span style="color: #808080; font-family: 宋体">
                                            <p class="MsoNormal" style="margin: 0cm 0cm 0pt">
                                                <span style="font-size: 10pt"></span><span style="color: gray; font-family: 宋体;
                                                  "></span>平邮:<span lang="EN-US" style="color: gray;
                                                        font-family: Times New Roman">7-15</span><span style="color: gray; font-family: 宋体;
                                                           ">天</span><span
                                                                lang="EN-US" style="color: gray; font-family: Times New Roman">,</span><span style="color: gray;
                                                                    font-family: 宋体; ">邮费</span><span
                                                                        lang="EN-US" style="color: gray; font-family: Times New Roman">7.0</span><span style="color: gray;
                                                                            font-family: 宋体; ">元</span><span
                                                                                style="font-size: 10pt"><span style="color: gray; font-family: 宋体; 
                                                                                   ">快邮:</span><span lang="EN-US" style="color: gray;
                                                                                        font-family: Times New Roman">4</span>-<span
                                                                                                lang="EN-US" style="color: gray; font-family: Times New Roman">10</span><span style="color: gray;
                                                                                                    font-family: 宋体; ">天</span><span
                                                                                                        lang="EN-US" style="color: gray; font-family: Times New Roman">,</span><span style="color: gray;
                                                                                                            font-family: 宋体;">邮费</span><span
                                                                                                                lang="EN-US" style="color: gray; font-family: Times New Roman">10.0</span><span style="color: gray;
                                                                                                                    font-family: 宋体; ">元</span></span></p>
                                            <p class="MsoNormal" style="margin: 0cm 0cm 0pt">
                                                <span style="font-size: 10pt"><span style="color: gray; font-family: 宋体; ">快递:</span><span lang="EN-US" style="color: gray;
                                                        font-family: Times New Roman">2-4</span><span style="color: gray; font-family: 宋体;
                                                           ">天</span><span
                                                                lang="EN-US" style="color: gray; font-family: Times New Roman">,</span><span style="color: gray;
                                                                    font-family: 宋体;">郵費</span><span
                                                                        lang="EN-US" style="color: gray; font-family: Times New Roman">15.0</span><span style="color: gray;
                                                                            font-family: 宋体;">元;</span></span><span
                                                                                lang="EN-US" style="font-size: 10.5pt; color: gray; font-family: 'Times New Roman';
                                                                               ">EMS</span><span
                                                                                    style="font-size: 10.5pt; color: gray; font-family: 宋体; ">當日<span lang="EN-US" style="font-size: 10pt;
                                                                                        color: gray; font-family: Times New Roman">,</span><span style="color: gray; font-family: 宋体;
                                                                                           "></span>郵費</span><span
                                                                                                lang="EN-US" style="font-size: 10.5pt; color: gray; font-family: 'Times New Roman';
                                                                                               ">25.0</span><span
                                                                                                    style="font-size: 10.5pt; color: gray; font-family: 宋体; "></span>元（均送货上门)<b><span lang="EN-US" style="color: #ff6699;
                                                                                                        letter-spacing: -1pt;"><?xml namespace="" ns="urn:schemas-microsoft-com:office:office"
                                                                                                            prefix="o" ?></span></b></p>
                                        </span></span></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                       验证码:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCheck" runat="server" Width="50"></asp:TextBox>
                                        <font color="#cc0033">*</font> &nbsp;
                                        <img name="imgCheck" src="ValidateCode.aspx" />
                                        &nbsp;
                                        <asp:LinkButton ID="newCode" runat="server">看不清</asp:LinkButton>
                                    </td>
                                    <td style="width: 355px">
                                        <font color="#808080">请把图片显示的数字或者字母填到输入框内</font>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#e2e2e2" colspan="3" height="1">
                                    </td>
                                </tr>
                                <tr align="right">
                                    <td colspan="2">
                                        <asp:Button ID="btnOK" runat="server" Height="20" OnClick="btnOK_Click" Style="color: #0000ff"
                                            Text="提&nbsp;&nbsp;&nbsp;&nbsp;交" Width="120" />
                                        &nbsp; &nbsp; &nbsp;
                                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="清除" />
                                    </td>
                                    <td style="width: 355px">
                                    </td>
                                </tr>
                            </table>
            <uc1:pageFooter ID="PageFooter1" runat="server" />
                        <br />
                        <!-- }淏恅賦旰 -->
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp;
		</form>
	</body>
</HTML>
