<!DOCTYPE html>

<html>
<head>


<#assign localPath=""/>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    
    
	<link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/>
   
    <link href="${localPath}/css/docs.css" rel="stylesheet">
	<link href="${localPath}/css/style.css" rel="stylesheet">
	<style type="text/css">

	</style>
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

    <div class='topNavContainer gameList myContainer'>



		<#include "outerTop.ftl">

    	<div class="showSearch">Games</div>
		<div id="masonry" class=""></div>
		
		<div id="masonry_ghost" class="hide">
			<div class="thumbnail mymode">
				<input type="hidden"  class="gameId" value=""/>
				<input type="hidden"  class="modelId" value=""/>
				<input type="hidden"  class="userId" value=""/>
				<div class="myauthor row">
					<div class="col-xs-3 headImg">

						<a href="" class="gameUrl"><img src="${localPath}/img/14.jpg" alt="" class="user"/></a>
					</div>
					<div class="col-xs-9 userName toGame">
						Beay Akers
					</div>
					
				</div>
				<div class="imgs">
					
				</div>
				<div class="caption">
					
					
					<div class="downContent">
						<div class="userTag" >
							
							<button type="button" class="mybtns btn btn-default followOpe followGame">Follow</button>
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
	<script src="${localPath}/js/main.js"></script>
	<script src="${localPath}/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
	<script type="text/javascript">


		$(document).ready(function(){ 


			var address = "/";

			var pageNum = 1;
			var totalWidth = 0;
			var imagesGameLoading = false;
			var thumLengthGameFlag = false;
			var gameMasNode = $(".gameList #masonry");
			$(".initload").show();
			/*game列表初始化列表*/
			function initGameMasonry() {

				var imgs = [];
				
				init = true;

				 $.ajax({
				     url:'/game/list',
				     dataType:'json',
				     data:{pageNum:pageNum,pageSize:"12",lan:"0",coverUrlCount:"6"},
				     cache:false, 
				     success:function(data){
				         imgs = data.followingForUsers;
				        
				        
						if(imgs.length < 12){
							thumLengthFlag = true;
						}
						var items = getNewGameItems(imgs).css('opacity', 0);
						processNewGameItems(items);

						gameMasNode.append(items);
						
						
						
						imagesGameLoading = true;
						items.imagesLoaded(function(){
							
							
							
							items.css('opacity', 1);
							var leftArray = [0,240,480,720,9601,1200,1440];
							gameMasNode.masonry({
								itemSelector: '.thumbnail',
								isFitWidth: true,
								leftArray:leftArray
							});
							
							$(".initload").hide();

							imagesGameLoading = false;
							
						});
						appendToGameMasonry();
						/*
						appendToGameMasonry();
						appendToGameMasonry();
						appendToGameMasonry();*/
						
						
						
					     }
					  });
					
					
				}
			initGameMasonry();
			$(window).keypress(function(btn){
				if(btn.keyCode ==13){
					$("#login").trigger("click");
				}
			});

			/****************下拉的时候请求game列表数据****************/
			function appendToGameMasonry() {
			var imgs = [];
			pageNum++;
			imagesGameLoading = true;
			$(".loadFoot").show();
			$.get("/game/list",{pageNum:pageNum,pageSize:"12",lan:"0",coverUrlCount:"6"},function(data){
				
				imgs = data.followingForUsers;
				

				if(imgs.length < 3){
					thumLengthGameFlag = true;
				}
				if(imgs.length == 0){
					$(".footgif").hide();
					$(".footpng").show();
					$(".footFont").show();
					return;
				}
				var items = getNewGameItems(imgs).css('opacity', 0);

				processNewGameItems(items);
				gameMasNode.append(items);
				
				
				items.imagesLoaded(function(){
					
					items.css('opacity', 1);
					var leftArray = [];
					
					//var start = count * (pageNum - 1) - 1;
					var thums = $("#masonry .thumbnail");
					//var thums = $("#masonry .thumbnail:gt("+start+")");
					
					
					leftArray.push(column1,column2,column3,column4,column5,column6,column7);
					
					gameMasNode.masonry('appended',  items,leftArray,remainShow);
					imagesGameLoading = false;
					
					$(".loadFoot").hide();
					
					
				});
				
				
				
				
			});
			
		}

		 	/***********为game列表每一块添加数据**********/
			function getNewGameItems(imgs) {
				var newItemContainer = $('<div/>');
				$(imgs).each(function(index){
				
					var elem = "";

					
					var column = pageNum + ":" + (index + 1);

					var gameImgList = this.coverPosts;
					var gameImgs = "";
					if(gameImgList.length > 0){
						gameImgs = $('<div class="gameImgList clearfix"></div>');
						$(gameImgList).each(function(){
							var type = this.type;
							var c = "";

							if(type == "1"){
								c = $('<div class="gameImg col-md-4"><input type="hidden" value="'+this.coverImg+'" class="showimg"/>'+
								'<input type="hidden" class="postId" value="'+this.id+'">'+'<input type="hidden" value="'+this.userId+'" class="postUserId">'+
									'<img src="'+address+'img/play.png" alt="" class="plays" style="display:inline"/></div>');
							}else{
								c = $('<div class="gameImg col-md-4"><input type="hidden" value="'+this.coverImg+'" class="showimg"/>'+
								'<input type="hidden" class="postId" value="'+this.id+'">'+'<input type="hidden" value="'+this.userId+'" class="postUserId">'+
									'<img src="'+address+'img/play.png" alt="" class="plays" style="display:none"/></div>');
							}			
											
							$(gameImgs).append(c);
						});
					}else{
						gameImgs = $('<img src="'+address+'img/nopost.png"/><h4 class="noImage noposts">No post!</h4>');
					}

					elem = $(".mymode")
							.find(".gameUrl")
							.attr("href","/game/" + this.id +"/")
							.end()
							.find(".gameId")
							.val(this.id)
							.end()
							.find(".user")
							.attr("src",this.icon)
							.end()
							.find(".userName")
							.attr("title",this.gameName)
							.html("")
							.html(this.gameName)
							.end()
							.find(".imgs")
							.html("")
							.append(gameImgs)
							.end()
							.addClass("imgModal")
							.clone()
							.data("column",column)
							.removeClass("mymode");

					if(this.isOrNotFollowGameByCurrenUser == "0"){
						$(elem).find(".followGame").html("Unfollow")
					}else{
						$(elem).find(".followGame").html("Follow");
					}
					newItemContainer.append(elem);
					
				});

				
				
				return newItemContainer.find('.thumbnail');
			}

			/*game列表处理显示图片*/
			function processNewGameItems(items) {
				items.each(function() {
					var $this = $(this);
					var imgsNode = $this.find('.imgs');

					var imgNames = imgsNode.find('.gameImg');
					$.each(imgNames, function(index, item) {
						var img = $(item).find(".showimg").val();

						/******************如果是png图片，加一个背景颜色****************************/

						if(img.indexOf(".png") > -1){
							getImageSize({
				                img:img,
				                oncomplete:function(){
				                  var indexImg = null;
				                  var objWidth = this.width;
				                  var objHeight = this.height;
				                 
				                  $(item).append('<a href="#detailModel" data-toggle="modal" class="seeDetail enterDetail"><img src="" style="background-color: #efefef;"/></a>');
				                   indexImg = $(item).find(".enterDetail img");
				                   indexImg.attr({"src":img,"width":objWidth,"height":objHeight});
				                   
				                   indexImg.VMiddleImg();
				                  

				              	     indexImg = null;
				                }
				            });
							
						}else{
							
							getImageSize({
				                img:img,
				                oncomplete:function(){
				                  var indexImg = null;
				                  var objWidth = this.width;
				                  var objHeight = this.height;
				                 $(item).append('<a href="#detailModel" data-toggle="modal" class="seeDetail enterDetail"><img src="" /></a>');
				                   indexImg = $(item).find(".enterDetail  img");

				                   indexImg.attr({"src":img,"width":objWidth,"height":objHeight});
				                  
				                   
				                   indexImg.VMiddleImg();
				                   
				                   
				              	    
				                }
				            });
						}
						
					});                 
				});
				$(items).each(function(){
					var im = $(this).find(".gameImg").length;
				});
			}

			$(window).scroll(function() {
				
				var height = $(window).height() / 2;
				if(thumLengthGameFlag){
					$(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
				}
				if(!thumLengthGameFlag && $(document).height() - $(window).height() - $(document).scrollTop() < height) {

					if(!imagesGameLoading) {
						
						appendToGameMasonry();

						
					}
					
				}
			
			});
			
		});
	</script>

</body>
</html>