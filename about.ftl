<!DOCTYPE html>
<html>
<head>

	<#assign localPath=""/>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About</title>
    <link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/>
    <link rel="stylesheet" type="text/css" href="${localPath}/css/style.css">
    <style>
		header{
			background: #fff;
			border-bottom: 1px solid #c3c3c3;
			height: 58px;
			line-height: 58px;
		}
		.staticlogo{
			
			
			margin-left: 20%;
			margin-top: 5px;
		}
		.content{
			
			padding-top: 45px;
		}
		p{
			line-height: 26px;
			font-size: 18px;
			color: #575757;
		}
		h3{
			font-weight: bold;
			padding-top: 36px;
			padding-bottom: 36px;
		}
		body{
			background: #fff;
			font-family: "Microsoft Yahei"!important;
		}
		.titleP{
			font-size: 20px;
			color: #101010;

		}
		.row{
			background: #e9e9e9;
		}
		.title{
			margin-left:25%;
			padding-left:80px;
			height: 58px;
		}
		.title p{
			height: 58px;
			line-height: 58px;
			margin-bottom: 0;
			font-weight: bold;
			color:#101010;
			font-size: 24px;
		}
		.join{
			float: right;
			margin-right: 20%;
			color: rgb(237,96,5); 
			font-size: 18px;
			font-weight: bold;
			margin-top: 18px;
		}
		.join:hover{
			color: rgb(237,96,5); 
		}
		.footer{
			width:50%;
			margin:auto;
		}
		.footer p{
			font-size: 16px;
			line-height: 17px;
		} 
		.left{
			padding-left: 56px;
			padding-right: 50px;
		}
		.right{
			padding-right: 56px;
		}
		.footer .col-xs-12{
			padding-left: 56px;
			height: 100px;
			line-height: 100px;
		}
		.content-footer{
			background: #e9e9e9;
			padding: 0;
			
		}
		.hello{
			font-weight: bold;
			font-size: 18px;
			color: #101010;
		}
		.footer p.allRight{
			font-size: 13px;
		}
		.right div{
			height: 35px;
			border-bottom: 1px solid #c3c3c3;
			line-height: 35px;
		}
		.right a{
			color: #575757;
		}
		.right a:hover{
			color: #575757;
		}
		.aboutShow{
			margin-top: 20px;
		}
    </style>
    <#include "GA.ftl"/>
</head>
<body class="about">
	<div class="topNav" role="navigation">
		<a href="/"><img src="${localPath}/img/logo.png" class="staticlogo"/></a>
		<a href="/" class="join" />Join Treeth</a>
	</div>
	
	<div class="container-fluid content ">
		<div class="aboutShow">
			<img src="${localPath}/img/about.png" class="imgs">
		</div>
		<div class="talk">
			<h2>Talk about Games You Play and Discover More!</h2>
		</div>
		<div class="start">
			<img src="${localPath}/img/start.png" class="startImg">
		</div>
	</div>
	<div class="container-fluid content-footer">
		<div  class="footer row">
			<div class="col-xs-12"><img src="${localPath}/img/logo.png" class="startImg logoImg"/></div>
			<div class="left col-xs-6">
				<p class="hello">Talk About Games You Play and Discover More!</p>
				
				<p>
					A dedicated hub for gaming-related community and interaction, Treeth is the place where you can find useful walkthroughs, share your gaming experience, find like-minded gamers and together discover more games that you’ll fall in love with!
				</p>
				<P class="allRight">
					©2014 Treeth. All rights reserved.
				</P>
			</div>
			<div class="right col-xs-6">
				<div><a href="#contactModal" data-toggle="modal">Contact us</a></div>
				<div><a href="https://www.facebook.com/pages/Treeth/989145331110874" target="_blank">Facebook</a></div>
				<div><a href="https://plus.google.com/102817195528280190850/posts" target="_blank">Google+</a></div>
				<div><a href="https://twitter.com/Treeth7" target="_blank">Twitter</a></div>
				<div><a href="mailto:contact@treeth.com">Email: contact@treeth.com</a></div>
			</div>
		</div>
	</div>
	<#include "dropdown.ftl"/>
	<script type="text/javascript" src="${localPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${localPath}/js/bootstrap3/bootstrap.min.js"></script>
	<script type="text/javascript"src="${localPath}/js/ajaxfileupload.js"></script>
	<script src="${localPath}/js/main.js"></script>
	<script type="text/javascript">
		$(".about .startImg").click(function(){
			window.location.href = "/";
		});
	</script>
</body>
</html>