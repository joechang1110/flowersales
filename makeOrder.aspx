<%@ Page language="c#" Inherits="SCard.makeOrder" ResponseEncoding="utf-8" CodeFile="makeOrder.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="pageHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="pageFooter" Src="pageFooter.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>填写订单 --</title>


		<LINK href="style/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<uc1:pageheader id="PageHeader1" runat="server"></uc1:pageheader>
		<table width="760" class="ZWenbg2" cellpadding="2" cellspacing="2">
			<tr>
				<td align="center" style="width: 756px">
					<!-- 淏恅羲宎{ -->
					<form id="Form1" method="post" runat="server">
						<br>
						<img width="750" src="images/liucheng01.jpg">
						<br>
						<table width="750">
							<tr>
								<td height="31" background="images/chengse01.gif">&nbsp;&nbsp;&nbsp;&nbsp; <font style="FONT-SIZE: 14px">
										<B>所购鲜花</B></font></td>
							</tr>
						</table>
						<table width="750" cellpadding="5" cellspacing="5">
							<tr>
								<td width="230" align="right">
									<IMG width="200" border="0" id="myImg" runat="server" style="height: 245px">
								</td>
								<td>
									<table width="60%">
										<tr>
											<td><asp:label Font-Bold="True" ForeColor="#CC0033" id="lblPName" Runat="server"></asp:label></td>
										</tr>
										<tr>
											<td height="5"><hr style="BORDER-TOP-STYLE:dashed;BORDER-RIGHT-STYLE:dashed;BORDER-LEFT-STYLE:dashed;BORDER-BOTTOM-STYLE:dashed"
													size="1">
											</td>
										</tr>
										<tr>
											<td align="left">&nbsp;<img src="images/emoney.gif">&nbsp;原價:
												<del>
													ㄓ<asp:label id="lblPFPrice" Runat="server"></asp:label></del></td>
										</tr>
										<tr>
											<td align="left">&nbsp;<img src="images/emoney.gif">&nbsp;現價:<asp:label id="lblPNPrice" ForeColor="#CC0033" Runat="server"></asp:label></td>
										</tr>
                                        <tr>
                                            <td>
                                                <asp:label id="lblIsStock" Runat="server"></asp:label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="DropDownList1" AutoPostBack="True" Runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                                                    <asp:ListItem Selected="True" Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                </asp:DropDownList>
                                                <FONT color="#cc0033">*</font> &nbsp;&nbsp; 总价格
                                                <asp:Label ID="lblCount" runat="server" Font-Bold="True" ForeColor="#FF0033"></asp:Label>元
                                            </td>
                                        </tr>
										<tr>
											<td style="height: 22px">
                                                &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="放入购物车" /></td>
										</tr>
									</table>
								</td>
								<td></td>
							</tr>
						</table>
						<table width="750" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="2"><img src="images/tianxiedingdan.gif"></td>
							</tr>
							<tr>
								<td bgcolor="#f7941d" style="height: 1px"></td>
							</tr>
						</table>
						<table width="750" cellspacing="10">
							<tr>
								<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请输入以下信息<FONT color="#cc0033">带星号为必填项目</FONT>ㄘ								</td>
							</tr>
							<tr>
								<td width="130" align="right">
                                    会员ID:
                                </td>
								<td>
									<asp:TextBox ID="txtName" MaxLength="20" Runat="server"></asp:TextBox>
									<FONT color="#cc0033">*</FONT>								</td>
								<td style="width: 355px">
									</td>
							</tr>
                            <tr>
                                <td align="right" style="height: 24px">
                                    真实名称</td>
                                <td style="height: 24px">
                                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="20"></asp:TextBox></td>
                                <td style="height: 24px; width: 355px;">
                                    <span style="color: #808080">请输入真实姓名和电子邮件,以便以后核实资料</span>
                                </td>
                            </tr>
							<tr>
								<td align="right">
									电子邮件								</td>
								<td>
									<asp:TextBox ID="txtEmail" MaxLength="20" Runat="server"></asp:TextBox>
									<FONT color="#cc0033">*</FONT>								</td>
								<td style="width: 355px">
									<asp:RegularExpressionValidator id="REVEmail" runat="server" ErrorMessage="电子邮件格式错误!!" ControlToValidate="txtEmail"
										ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>								</td>
							</tr>
							<tr>
								<td align="right" style="height: 24px">
									联系电话：								</td>
								<td style="height: 24px">
									<asp:TextBox ID="txtPhone" MaxLength="15" Runat="server" Width="195px"></asp:TextBox>								
                                    <span style="color: #cc0033">*</span>
                                </td>
								<td style="height: 24px; width: 355px;"></td>
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
                                                                            font-family: 宋体; ">元;</span><span
                                                                                style="font-size: 10pt"><span style="color: gray; font-family: 宋体; 
                                                                                   ">快邮:</span><span lang="EN-US" style="color: gray;
                                                                                        font-family: Times New Roman">4</span><span style="color: gray; font-family: 宋体;
                                                                                           ">ㄜ</span><span
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
                                                                    font-family: 宋体;">邮费</span><span
                                                                        lang="EN-US" style="color: gray; font-family: Times New Roman">15.0</span><span style="color: gray;
                                                                            font-family: 宋体;">元;</span></span><span
                                                                                lang="EN-US" style="font-size: 10.5pt; color: gray; font-family: 'Times New Roman';
                                                                               ">EMS</span><span
                                                                                    style="font-size: 10.5pt; color: gray; font-family: 宋体; ">:当日<span lang="EN-US" style="font-size: 10pt;
                                                                                        color: gray; font-family: Times New Roman">,</span><span style="color: gray; font-family: 宋体;
                                                                                           "></span>邮费</span><span
                                                                                                lang="EN-US" style="font-size: 10.5pt; color: gray; font-family: 'Times New Roman';
                                                                                               ">25.0</span><span
                                                                                                    style="font-size: 10.5pt; color: gray; font-family: 宋体; "></span>（均送货上门)<b><span
                                                                                                        lang="EN-US" style="color: #ff6699; letter-spacing: -1pt"><?xml namespace="" ns="urn:schemas-microsoft-com:office:office"
                                                                                                            prefix="o" ?></span></b><b><span lang="EN-US" style="color: #ff6699;
                                                                                                        letter-spacing: -1pt;"><?xml namespace="" ns="urn:schemas-microsoft-com:office:office"
                                                                                                            prefix="o" ?></span></b></p>
                                        </span></span></td>
                                </tr>
							<tr>
								<td align="right">
									购买数量								</td>
								<td>
									<asp:DropDownList ID="ddlNum" AutoPostBack="True" Runat="server" onselectedindexchanged="ddlNum_SelectedIndexChanged">
										<asp:ListItem Value="1" Selected="True">1</asp:ListItem>
										<asp:ListItem Value="2">2</asp:ListItem>
										<asp:ListItem Value="3">3</asp:ListItem>
										<asp:ListItem Value="4">4</asp:ListItem>
										<asp:ListItem Value="5">5</asp:ListItem>
										<asp:ListItem Value="6">6</asp:ListItem>
										<asp:ListItem Value="7">7</asp:ListItem>
										<asp:ListItem Value="8">8</asp:ListItem>
										<asp:ListItem Value="9">9</asp:ListItem>
										<asp:ListItem Value="10">10</asp:ListItem>
									</asp:DropDownList>
									<FONT color="#cc0033">*</FONT>&nbsp;&nbsp;&nbsp;   总价格
									<asp:Label Font-Bold="True" ForeColor="#ff0033" ID="lblTotalPric" Runat="server"></asp:Label>元								</td>
								<td style="width: 355px"></td>
							</tr>
							<tr>
								<td align="right">
									验证码：								</td>
								<td>
									<asp:TextBox ID="txtCheck" Width="50" Runat="server"></asp:TextBox>
									<FONT color="#cc0033">*</FONT>&nbsp;&nbsp; <img src="ValidateCode.aspx" name="imgCheck">&nbsp;&nbsp;
									<asp:LinkButton id="newCode" runat="server">看不清</asp:LinkButton>								</td>
								<td style="width: 355px">
									<font color="#808080">请把图片显示的数字或者字母填到输入框内</font>								</td>
							</tr>
							<tr>
								<td colspan="3" height="1" bgcolor="#e2e2e2"></td>
							</tr>
							<tr align="right">
								<td colspan="2">
									<asp:Button ID="btnOK" style="COLOR:#0000ff" Text="提&nbsp;&nbsp;&nbsp;&nbsp;交" Runat="server"
										Width="120" Height="20" onclick="btnOK_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<asp:Button ID="btnClear" Text="清 除" Runat="server" onclick="btnClear_Click"></asp:Button>								</td>
								<td style="width: 355px"></td>
							</tr>
						</table>
					</form>
					<br>
					<br>
					<!-- }淏恅賦旰 -->
				</td>
			</tr>
		</table>
		<uc1:pageFooter id="PageFooter1" runat="server"></uc1:pageFooter>
	</body>
</HTML>
