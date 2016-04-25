<!DOCTYPE html>
<html>
<head>





<#assign localPath=""/>




	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Treeth</title>
    <link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />

    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    <link href="${localPath}/css/docs.css" rel="stylesheet">
	<link href="${localPath}/css/style.css" rel="stylesheet">


	<!--[if lt IE 9]>
      <script src="${localPath}/js/html5shiv.min.js"></script>
      <script src="${localPath}/js/respond.min.js"></script>
    <![endif]-->

		<#include "GA.ftl"/>

</head>
    
<body class="mybody">
 <#include "header.ftl"> 
	

     <img src="${localPath}/img/load3.gif" alt=""  class="initload">
	 <div class="sessionInfo">
            <#if (Session["USER_LOGIN_DATA"].user)??>
				 <input type="hidden" name="" class="userInfo loginId" value='${Session["USER_LOGIN_DATA"].user.id}'>
				 <input type="hidden" name="" class="loginImg" value='${Session["USER_LOGIN_DATA"].user.pictureUrl}'>
				 <input type="hidden" name="" class="loginName" value='${Session["USER_LOGIN_DATA"].user.firstName} ${Session["USER_LOGIN_DATA"].user.lastName}'>
				
            <#else>
            </#if>
         </div>	

    <div class='topNavContainer'>

<#if (Session["USER_LOGIN_DATA"].user)??>
    <#if Session["USER_LOGIN_DATA"].user.status == 1>
    <div class="container checkEmail">
    <p>Psst.Don't forget to confirm your email! Just look for the message we sent you.<a href="javascript:" id="resendEmail">Resend email</a> or <a href="javascript:" id="changeYourEmail">Change your address.</a></p>
    </div>
        </#if>
</#if>
 
		<#include "outerTop.ftl">

   	
		<div id="masonry" class=""></div>
		
		<div id="masonry_ghost" class="hide">
			<div class="thumbnail mymode">
				<input type="hidden"  class="modelId" value="aaa"/>
				<input type="hidden"  class="userId" value=""/>
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
					<img src="${localPath}/img/play.png" alt="" class="play"/>
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
									<a href="javascript:;" class="like" ><img src="${localPath}/img/like.png" alt="like the post" class="likeImg"/></a></a>
									<span class="likeNum">24</span>&nbsp;&nbsp;
									<a href="javascript:;"  class="publish"><img src="${localPath}/img/comments01.png" alt="comments" class="commentImg"></a>
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

	
	

   
	<#include "secModel.ftl"/>  
	<#include "dropdown.ftl"/>  
	
	
	<button class="btn btn-primary btn-lg guideBtn" data-toggle="modal" data-target="#guideModel" style="display:none">
	  Launch demo modal
	</button>
	<div class="speModal modal fade models  module1 moduleStep" id="guideModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="chose">
		<img src="${localPath}/img/home_01.png" >
	</div>
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">

		<p class="guideContent">
			
			You can manage your posts here and show yourself.
		</p>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default  mybtns focusBtn module1Btn" data-dismiss="modal">Have a look!</button>
      </div>
    </div>
  </div>
</div>
 <button class="btn btn-primary btn-lg guideBtn2" data-toggle="modal" data-target="#guideModel2" style="display:none">
	  Launch demo modal
	</button>
	<div class="speModal modal fade models  module2 moduleStep" id="guideModel2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="chose">
		<img src="${localPath}/img/add_01.png" > 
	</div>
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
      	<h3>Make some posts.</h3>
		<p class="guideContent">

			There are two post types such as image and video.
		</p>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default  mybtns focusBtn module2Btn" data-dismiss="modal">Go ahead!</button>
      </div>
    </div>
  </div>
</div>
   	 <button class="btn btn-primary btn-lg guideBtn3" data-toggle="modal" data-target="#guideModel3" style="display:none">
	  Launch demo modal
	</button>
	<div class="speModal modal fade models  module3 moduleStep" id="guideModel3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="chose">
		 <img src="${localPath}/img/commentGuide.png" >
	</div>
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
      	<h3>If you want to say something...</h3>
		<p class="guideContent">

			Click this.Go ahead and write them down.
		</p>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default  mybtns focusBtn module3Btn" data-dismiss="modal">I get it</button>
      </div>
    </div>
  </div>
</div>

 <button class="btn btn-primary btn-lg guideBtn4" data-toggle="modal" data-target="#guideModel4" style="display:none">
	  Launch demo modal
	</button>
	<div class="speModal modal fade models  module4 moduleStep" id="guideModel4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="chose">
		 <img src="${localPath}/img/likeGuide.png" >
	</div>
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
      	<h3>If you like something...</h3>
		<p class="guideContent firstGuide">

			Click the heart. It's called 
			
		</p>
       	<p class="guideContent secGuide">
       		'liking'.Like the posts you like.
       	</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default  mybtns focusBtn module4Btn" data-dismiss="modal">I get it</button>
      </div>
    </div>
  </div>
</div>

<button class="btn btn-primary btn-lg guideBtn6" data-toggle="modal" data-target="#guideModel6" style="display:none">
	  Launch demo modal
	</button>
	<div class="speModal modal fade models  module6 moduleStep" id="guideModel6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="chose">
		 <img src="${localPath}/img/contactGuide.png" >
	</div>
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
      	<h3>Please contact us...</h3>
		<p class="guideContent">

			Please contact us and give us early <br>
			feedback on our beta version.Your feedback <br>
			helps make Treeth better.
			
		</p>
       <!-- 	<p class="guideContent secGuide">
       	'liking'.Like the posts you like.
       </p> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default  mybtns focusBtn module6Btn" data-dismiss="modal">I get it</button>
      </div>
    </div>
  </div>
</div>






	<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
	<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
	<script src="${localPath}/js/imagesloaded.pkgd.min.js"></script>
	<script src="${localPath}/js/masonry.pkgd.js"></script>
	<script  src="${localPath}/js/jquery.tagsinput.js"></script>
	<script src="${localPath}/js/jquery.VMiddleImg.js"></script>
	<script src="${localPath}/js/project.js"></script>
	<script src="${localPath}/js/ajaxfileupload.js"></script>
	
	
	<script type="text/javascript">

		

		$(document).ready(function(){ 
		
			
			var newUser = getCookie("newUser");
			
			if(newUser){
				delCookie("newUser");
				initMasonry("/post/list",{initFlag:"1"});
			}else{
				initMasonry("/post/list");
			}
			

			/******************likeGuide click跳入下一步commentGuide***************************/
			$(".module4Btn").click(function(){
				$(".module4").hide();
				$(".modal-backdrop.in").css("opacity","0");
				var post = $(".thumbnail:eq(1)");
				var top = $(post).find(".publish").offset().top;
				var left = $(post).find(".publish").offset().left;
				$(".module3 .modal-dialog").css({"left":left - 152,"top":top - 275});
				$(".module3 .chose").css({"position":"absolute","top":top - 95,"left":left - 12});
				$(".guideBtn3").trigger("click");
				
			});

			/*********************commentGuide click跳入下一步addmodal*********************************/
			$(".module3Btn").click(function(){
				
				$(".module3").hide();
				$(".modal-backdrop.in").css("opacity","0");
				var left = $(".addModal").offset().left;
				$(".module2 .chose").css({"left":left});
				var width = 430 - 48;
				$(".module2 .modal-dialog").css({"left":left - width});
				$(".guideBtn2").trigger("click");
				
			});
			/************************addmodal click跳入下一步setting***************************/
			$(".module2Btn").click(function(){
				
				$(".module2").hide();
				$(".modal-backdrop.in").css("opacity","0");
				var left = $(".messagePart").offset().left;
				var width = 430 - 24;
				$(".module1 .modal-dialog").css({"left":left - width});
				$(".guideBtn").trigger("click");
				
			});
			/************************setting click跳入下一步contactGuide***************************/
			$(".module1Btn").click(function(){
				
				$(".module1").hide();
				$(".modal-backdrop.in").css("opacity","0");
				var left = $(".moreSpan").offset().left;
				$(".module6 .modal-dialog").css({"left":left + 210});
				$(".guideBtn6").trigger("click");
				
			});

			/*******************contactGuide click关闭新手引导*********************************/
			$(".module6Btn").click(function(){
				$(".module6 .close").trigger("click");
				$(".modal-backdrop.fade").remove();
			});
			$(window).keypress(function(btn){
				if(btn.keyCode ==13){
					var iflogin = $("#loginModel").is(":hidden");
					if(!iflogin) $("#login").trigger("click");
				}
			});

			$(window).scroll(function() {
				var height = $(window).height() / 2;
				
				if(!thumLengthFlag && $(document).height() - $(window).height() - $(document).scrollTop() < height) {
					
					if(!imagesLoading) {
							
						appendToMasonry("/post/list");
					}
					
				}
			
			});
			$(window).resize(function(){
				var login = $(".sessionInfo .loginId").val();
				
				if(!isEmpty(login)){
					var left = $("#detailModel .leftContent")[0].offsetLeft + 2;
					$(".detailTop").css({"left":left});

					var left = $(".addModal").offset().left;
					$(".module2 .chose").css({"left":left});
					var width = 430 - 48;
					$(".module2 .modal-dialog").css({"left":left - width});

					var left = $(".messagePart").offset().left;
					var width = 430 - 24;
					$(".module1 .modal-dialog").css({"left":left - width});

					var left = $(".moreSpan").offset().left;
					$(".module6 .modal-dialog").css({"left":left + 210});
				}
				
			});
			
			/*$(".testshow").trigger("click");*/

		});
	</script>
	<script src="${localPath}/js/main.js"></script>

</body>
</html>