<%@ Page language="c#" Inherits="SCard.admin.otherDefaultPicture" ResponseEncoding="utf-8" CodeFile="otherDefaultPicture.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
    <head>
        <title>otherDoesnotPicture</title>
        <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
        <meta name="CODE_LANGUAGE" Content="C#">
        <meta name="vs_defaultClientScript" content="JavaScript">
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <LINK href="style.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <form id="Form1" method="post" runat="server">
            <table align='center' width='100%' cellpadding='4' cellspacing='1' border='1' class='grid fixed'>
		        <tr>
			        <td width='140' class='category'>修改默认图片</td>
			        <td class='category'></td>
		        </tr>
		        <tr>
		            <td valign=top>现在的默认图片</td>
		            <td><asp:Image ImageUrl="../showAP.aspx?id=0" Width="200" Height="128" ID="imgLogo" Runat="server"></asp:Image></td>
		        </tr>
		        <tr>
		            <td valign=top>新的默认图片</td>
		            <td>
		                <INPUT id="uploadFile" onpropertychange="document.all.myimg.src='file:///'+this.value" size=40
                            type="file" runat="server" NAME="uploadFile"><br>
                        <font class='t1'>(图片格式必须为.gif或.jpg,建议大小:200*128象素)</font><br>
                        <IMG id="myimg" Width="200" Height="128" src="..\images\showimg.gif" border="0">&nbsp;</td>
		        </tr>
		        <tr>
		            <td></td>
		            <td><asp:Button ID="btnOK" Text="修 改" Runat="server" onclick="btnOK_Click"></asp:Button>
                        </td>
		        </tr>
		    </table>
        </form>
        
        <br><br><br>
    </body>
</html>
