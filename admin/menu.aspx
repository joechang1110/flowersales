<%@ Page language="c#" Inherits="SCard.admin.menu" ResponseEncoding="utf-8" CodeFile="menu.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
    <head>
        <title>menu</title>
        <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
        <meta name="CODE_LANGUAGE" Content="C#">
        <meta name="vs_defaultClientScript" content="JavaScript">
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <LINK href="style.css" type="text/css" rel="stylesheet">
        <style rel='stylesheet'>
       div	{
			width:			100%;
			text-align:		left;
		    }
		ul	{
			width:			90%;
			text-align:		left;
            margin:			0px;
			display:		inline;
		    }
        </style>
        <script language='javascript'>
		function over(obj)
		{
			obj.style.color = '#ff6600';
			obj.style.backgroundColor = '#f7f7f7';
		}
		function out(obj)
		{
			obj.style.color = '';
			obj.style.backgroundColor = '';
		}
		function shift(id)
		{
			var obj = document.getElementById(id);
			if (obj.style.display == 'none')
			{
				obj.style.display = 'inline';
			}
			else
			{
				obj.style.display = 'none';
			}
		}
        </script>
    </head>
    <body>
        <form id="Form1" method="post" runat="server">
        </form>
        <base target='right' />
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('system')">系统</div>
            <ul id='system'>
                <li>
                
                    <a href='../index.aspx' target='_blank'>打开店铺首页</a></li>
                <li>
                    <a href='adminOutlogin.aspx' target='_top'>退出登录</a></li>
            </ul>
        </div>
        <br />
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('board')">分类管理</div>
            <ul id='board' style='display:none'>
                <li>
                    <a href='categoryAdd.aspx' target="right">新增分类</a></li>
                <li>
                    <a href='categoryAlter.aspx' target="right">修改/删除</a></li>
            </ul>
        </div>
        <br />
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('product')">
                鲜花管理</div>
            <ul id='product' style='display:none'>
                <li>
                    <a href='productAdd.aspx' target="right">添加鲜花</a></li>
                <li>
                    <a href='productAlter.aspx' target="right">明细管理</a></li>  
                     <li>
                    <a href='productTJ.aspx' target="right">盈利分析</a></li>       
                <li>
                    <a href='productVouch.aspx' target="right">推荐花束</a></li><li>
                    <a href='productHot.aspx' target="right">热卖鲜花</a></li></ul>
        </div>
        <br />
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('order')">订单管理</div>
            <ul id='order'>
                <li>
                    <a href='orderList.aspx' target="right">查看订单</a></li>
                    
                <li>
                    <a href='orderTidy.aspx' target="right">整理订单</a></li>
                    <li>
                    <a href='clearOrders.aspx' target="right">清空订单记录</a></li>
                
            </ul>
        </div>
        <br />
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('message')">留言板信息管理</div>
            <ul id='message'>
                <li>
                    <a href='messageList.aspx?State=0' target="right">未读信息</a></li>
                <li><a href='messageList.aspx?State=1' target="right">已读信息</a></li>
                <li>
                    <a href='../myleavwWord.aspx' target="right">管理商品评论</a></li>
            </ul>
        </div>
        <br />
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('admin')">管理员设置</div>
            <ul id='admin' style='display:none'>
           <li><a href='View_User.aspx' target="right">会员管理</a></li>
                <li>
                    <a href='adminAdd.aspx' target="right">新增管理员</a></li>
                <li>
                    <a href='adminList.aspx' target="right">所有管理员</a></li>
                <li>
                    <a href='adminSelf.aspx' target="right">修改我的登陆设置</a></li>
            </ul>
        </div>
        <br /> 
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('other')">系统杂项</div>
            <ul id='other' style='display:none'>
                <li>
                    <a href='otherAnnounce.aspx' target="right">修改公告</a></li>
               
                <li>
                    <a href='otherDefaultPicture.aspx' target="right">修改默认图片</a></li>
                
                <li>
                    <a href='initialize.aspx' target="right">系统初始化</a></li>
            </ul>
        </div>
        <br/>
        <div class='grid'>
            <div class='category cursor' onmouseover='over(this)' onmouseout='out(this)' onclick="shift('wangguan')">
                邮递方式管理</div>
            <ul id='wangguan' style='display:none'>
                <li>
                    <a href='Info_Bm.aspx' target="right">邮递方式管理</a> </li></ul>
        </div>
        <br /> 
        <br>
        <div align='left'>
           
        </div>
    </body>
</html>
