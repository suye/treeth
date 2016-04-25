<!DOCTYPE html>

<html>
<head>







<#assign localPath=""/>







	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Popular on Treeth-what people are loving today.</title>
    
    
	<link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/>
   
    <link href="${localPath}/css/docs.css" rel="stylesheet">
	<link href="${localPath}/css/style.css" rel="stylesheet">
	<#include "GA.ftl"/>
</head>
    
<body class="mybody">
 <#include "header.ftl">  
     <img src="${localPath}/img/iconFoot.gif" alt=""  class="initload">
	 <div class="sessionInfo">
            <#if (Session["USER_LOGIN_DATA"].user)??>
				 <input type="hidden" name="" class="userInfo loginId" value='${Session["USER_LOGIN_DATA"].user.id}'>
				 <input type="hidden" name="" class="loginImg" value='${Session["USER_LOGIN_DATA"].user.pictureUrl}'>
				 <input type="hidden" name="" class="loginName" value='${Session["USER_LOGIN_DATA"].user.firstName}'>
            <#else>
           
            </#if>
         </div>	

    <div class='topNavContainer myContainer'>



		<#include "outerTop.ftl">

    	<div class="showSearch">Popular</div>
		<div id="masonry" class=""></div>
		
		<div id="masonry_ghost" class="hide">
			<div class="thumbnail mymode">
				<input type="hidden"  class="modelId" value="aaa"/>
				<input type="hidden"  class="userId" value=""/>
				<input type="hidden"  class="width" value=""/>
				<input type="hidden"  class="height" value=""/>
				<!-- <img src="/img/down.png" alt="" class="updown" />  -->
				<div class="myauthor row">
					<div class="col-xs-2 headImg">
						<a href="javascript:;" class="personUrl"><img src="" alt="" class="user"/></a>
					</div>
					<div class="col-xs-10 userName postUser">
						Beay Akers
					</div>
					
				</div>
				<div class="imgs">
					<input type="hidden" value="" class="showimg"/>
					<img src="${localPath}/img/play.png" alt="" class="plays"/>
					<div class="showAllImg">Expand Post</div>
				</div>
				<div class="caption">
					<div class="upContent">
						<div class="title">简单OA管理系统ddd</div>
						<div class="content">
							
						</div>
			
						<div class="author">
							<div class="row">
								<div class="col-xs-7">
									<a href="javascript:;" class="like" ><img src="${localPath}/img/like.png" alt="" class="likeImg"/></a></a>
									<span class="likeNum">24</span>&nbsp;&nbsp;
									<a href="javascript:;"  class="publish"><img src="${localPath}/img/comments01.png" alt="" class="commentImg"></a>
									<span class="commentNum" >24</span>
								</div>
								<div class="col-xs-5 shareImg pull-right">
									<a href="javascript:;"><img src="${localPath}/img/twitter.png" alt="" class="twiterImg"/></a>&nbsp;
									<a href="javascript:;"><img src="${localPath}/img/facebook.png" alt="" class="faceImg"/></a>
								</div>
							</div>
						
						</div>
					</div>
					<hr>
					<div class="downContent">
						<div class="imgContents thumComments"></div>
						<a href="#detailModel" data-toggle="modal" class="seeDetail allcomment"><input type="button" value="All Comments" class="remains remain btn btn-sm btn-default "></a>
					
						<div class="addOwnComment">
							<div class="myauthor row">
								<div class="own col-xs-3 ">
									<img src="" alt="" class="user"/>
								</div>
								<div class="own col-xs-9">
									<div class="userName moreflow">Beay Akers</div><br/>
									
								</div>
								
							</div>
							<textarea name="" id=""  class=" form-control homeContent postComment" rows="3" placeHolder="Add a comment"></textarea>
							<input type="button" value="OK" class="btn btn-sm btn-danger homeAddComment "/>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
	
	</div>

	
	

	
<#include "secModel.ftl">  
<#include "dropdown.ftl">  

 	<#include "loadFoot.ftl"/>
    
	<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
	<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
	<script src="${localPath}/js/imagesloaded.pkgd.min.js"></script>
	<script src="${localPath}/js/masonry.pkgd.js"></script>
	<script src="${localPath}/js/kindeditor/kindeditor.js"></script>
	<script src="${localPath}/js/kindeditor/lang/en.js"></script>
	<script src="${localPath}/js/kindeditor/plugins/code/prettify.js"></script>
	<script  src="${localPath}/js/jquery.tagsinput.js"></script>
	<script src="${localPath}/js/jquery.form.js"></script>
	<script src="${localPath}/js/jquery.VMiddleImg.js"></script>
	<script src="${localPath}/js/project.js"></script>
	<script src="${localPath}/js/ajaxfileupload.js"></script>
	
	<script type="text/javascript">


		$(document).ready(function(){ 
			$(".initload").show();
			initMasonry("/popular/list");
			$(window).keypress(function(btn){
				if(btn.keyCode ==13){
					var iflogin = ("#loginModel").is(":hidden");
					if(!iflogin) $("#login").trigger("click");
				}
			});

			$(window).scroll(function() {
				var height = $(window).height() / 2;
				if(thumLengthFlag){

					$(".footgif").hide();
					$(".loadFoot").show();
					$(".footpng").show();
					$(".footFont").show();
					return;
				}
				if(!thumLengthFlag && $(document).height() - $(window).height() - $(document).scrollTop() < height) {
					
					if(!imagesLoading) {
							
						appendToMasonry("/popular/list");
					}
					
				}
			
			});
			$(window).resize(function(){
				var left = $("#detailModel .leftContent")[0].offsetLeft + 2;
				$(".detailTop").css({"left":left});
			});
			
			/*$(".testshow").trigger("click");*/

		});
	</script>
	<script src="${localPath}/js/main.js"></script>
	
</body>
</html>