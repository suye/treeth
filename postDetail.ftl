<!DOCTYPE html>





<#assign localPath="">







<html >
<head>
    <title></title>
   
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


	<title>Document</title>
	<link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${localPath}/css/bootstrap3/bootstrap.css">
	<link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/>
	<link rel="stylesheet" href="${localPath}/css/style.css">
	<style type="text/css">
	
	</style>

		
		
	<#include "GA.ftl"/>
</head>
    
<body class="mybody ownPost">
	<#include "header.ftl">

<!--登陆模块-->
<div class="layer_mask" id="loginModel">
 	
    <div class="login_now">
        <ul class="login">
            <li class="q">
                <p class="l">Log In to Treeth <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></p>
            </li>
            <li class="ftg">
                <ul class="list-inline">
                    <li><a href="" id="facebook"><img src="/img/log-in-facebook01.png"></a></li>
                    <li class="center-li"><a href="" id="twitter"><img src="/img/log-in-twitter01.png"></a></li>
                    <li><a href="" id="google"><img src="/img/log-in-google_plus01.png"></a></li>
                </ul>
            </li>
            <li class="p login-p">
                <form role="form">
                    <div class="form-group">
                        <input type="email" class="form-control input" id="InputEmail" placeholder="Enter email" name="username">
                        <p class="point"></p>
                    </div>
                    <div class="form-group">
                     <input type="password" class="form-control input" id="InputPassword" placeholder="Password" name="password">
                     <p class="point"></p>

                    </div>
                    <div class="form-group form-last">
                        <ul class="list-inline">
                            <li class="other">
                                <ul>
                                    <li><a href="/forgot/password" class="forgot-pwd">Forgot your password?</a></li>
                                    <li><a href="/register" class="signup-a"> Sign up now</a></li>
                                </ul>
                            </li>
                            <li class="login-b"><button type="button" class="mybtns btn btn-default btn-sm" id="login">Log In</button></li>
                        </ul>

                    </div>

                </form>
            </li>
        </ul>
    </div>
</div>
	<div class="sessionInfo">
    <#if (Session["USER_LOGIN_DATA"].user)??>
		 <input type="hidden" name="" class="userInfo loginId" value='${Session["USER_LOGIN_DATA"].user.id}'>
		 <input type="hidden" name="" class="loginImg" value='${Session["USER_LOGIN_DATA"].user.pictureUrl}'>
		 <input type="hidden" name="" class="loginName" value='${Session["USER_LOGIN_DATA"].user.firstName}'>
    <#else>
   
    </#if>
 </div>	

	<input type="hidden" name="" value="${Request.postId}" class="myPostId">
	<div class="container  topNavContainers " id="detailModel">
    	
		<div class="">
	     	<div class="">
	     		 
		      <div class=" content ">
		        
		        	<div class=" mycontainer clearfix">
		        		<input type="hidden" class="modelId"/>
		        		<input type="hidden" class="likeon"/>
		        		<input type="hidden" class="otherLength"/>
		        		<input type="hidden" class="userId"/>
		        		<div class=" leftContent ">
		        			<div class="topLeft clearfix">
		        				<div class="top ">
			        				<div class="breadcrumb clearfix " style="">
										
										<div class="leftbtn ">
				        					<div class="input-group">
										      <button  class="input-group-addon addLike likebtns
										      " >
										      	<a href="javascript:;"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;&nbsp;like</a>
										      </button>
										      <div class="input-group-addon likeNumbtn"></div>
									      
										    </div>
				        				</div>
				        				<div class=" commentClick">
				        					<button class="btn btn-default commentBtn">Comment</button>
				        				</div>
				        				<div class="rightChoseBtn pull-right">
				        					<div class="  sendClick btn-group">
				        						<button class="btn btn-default sendBtn dropdown-toggle" data-toggle="dropdown">Send</button>
				        						<!-- <ul class="dropdown-menu sendDropdown closedropdown" role="menu">
												    <li><textarea class="addMessage" placeholder="Add a message?"></textarea></li>
												    <li>
														<div class="input-group input-group-lg">
														  <input type="text" class="form-control searchFriends" placeholder="Search">
														  <span class="input-group-addon"></span>
														</div>
												    </li>
												    <li class="friendsList">
												    	<ul>
												    		<li></li>
												    		<li></li>
												    		<li></li>
												    		<li></li>
												    		<li></li>
												    		<li></li>	
												    	</ul>
												    </li>
												   
												</ul> -->
					        				</div>
					        				<div class="  shareClick btn-group">
					        					<button class="shareBtn btn btn-default  dropdown-toggle" data-toggle="dropdown">Share</button>
					        					<ul class="dropdown-menu shareDropdown closedropdown" role="menu">
												    <li>
												    	<a id="shareToFacebook"
														   title="Share on Facebook" 
														   target="_blank" 
														   
														   href="javascript:"
												    	>Facebook</a>
												    </li>
												    <li>
														<a 
														href="javascript:"
														id="shareToTwitter"
														title="Share on Twitter" 
														class="share-tw" >
														twitter</a>
												    </li>
												    <li class="dropdownLast"></li>
												</ul>
					        				</div>
				        				</div>
									</div>
		        						
		        				</div>
			        			<div class="wall">
		        					<div class="showPic">

		        						 <img src="" alt="" class="detailImg">

		        					</div>
		        					<div class="smallPics">
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>

		        					</div>
		        					<div class="detailTags">
		        						
		        						
		        					</div>
		        					
			        			</div>

		        			</div>
		        			<div class="detailComments">
        						<div class="commentTop breadcrumb " style="">
									<div class="row " >
										<div class="titleInfo row col-xs-11">
				        					<div class="col-xs-2 postHead">
				        						<a href="javascript:;" class="personUrl">
				        							<img src="${localPath}/img/user-picture.png" alt="" class="head">
				        						</a>
				        					</div>
				        					<div class="col-xs-10 postTitles">
				        						<h4 class="postTitle"></h4>
				        					</div>
				        				</div>
				        				<div class="col-xs-2 pull-right editDescription">
				        					<button class="btn btn-default editBtn" data-toggle="modal" data-target="#editModel">Edit</button>

				        				</div>
									</div>
			        				
								</div>
								<div class="userComment hide userModel">
										<div class="row lineRow">
											<!-- <div class="col-xs-1 ">
												<img src="" alt="" class="head">
											</div> -->
											<div class="col-xs-12 rightComment">
												<span class="userName postUser"></span>&nbsp;&nbsp;&nbsp;
												<img src="/img/point.png" alt="">
												<span class="time"></span>
												<p class="comment">
													
												</p>

											</div>
										</div>
								</div>
								<div class="userComments">
									
									
								</div>
								<hr>
								<div class="userComment hide otherModel myComment">
										<div class="row">
											<div class="col-xs-1 ">
												<a href="javascript:;" class="commentUser">
													<img src="" alt="" class="head">
												</a>
											</div>
											<div class="col-xs-10 rightComment">
												<input type="hidden" class="commentId">
												<span class="userName linkUser"></span>&nbsp;&nbsp;&nbsp;
												<img src="/img/point.png" alt="">
												<span class="time"></span>
												<p class="comment">
													
												</p>
												<img src="/img/reply.png" alt="" class="operate">
											</div>
										</div>
									</div>
        						<div class="otherCommets">
        							
									
									
        						</div>
        						<div class="moreComment clearfix ">
        							<div class="userComment  ">
										<div class="row">
											<div class="col-xs-1 ">
												<a href="javascript:;" class="personUrl">
													<img src="${localPath}/img/user-picture.png" alt="" class="head">
												</a>
											</div>
											<div class="col-xs-10 rightComment">
												<div class="loginInfo">
													<span class="userName">UserName</span>&nbsp;&nbsp;&nbsp;
													<img src="/img/point.png" alt="" class="pointImg">
													<span class="time">That's you!</span>
												</div>
												<p class="comment">
													<textarea name="" id="" class="form-control postComment" rows="3" placeHolder="Add a comment......"></textarea>
												</p>
												
											</div>
										</div>
										<input type="hidden" class="replyId">
										<input type="hidden" class="replyName">
										<input type="hidden" class="link">
										<button class="mybtns btn btn-default  addComment">Comment</button>
									</div>
        						</div>

        					</div>
        					<div class="detailFoot">
        						<div class="row">
        							<div class="col-xs-6">
        								<div class="userComment userinfoRight">
											<div class="row">
												<div class="col-xs-2 addFrom">
													<a href="javascript:;" class="personUrl">
														
														<img src="${localPath}/img/user-picture.png" alt="" class="head">
													</a>
												</div>
												<div class="col-xs-5 games">
													<span class="attention">Added By</span><br>
													<div class="userName moreFlow toUser">
														UserName		
													</div>

												</div>
												<div class="col-xs-5 followButtonBox">
													<div class="userTag">
					        							<button type="button" class="mybtns btn btn-default loginFollow">That's you!</button>
					        						</div>
												</div>
											</div>
										</div>
        							</div>
        							<div class="col-xs-6 gameFrom" >
        								<div class="row gameinfoBox">
												<div class="col-xs-2 addFrom">
													<a href="javascript:;" class="gameUrl" target="_blank"><img src="" alt="" class="gamePic"></a>
												</div>
												<div class="col-xs-6 fromGameCon ">
													<span class="attention">From Game</span><br>
													<div class="userName moreFlow">
														Beyond Gravity		
													</div>

												</div>
												<div class="col-xs-4">
													<div class="userTag" id="userTag">
														<input type="hidden" name="" class="gameId">
					        							<button type="button" class="mybtns btn btn-default followOpe">Unfollow</button>
					        						</div>
												</div>
											</div>
        							</div>
        						</div>
        					</div>
		        		</div>
		        		<div class=" rightContent"  >
		        			<div class="tophead row">
		        				<div class="col-xs-3 headpar">
		        					<a href="javascript:;" class="personUrl">
		        						
		        						<img src="" alt="" class="head">
		        					</a>
		        				</div>
		        				<div class="col-xs-9 userName">
		        					
		        				</div>
		        				
		        			</div>
		        			<div class="moreImgs">

		        				

								<div id="one" class="number ">
										
								</div> 
								<div id="two" class="number "> 
									
								</div> 
								<div id="three" class="number "> 
									
								</div> 
		        			</div>
		        		</div>
		        	</div>
		        
		      </div>
			      
	     	</div>
	    </div>
	
	</div>
	
	<!-- Button trigger modal -->
	 <button class="btn btn-primary btn-lg cancelBtns" data-toggle="modal" data-target="#cancelModel" style="display:none">
	  Launch demo modal
	</button>

	<!-- Modal -->
	<div class="speModal modal fade layer_mask" id="cancelModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Delete Comment</h4>
	      </div>
	      <div class="modal-body">

	        Are you sure you want to permanently delete this comment?
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" class="commentId">
	        <button type="button" class="btn btn-default mybtns" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-default delComment mybtns focusBtn">Delete Comment</button>
	      </div>
	    </div>
	  </div>
	</div>
	 <button class="btn btn-primary btn-lg editBtns" data-toggle="modal" data-target="#editModel" style="display:none">
	  Launch demo modal
	</button>

	<!-- Modal -->
	<div class="speModal modal fade layer_mask" id="editModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Edit Post</h4>
	      </div>
	      <div class="modal-body">
			<form role="form" class="form-horizontal">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="description">Description</label>
			    <div class="col-sm-10">
			      <textarea  name="desc" id="description" class="form-control" cols="20" rows="5" placeholder="supplement the post description"></textarea>
			    </div>
			  </div>
			  <span class="postRequired">'text cannot be blank'!</span>
			</form>
	        
	      </div>
	       <div class="modal-footer clearfix">
	      	<input type="hidden" class="commentId">
	      	<button type="button" class="btn btn-default mybtns delPost" data-toggle="modal" data-target="#postDelete">Delete Post</button>
	        <button type="button" class="btn btn-default mybtns" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-default editDesc mybtns focusBtn">Save</button>
	      </div>
	    </div>
	  </div>
	</div>
	 <button class="btn btn-primary btn-lg errorBtn" data-toggle="modal" data-target="#errorModel" style="display:none">
	  Launch demo modal
	</button>
	<div class="speModal modal fade models layer_mask" id="errorModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Oops!</h4>
	      </div>
	      <div class="modal-body">
			<p class="warnContent">
				'text' cannot be blank.
			</p>
	       
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default  mybtns focusBtn" data-dismiss="modal">Okay</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- Button trigger modal -->


 
	

	<#include "dropdown.ftl"> 
    <script src="${localPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
    <script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
    <script src="${localPath}/js/kindeditor/kindeditor.js"></script>
	<script src="${localPath}/js/kindeditor/lang/en.js"></script>
    <script src="${localPath}/js/kindeditor/plugins/code/prettify.js"></script>
	<script  src="${localPath}/js/jquery.tagsinput.js"></script>
	<script src="${localPath}/js/jquery.form.js"></script>
    <script src="${localPath}/js/main.js"></script>
    <script src="${localPath}/js/ajaxfileupload.js"></script>
   	<script src="${localPath}/js/jquery.VMiddleImg.js"></script>

	<script type="text/javascript">
			var href = location.href;

			var address = "/";

			var modelId = $(".myPostId").val();

			var imgListSmall;
			$("#detailModel .modelId").val(modelId);
			
			if(window.history.pushState){

				var url = window.location.href;
				var state = {url:href};
				window.history.pushState(state,"0",url);

				
			}

			/*window.onpopstate = function(){
			 	
			 	window.location.href = "http://" + window.location.host + "/treeth/postHome";
			 	window.history.replaceState(state,"0",history.state.url);
	           $("#detailModel .detailClose").trigger("click");
	        }*/
	        function sortComment(comments){
					var sortComments = new Array(comments.length);

					for(var i= 4;i>-1;i--){
						sortComments[4-i] = comments[i];
					}	

					for(var i= comments.length-1;i>4;i--){
						sortComments[comments.length-1-i+5] =  comments[i];
					}	
					return sortComments;
				}
	        /******************进入页面后请求详情页的数据*************************/
			$.get("/post/detail",{id:modelId,lan:0},function(data){
				
				if(data.statusCode == 1 && data.messageCode == 14){
					window.location.href = "/";
				}
				$(".smallPicBox").css("display","none");
				var obj = data;
				obj = $(obj)[0];
				var id = obj.id;
				var userId = obj.userId;
				$("#detailModel .userId").val(userId);
				$("#detailModel .postTitle").html(obj.title);
				

				var like = obj.isOrNotLikeByCurrentUser;
				
				$("#detailModel .likeon").val(like);
				if(like == "0"){
					$("#detailModel .glyphicon-heart").css("color","red");
				}else{
					$("#detailModel .glyphicon-heart").css("color","#878787");
				}
				
				$(".likeNumbtn").html(obj.likeNum);
				var imgList = obj.imgList;
				imgListSmall = imgList;
				var type = obj.type;
				
				$(".title").html("Post by "+obj.userName+" from "+obj.gameInfo.gameName+"| Treeth");


				$(".wall .smallPic").each(function(){
					$(this).show();
					$(this).attr("src","");
				});
				if(type == "1"){

					$(".wall .showPic").find("iframe").remove();
					var elem = $("<iframe width='660' height='335' src='"+imgList+"' frameborder='0' allowfullscreen></iframe>");
					$(".wall .showPic").find("img").hide();
					$(".wall .smallPics").hide();
					$(".wall .showPic").append(elem);
				}else{
					$(".wall .showPic").find("img").show();
					$(".wall .smallPics").show();
					$(".wall .showPic").find("iframe").remove();
				}
				var compressImgList = obj.compressImgList;

		
				var share_url = "https://www.facebook.com/dialog/feed?app_id=335300939983221";
				share_url +="&u="+window.location.href;
				share_url += "&link="+window.location.href;
				if(compressImgList ==null || compressImgList == "" || compressImgList == undefined){
					share_url += "&picture="+imgList[0];
				}else{
					share_url += "&picture="+compressImgList[0];
				}
				share_url += "&caption="+obj.userName;
				share_url += "&name="+obj.title;
				share_url += "&description="+obj.content;
				share_url += "&redirect_uri=http://www.facebook.com/";

				$("#shareToFacebook").click(function(){
					window.open(share_url, 'newWindow', 'width=800, height=500','center');
					$.post(
						"/share",
						{postId:id},
						function(message){
							if(message.statusCode == 1 && message.messageCode == 1){
								
							}
						}
						);
				});

			    var twitter_url = "https://twitter.com/intent/tweet?";
				twitter_url +="text="+"See what "+obj.username+" "+ obj.lastName+" has discovered on Treeth.\n"+window.location.href+" @treeth_sevenga";
				
				
				$("#shareToTwitter").click(function(){
					window.open(twitter_url, "myWindow","status = 1, height = 300, width = 600, resizable = 0" );
					$.post(
						"/share",
						{postId:id},
						function(message){
							if(message.statusCode == 1 && message.messageCode == 1){
								
							}
						}
						);
				});
				
					
				if(compressImgList == "" || compressImgList == undefined || compressImgList == null){



					/*获取图片的尺寸 */
			        getImageSize({
			        	img:imgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":imgList[0]});
			        	}
			        }); 
					

					$(imgList).each(function(index){
						if(imgList.length>1)
						 getImageSize({
			                img:imgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                  indexImg = $(".wall .smallPic:eq("+index+")");
			                  

			                   indexImg.attr({"src":imgList[index],"width":objWidth,"height":objHeight});
			              	   indexImg.VMiddleImg();

			                   	if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									indexImg.parent().css("display","inline-block");
								}
								indexImg = null;
			                }
			            });
						
					});
				}else{
				
					 getImageSize({
			        	img:compressImgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":compressImgList[0],"width":objWidth,"height":objHeight});
			        	}
			        	}); 
					/*$.imgpreload(imgList[0],function(){
	                
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:imgList[0],
					        	oncomplete:function(){
					        		  var objWidth = this.width;
					                  var objHeight = this.height;
					        		$(".wall .detailImg").attr({"src":imgList[0],"width":objWidth,"height":objHeight});
					        	}
				        	});
		                    
		                }
	           		});*/
	           		var r;
	           		if(imgList[0].indexOf("/compress/") > -1){
						r = imgList[0].replace("/compress/","/original/");
					}else if(imgList[0].indexOf("/show/") > -1){
						r = imgList[0].replace("/show/","/original/");
					}else{
						r = imgList[0];
					}
	           		$.imgpreload(r,function(){
	                
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:r,
					        	oncomplete:function(){
					        		var objWidth = this.width;
					                var objHeight = this.height;
					                $(".wall .detailImg").attr({"width":"","height":""});
				                    if(objWidth <= 665){
				                  		$(".wall .detailImg").attr({"src":r,"width":objWidth,"height":objHeight});
				                   	}else{
				                  		$(".wall .detailImg").attr({"src":r});
				                   	}
					        	}
				        	});
		                    
		                }
	           		});
					$(compressImgList).each(function(index){
						if(compressImgList.length>1)
						 getImageSize({
			                img:compressImgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                   indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":compressImgList[index],"width":objWidth,"height":objHeight});
			             	   indexImg.VMiddleImg();


			                if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									
									indexImg.parent().css("display","inline-block");

							  }

							   indexImg = null;
			                   
			                }
			            });
					});
				}

				
				$(".wall .smallPic:eq(0)").css({"opacity":"1"});
				$(".wall .smallPicBox:eq(0)").css({"border":"1px solid #66afe9"});
				
				$(".userComments").html("");
				$("#detailModel .personUrl").attr("href","/" + obj.userId + "/");
				$(".detailComments .postHead img").attr("src",obj.userImg);
				var desc = obj.content;
				$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
					var elem = $(".userModel")
					.find(".time")
					.html(obj.date)
					.end()
					.find(".comment")
					.html(obj.content)
					.end()
					.clone()
					.addClass("aboutUser")
					.removeClass("userModel")
					.removeClass("hide");
					$(".userComments").append(elem);

				
				/*****************userComment********************/
				var appendCon = obj.appends;
				$(appendCon).each(function(){
					$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
					var elem = $(".userModel")
					.find(".time")
					.html(this.date)
					.end()
					.find(".comment")
					.html(this.content)
					.end()
					.clone()
					.addClass("aboutUser")
					.removeClass("userModel")
					.removeClass("hide");
					$(".userComments").append(elem);
				});
				$("#detailModel .aboutUser:gt(0)").find(".head").hide();
				//
				

				var otherComments =obj.comments;


				$("#detailModel .otherLength").val(otherComments.length);
				if(otherComments.length == 0){
					$("#detailModel .otherCommets").css("border","none");
				}

				/*****************页面下半部分所有人的评论************************/
				$("#detailModel .otherCommets").html("");
				$(otherComments).each(function(){
					
					$(".otherModel").find(".userName").html(this.name + " " + this.lastName);
					var elem = $(".otherModel")
					.find(".head")
					.attr("src",this.img)
					.end()
					.find(".commentId")
					.val(this.id)
					.end()
					.find(".time")
					.html(this.date)
					.end()
					.find(".comment")
					.html(this.say)
					.end()
					.clone()
					.removeClass("otherModel")
					.removeClass("hide");
					var loginId = $(".userInfo").val();
					$(elem).find(".commentUser").attr("href","/" + this.userId + "/");
					if(this.userId == loginId){
						elem.find(".operate").attr({"src":address + "img/delComment.png","data-toggle":"modal","title":"delete","data-target":"#cancelModel"}).addClass("cancelComment").removeClass("operate");
					}else{
						elem.find(".operate").attr({"src":address + "img/reply.png","title":"reply"});
					}
					/*var regexp = /@\w+\s+/gi;
					var s = elem.find(".comment").html();
					var r = "<span style='color:red'>" + s.match(regexp) + "</span>";
					elem.find(".comment").html(s.replace(regexp,r));*/
					$(".otherCommets").append(elem);
				});
				
				$(".myComment:gt(5)").addClass("hide");
				
				if(otherComments.length > 5){
					var btn = $('<div class="seeAll"><button class="remains btn btn-primary btn-sm ">See All Comments</button></div>')
					$(".otherCommets").append(btn);	
				}					
				
				$(".seeAll").toggle(
					function(){
						$(".otherCommets .myComment").removeClass("hide");
						$(this).find("button").html("Hide More");
					},
					function(){
						$(".otherCommets .myComment:gt(4)").addClass("hide");
						$(this).find("button").html("See All Comments");
					}
				);	
				$(".detailTags").html("");						
				$(obj.labels).each(function(){
					var tag = $('<div class="detailTag">'+this+'</div>');
					$(".detailTags").append(tag);
				});	
				$("#detailModel .gameId").val(obj.gameInfo.id);	
				var loginName = $(".loginName").val();
				var loginImg = $(".loginImg").val();
				if(loginName != "" && loginName != undefined){
					$(".moreComment .loginInfo").show();
					$("#detailModel .moreComment .comment").css("marginTop","8px");
					$(".moreComment .userName").html(loginName);
				}else{
					$(".moreComment .loginInfo").hide();
					$("#detailModel .moreComment .comment").css("marginTop","0px");
				}
				if(loginImg != "" && loginImg != undefined){
					$(".moreComment .head").attr("src",loginImg);
				}					
				/*******************详情页底部关于发帖人和游戏赋值**************************/
				$("#detailModel .gameUrl").attr("href","/game/" + obj.gameInfo.id +"/");
				$("#detailModel .detailFoot").find(".head").attr("src",obj.userImg).end().find(".userName").attr("title",obj.userName + " " + obj.lastName).html(obj.userName + " " + obj.lastName);
				$("#detailModel .gameFrom").find(".gamePic").attr("src",obj.gameInfo.icon).end().find(".userName").attr("title",obj.gameInfo.gameName).html(obj.gameInfo.gameName);
				
				if(obj.isOrNotFollowGameByCurrenUser == "0"){
					$("#detailModel .gameFrom").find(".btn").html("Unfollow");
				}else{
					$("#detailModel .gameFrom").find(".btn").html("Follow");
				}
				var loginId = $(".userInfo").val();
				if(obj.userId == loginId){
					$(".editDescription").show();
					$("#detailModel .detailFoot").find(".loginFollow").html("That's you!");
				}else{
					$(".editDescription").hide();
					if(obj.isOrNotFollowUserByCurrenUser == "0"){
						$("#detailModel .detailFoot").find(".loginFollow").html("Unfollow");
					}else{
						$("#detailModel .detailFoot").find(".loginFollow").html("Follow");
					}
					
				}
				var imgs = obj.coverImgs;
				
				$("#detailModel .tophead .head").attr("src",obj.userImg);
				$("#detailModel .tophead .userName").html(obj.userName + " " + obj.lastName);
				/**********************右侧显示其他帖子瀑布流*************************/
				var curIndex = 0;
				var pageIndex = 2;
				$(imgs).each(function(){
					var id = this.id;
					var src = this.coverImg;
					
					var cover;
					if(this.type == 1){
						cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
					}else{
						cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
					}
					
					
					
					$(".moreImgs .number:eq("+curIndex+")").append(cover);
					if(curIndex < 2){
						curIndex++;
					}else{
						curIndex = 0;
					}
				});
				var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
		        var nScrollTop = 0;   //滚动到的当前位置
		        var nDivHight = $(".moreImgs").height();
		        /*****************右侧当下拉到底部时请求数据**********************/
		       $(".moreImgs").scroll(function(){
		    	  
			          nScrollHight = $(this)[0].scrollHeight;
			          nScrollTop = $(this)[0].scrollTop;

			          if(nScrollTop + nDivHight >= nScrollHight){
			           	if(true) {
							
							$.get("/post/cover/list",{postId:modelId,userId:userId,pageNum:pageIndex,pageSize:20},function(data){
								
								var obj = data;
								$(obj).each(function(){
									var id = this.id;
									var src = this.coverImg;
									var cover;
									if(this.type == 1){
										cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
									}else{
										cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
									}
									
									$(".moreImgs .number:eq("+curIndex+")").append(cover);
									if(curIndex < 2){
										curIndex++;
									}else{
										curIndex = 0;
									}
								});
								pageIndex++;
							})
							 
						}
			          }
		          })

										
				
			});
            /****************************右侧点击一个图片时为左侧部分和自己赋值************************************/
			$(".cover").live("click",function(){
				var modelId = $(this).find(".modelId").val();
				var userId = $(this).find(".userId").val();
				$(".moreImgs #one").html("");
				$(".moreImgs #two").html("");
				$(".moreImgs #three").html("");
				pageIndex = 0;
				$("#detailModel .modelId").val(modelId);
				 
				 //var url = history.state.url+'/'+modelId + '/';
			     //var state = {content:"aaa",url:history.state.url};
				$(".smallPicBox").css("display","none");
				$.get("/post/detail",{id:modelId,lan:0},function(data){

					var loginName = $(".loginName").val();
					var loginImg = $(".loginImg").val();
					if(loginName != ""){
						$(".moreComment .userName").html(loginName);
					}
					if(loginImg != ""){
						$(".moreComment .head").attr("src",loginImg);
					}
					var obj = data;
					obj = $(obj)[0];
					var id = obj.id;
					
					$("#detailModel .postTitle").html(obj.title);
					var like = obj.isOrNotLikeByCurrentUser;
					
					$("#detailModel .likeon").val(like);
					if(like == "0"){
						$("#detailModel .glyphicon-heart").css("color","red");
					}else{
						$("#detailModel .glyphicon-heart").css("color","#878787");
					}
					


					$(".likeNumbtn").html(obj.likeNum);
					var imgList = obj.imgList;
					var type = obj.type;
					var compressImgList = obj.compressImgList;
					$(".wall .smallPic").each(function(){
						$(this).show();
						$(this).attr("src","");

					});
					if(type == "1"){
						$(".wall .showPic").find("iframe").remove();
						var elem =  $("<iframe width='660' height='335' src='"+imgList+"' frameborder='0' allowfullscreen></iframe>");
						$(".wall .showPic").find("img").hide();
						$(".wall .smallPics").hide();
						$(".wall .showPic").append(elem);
					}else{
						$(".wall .showPic").find("img").show();
						$(".wall .smallPics").show();
						$(".wall .showPic").find("iframe").remove();
					}
					$("#detailModel .personUrl").attr("href","/" + obj.userId + "/");
					
					$(".wall .smallPic:eq(0)").css({"opacity":"1"});
					$(".wall .smallPicBox:eq(0)").css({"border":"1px solid #66afe9"});
					if(compressImgList == "" || compressImgList == null || compressImgList == undefined){
						getImageSize({
			        	img:imgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":imgList[0]});
			        	}
			        }); 
					
					$(imgList).each(function(index){
						if(imgList.length>1)
						 getImageSize({
			                img:imgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                  indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":imgList[index],"width":objWidth,"height":objHeight});
			              	   indexImg.VMiddleImg();
								if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									indexImg.parent().css("display","inline-block");
								}
								indexImg = null;
			                }
			            });

					});
				}else{

					 getImageSize({
			        	img:compressImgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":compressImgList[0],"width":objWidth,"height":objHeight});
			        	}
			        	}); 
					
	           		var r;
	           		if(imgList[0].indexOf("/compress/") > -1){
						r = imgList[0].replace("/compress/","/original/");
					}else if(imgList[0].indexOf("/show/") > -1){
						r = imgList[0].replace("/show/","/original/");
					}else{
						r = imgList[0];
					}
	           		$.imgpreload(r,function(){
	               
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:r,
					        	oncomplete:function(){
					        		var objWidth = this.width;
					                var objHeight = this.height;
					                $(".wall .detailImg").attr({"width":"","height":""});
				                    if(objWidth <= 665){
				                  		$(".wall .detailImg").attr({"src":r,"width":objWidth,"height":objHeight});
				                   	}else{
				                  		$(".wall .detailImg").attr({"src":r});
				                   	}
					        	}
				        	});
		                    
		                }
	           		});
					$(compressImgList).each(function(index){
						if(compressImgList.length>1)
						 getImageSize({
			                img:compressImgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                   indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":compressImgList[index],"width":objWidth,"height":objHeight});
			             	   indexImg.VMiddleImg();


			                if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									
									indexImg.parent().css("display","inline-block");

							  }

							   indexImg = null;
			                   
			                }
			            });
					});
				}

					$(".userComments").html("");

					var desc = obj.content;

					$(".detailComments .postHead img").attr("src",obj.userImg);
					$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
						var elem = $(".userModel")
						.find(".time")
						.html(obj.date)
						.end()
						.find(".comment")
						.html(obj.content)
						.end()
						.clone()
						.addClass("aboutUser")
						.removeClass("userModel")
						.removeClass("hide");
						$(".userComments").append(elem);

					
					
					var appendCon = obj.appends;
					$(appendCon).each(function(){
						$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
						var elem = $(".userModel")
						.find(".time")
						.html(this.date)
						.end()
						.find(".comment")
						.html(this.content)
						.end()
						.clone()
						.addClass("aboutUser")
						.removeClass("userModel")
						.removeClass("hide");
						$(".userComments").append(elem);
					});
					var otherComments = obj.comments;

					$("#detailModel .otherLength").val(otherComments.length);
					if(otherComments.length == 0){
						$("#detailModel .otherCommets").css("border","none");
					}
					$("#detailModel .otherCommets").html("");
					$(otherComments).each(function(){
						
						$(".otherModel").find(".userName").html(this.name + " " + this.lastName);
						var elem = $(".otherModel")
						.find(".head")
						.attr("src",this.img)
						.end()
						.find(".commentId")
						.val(this.id)
						.end()
						.find(".time")
						.html(this.date)
						.end()
						.find(".comment")
						.html(this.say)
						.end()
						.clone()
						.removeClass("otherModel")
						.removeClass("hide");
						//var address = "http://" + window.location.host + "/treeth";
						$(elem).find(".commentUser").attr("href","/" + this.userId + "/");
						var loginId = $(".userInfo").val();
						if(this.userId == loginId){
							elem.find(".operate").attr({"src":address +"img/delComment.png","data-toggle":"modal","title":"delete","data-target":"#cancelModel"}).addClass("cancelComment").removeClass("operate");
						}else{
							elem.find(".operate").attr({"src":address + "img/reply.png","title":"reply"});
						}
						/*var regexp = /@\w+\s+/gi;
						var s = elem.find(".comment").html();
						var r = "<span style='color:red'>" + s.match(regexp) + "</span>";
						elem.find(".comment").html(s.replace(regexp,r));*/
						$(".otherCommets").append(elem);
					});
					$(".myComment:gt(5)").addClass("hide");
					
					if(otherComments.length > 5){
						var btn = $('<div class="seeAll"><button class="remains btn btn-primary btn-sm ">See All Comments</button></div>')
						$(".otherCommets").append(btn);	
					}					
					
					$(".seeAll").toggle(
						function(){
							$(".otherCommets .myComment").removeClass("hide");
							$(this).find("button").html("Hide More");
						},
						function(){
							$(".otherCommets .myComment:gt(4)").addClass("hide");
							$(this).find("button").html("See All Comments");
						}
					);	
					$(".detailTags").html("");						
					$(obj.labels).each(function(){
						var tag = $('<div class="detailTag">'+this+'</div>');
						$(".detailTags").append(tag);
					});							
					$("#detailModel .gameId").val(obj.gameInfo.id);
					$("#detailModel .gameUrl").attr("href","/game/" + obj.gameInfo.id +"/");
					
					
					
					$("#detailModel .detailFoot").find(".head").attr("src",obj.userImg).end().find(".userName").attr("title",obj.userName + " " + obj.lastName).html(obj.userName + " " + obj.lastName);
					$("#detailModel .gameFrom").find(".gamePic").attr("src",obj.gameInfo.icon).end().find(".userName").attr("title",obj.gameInfo.gameName).html(obj.gameInfo.gameName);

					if(obj.isOrNotFollowGameByCurrenUser == "0"){
						$("#detailModel .gameFrom").find(".btn").html("Unfollow");
					}else{
						$("#detailModel .gameFrom").find(".btn").html("Follow");
					}
					var loginId = $(".userInfo").val();
					if(obj.userId == loginId){
						$("#detailModel .detailFoot").find(".loginFollow").html("That's you!");
					}else{
						if(obj.isOrNotFollowUserByCurrenUser == "0"){
							$("#detailModel .detailFoot").find(".loginFollow").html("Unfollow");
						}else{
							$("#detailModel .detailFoot").find(".loginFollow").html("Follow");
						}
						
					}
					var imgs = obj.coverImgs;
					
					$("#detailModel .tophead .head").attr("src",obj.userImg);
					$("#detailModel .tophead .userName").html(obj.userName + " " + obj.lastName);
					var curIndex = 0;
					var pageIndex = 1;
					$(".moreImgs #one").html("");
					$(".moreImgs #two").html("");
					$(".moreImgs #three").html("");
					
					$(imgs).each(function(){
						var id = this.id;
						var src = this.coverImg;
						var cover;
						if(this.type == 1){
							cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
						}else{
							cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
						}
						
						
						$(".moreImgs .number:eq("+curIndex+")").append(cover);
						if(curIndex < 2){
							curIndex++;
						}else{
							curIndex = 0;
						}
					});
					var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
			        var nScrollTop = 0;   //滚动到的当前位置
			        var nDivHight = $(".moreImgs").height();
			       $(".moreImgs").scroll(function(){
			    	  
				          nScrollHight = $(this)[0].scrollHeight;
				          nScrollTop = $(this)[0].scrollTop;
				          if(nScrollTop + nDivHight >= nScrollHight){
				           	if(true) {
								
								$.get("/post/cover/list",{postId:modelId,userId:userId,pageNum:pageIndex,pageSize:20},function(data){
									
									var obj = data;
									$(obj).each(function(){
										var id = this.id;
										var src = this.coverImg;
										var cover;
										if(this.type == 1){
											cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
										}else{
											cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
										}
										$(".moreImgs .number:eq("+curIndex+")").append(cover);
										if(curIndex < 2){
											curIndex++;
										}else{
											curIndex = 0;
										}
									});
									pageIndex++;
								})
								 
							}
				          }
			          })
			         var url = "http://" + location.host + "/post/" + modelId + "/";
			       	 if(window.history.replaceState){
			         	window.history.replaceState(state,"0",url);
			       	 }else{
			       	 	window.location.href = url;
			       	 }
					 
											
					
				})
				
			});
			
			/*********************缩略图hover的时候清晰，其他缩略图模糊***********************************/
			$(".smallPic").hover(function(){
				var i = $(".smallPic").index(this);
				$(".smallPic").each(function(index){
					if(index != i){
						
						$(this).css({"opacity":"0.4"});
						$(this).closest(".smallPicBox").css({"border":"none"});
					}else{
						$(this).css({"opacity":"1"});
						$(this).closest(".smallPicBox").css({"border":"1px solid #66afe9"});
					}
				});
						var url=this.src;
						var urlCompress = url.split("/");
						var r;
						if(url.indexOf("/compress/") > -1){
							r = url.replace("/compress/","/original/");
						}else if(url.indexOf("/show/") > -1){
							r = url.replace("/show/","/original/");
						}else{
							r = url;
						}
						
						if(url.indexOf("/compress/") > -1){
							urlCompress[3] = "show";
							var showUrl = urlCompress.join("/");
							$(".wall .detailImg").attr("src",url);


							
							$.imgpreload(r,function(){
				                if($(this).data('loaded')){
				                	getImageSize({
							        	img:r,
							        	oncomplete:function(){
							        		var objWidth = this.width;
							                var objHeight = this.height;
							                $(".wall .detailImg").attr({"width":"","height":""});
						                    if(objWidth <= 665){
						                  		$(".wall .detailImg").attr({"src":r,"width":objWidth,"height":objHeight});
						                   	}else{
						                  		$(".wall .detailImg").attr({"src":r});
						                   	}
							        	}
						        	});
				                   
				                }
			           		});

						}else{
							$(".wall .detailImg").attr("src",url);
						}
			});
			
			
			
			$(".addLike").mouseenter(function(){
				var color = $(this).find(".glyphicon-heart").css("color");
				if(color != "red" && color != "rgb(255, 0, 0)"){
					$(this).find(".glyphicon-heart").css("color","#101010");
				}
				
			});
			$(".addLike").mouseleave(function(){
				var color = $(this).find(".glyphicon-heart").css("color");
				if(color != "red" && color != "rgb(255, 0, 0)"){
					$(this).find(".glyphicon-heart").css("color","#878787");
				}
				
			});

			/*******************点击like*************************/
			$(".addLike").click(function(){
				
				$(this).attr("disabled",true);
				var modelId = $("#detailModel .modelId").val();
				var userId = $("#detailModel .userId").val();
				var likeon = $("#detailModel .likeon").val();
				var t = this;
				
				$("#loginModel .postId").val(modelId);
				$("#loginModel .postUserId").val(userId);
				var flag = checkLogin();
				if(!flag){
					var loginId = $(".loginId").val();
					if(loginId != userId){
						
						if(likeon == "1"){
							$.get("/post/like/add",{userId:userId,postId:modelId},function(){
								$(t).find(".glyphicon-heart").css("color","red");
								var num = Number($(".likeNumbtn").html());
								$(".likeNumbtn").html(num + 1);
								$(".insee")
								.find(".likeImg")
								.attr("src",address + "img/like02.png")
								.end()
								.find(".likeNum")
								.html(num + 1);
								$("#detailModel .likeon").val("0");

								$(t).attr("disabled",false);
								
							});
							
						}else{
							$.get("/post/like/delete",{postId:modelId},function(){
								$(t).find(".glyphicon-heart").css("color","#000");
								var num = Number($(".likeNumbtn").html());
								$(".likeNumbtn").html(num - 1);
								$(".insee")
								.find(".likeImg")
								.attr("src",address + "img/like.png")
								.end()
								.find(".likeNum")
								.html(num - 1);
								$("#detailModel .likeon").val("1");
								$(t).attr("disabled",false);
							});
							
						}
					}else{
						alert("duplicate id");
					}
					
				}
				
			});
			
			
			$(".commentBtn").click(function(){

				$(".moreComment .postComment").focus();
			});
			/************************添加评论***********************/
			$(".addComment").click(function(){
				var val = $(".moreComment .postComment").val();
				var id = $("#detailModel .modelId").val();
				var userId = $("#detailModel .userId").val();
				var replyId = $(".moreComment .replyId").val();
				var replyName = $(".moreComment .replyName").val();
				var flag = checkLogin();
				if(!flag){
						if(val){
						var textarea = $(".moreComment .postComment");
						var fit = validateContent($(textarea),500);
						if(fit == "2"){
							$("#errorModel .warnContent").html("500 characters or fewer, please!");
							$(".errorBtn").trigger("click");
							return false;
						}
						var link = $(".moreComment .link").val();
						var regexp = /@\S+\s\S+\s/gi;
						var s = val;
						var r = "<a href='"+link+"' class='userLink'>" + s.match(regexp) + "</a>";
						
						val = s.replace(regexp,r)
						$.post("/post/comment/add",{puserId:userId,postId:id,originalLanguage:"0",description:val},function(data){
							
							if(data){
									$("#detailModel .otherCommets").html("");
									/*对评论重新排序*/
									var otherComments = data;

									$("#detailModel .otherLength").val(otherComments.length);
									
									$(otherComments).each(function(){
										
										$(".otherModel").find(".userName").html(this.name + " " + this.lastName);
										var elem = $(".otherModel")
										.find(".head")
										.attr("src",this.img)
										.end()
										.find(".commentId")
										.val(this.id)
										.end()
										.find(".time")
										.html(this.date)
										.end()
										.find(".comment")
										.html(this.say)
										.end()
										.clone()
										.removeClass("otherModel")
										.removeClass("hide");
										//var address = "http://" + window.location.host + "/treeth";
										var loginId = $(".userInfo").val();
										if(this.userId == loginId){
											elem.find(".operate").attr({"src":address + "img/delComment.png","title":"delete","data-toggle":"modal","data-target":"#cancelModel"}).addClass("cancelComment").removeClass("operate");
										}else{
											elem.find(".operate").attr({"src":address + "img/reply.png","title":"reply"});
										}

										/*var regexp = /@\w+\s+/gi;
										var s = elem.find(".comment").html();
										var r = "<span style='color:red'>" + s.match(regexp) + "</span>";
										elem.find(".comment").html(s.replace(regexp,r));*/

										$(".otherCommets").append(elem);
									});
									$(".myComment:gt(5)").addClass("hide");
									
									if(otherComments.length > 5){
										var btn = $('<div class="seeAll"><button class="remains btn btn-primary btn-sm ">See All Comments</button></div>')
										$(".otherCommets").append(btn);	
									}					
									$("#detailModel .otherCommets").css("border-bottom","1px solid #ccc");
									$(".seeAll").toggle(
										function(){
											$(".otherCommets .myComment").removeClass("hide");
											$(this).find("button").html("Hide More");
										},
										function(){
											$(".otherCommets .myComment:gt(4)").addClass("hide");
											$(this).find("button").html("See All Comments");
										}
									);
									$(".moreComment .postComment").val("");

								
							}
						})
					}else{
						$(".moreComment .postComment").removeClass("warnsuccess").addClass("warnerror");
						$("#errorModel .warnContent").html("'text' cannot be blank.");
						$(".errorBtn").trigger("click");
					}
				}
			
				
			});
			/****************************点击回复某人********************************/
			$(".operate").live("click",function(){
				var userName = $(this).parent().find(".userName").html();
				var id = $(this).parent().find(".commentId").val();
				var link = $(this).closest(".userComment").find(".commentUser").attr("href");
				$(".moreComment .link").val(link);
				$(".moreComment .replyId").val(id);
				$(".moreComment .replyId").val("@"+userName + " ");
				$(".moreComment .postComment").val("@"+userName + " ");
				moveEnd($(".moreComment .postComment")[0]);
				//$(".moreComment .postComment").focus();
				
			});
			/******************点击删除评论按钮触发删除模态框***************************/
			$(".cancelComment").live("click",function(){
				$("#detailModel .top,.detailTop").css("z-index","100");
				var par = $(this).parent();
				var commentId = par.find(".commentId").val();
				var modelId = $("#detailModel .modelId").val();
				$("#cancelModel .commentId").val(commentId);

			});
			/********************删除评论***********************************/
			$("#cancelModel .delComment").click(function(){
					var modelId = $("#detailModel .modelId").val();
					var commentId = $("#cancelModel .commentId").val();
				
					$("#cancelModel .close").trigger("click");
					$.get("/post/comment/delete",{postId:modelId,postCommentId:commentId,lan:"0"},function(data){
						if(data == "0"){
							$(".otherCommets .userComment").each(function(){
								var id = $(this).find(".commentId").val();
								if(id == commentId){
									$(this).remove();
									return;
								}
							});
							$("#cancelModel .close").trigger("click");
							if($(".otherCommets .userComment").length <= 0){
								$(".seeAll").remove();
								$("#detailModel .otherCommets").css("border","none");

							}
							
						}
					});
				});
			
			$(".editBtn").click(function(){
				var flag = checkLogin();
				if(!flag){
					$("#detailModel .top").css("z-index","100");
					/*$("#editModel textarea").val("");*/
					editor2.html("");
					$("#editModel .editDesc").attr("disabled",false);
				}else{
					return false;
				}
				
			});

		
			var windowH = $(window).width();
			/********************follow Game操作********************************/
			$(".followOpe").live("click",function(){
				var flag = checkLogin();
				if(!flag){
					var gameId = $("#detailModel .gameId").val();
					var val = $(this).html();
					var t = this;
					$(this).attr("disabled",true);
					if(val == "Unfollow"){
						$.get("/game/follow/delete",{gameId:gameId},function(data){
							if(data){
								$(t).html("Follow");
								$(t).attr("disabled",false);
							}
						})
					}else{
						$.get("/game/follow/add",{gameId:gameId},function(data){
							
							if(data == "0"){
								
								$(".followOpe").html("Unfollow");
								$(t).attr("disabled",false);
							}
						})
					}
				}
				
			});
			/******************输入desc的时候提示信息消失**************************/
			$("#description").on("input",function(event){
		
				var fit = validateContent(this,500);  

				if(fit == "2"){
					$("#description").removeClass("warnsuccess").addClass("warnerror");
					$("#editModel .postRequired").html("500 characters or fewer, please!").show();
					
					return false;
				}else if(fit == "0"){
					$("#description").removeClass("warnsuccess").addClass("warnerror");
					$("#editModel .postRequired").html("Required!").show();
		

					return false;
				}else{
					$("#description").removeClass("warnerror");
					$("#editModel .postRequired").hide();
				}               
			});
			
			
			$(".postComment").on("input",function(){
				var flag = checkLogin();
				if(!flag){
					var fit = validateContent(this,500);  
					if(fit == "2"){
						$(".postComment").addClass("warnerror");
						$("#errorModel .warnContent").html("500 characters or fewer, please!");
						$(".errorBtn").trigger("click");
						return false;
					}else if(fit == "1"){
						$(".postComment").removeClass("warnerror");
					}
				}           
			});
			function validateContent(elem,total){
				var len = $(elem).val().length;
				if(len == 0){
					return "0";
				}else if(len > 0 && len <= total){
					return "1";
				}else{
					return "2";
				}
			}

				/****************操作用户关注发帖用户**********************/
			$(".loginFollow").live("click",function(){
				var flag = checkLogin();
				if(!flag){
					var userId = $("#detailModel .userId").val();
					
					var val = $(this).html();
					var t = this;
					$(this).attr("disabled",true);
					if(val == "Unfollow"){
						$.post("/user/unfollow/",{friendId:userId},function(data){
							if(data.statusCode ==1 && data.messageCode == 1){
								$(t).html("Follow");
								$(t).attr("disabled",false);
							}
						},"json");
					}else{
						$.post("/user/follow/",{friendId:userId},function(data){
							if(data.statusCode ==1 && data.messageCode == 1){
								$(t).html("Unfollow");
								$(t).attr("disabled",false);
							}
						},"json");
					}
				}
			});
			function checkLogin(){
		
				var userId = $(".userInfo").val();
				if(userId == null || userId == undefined){
					$("#loginModel").show();
					return true;
				}
			}

			function getImageSize(cfg){
		        var img=document.createElement('img'),
		            callback=cfg.oncomplete;
		            img.src = typeof cfg.img == 'string'?cfg.img:cfg.img.src;
		            img.setAttribute('style','position:absolute;visibility:hidden;');
		            document.body.appendChild(img);
		            img.onload=img.onerror=img.onreadystatechange=function(){
		            if(img&&img.readyState&&img.readyState!='loaded'&&img.readyState!='complete')
		                return;
		            img.onload = img.onreadystatechange = img.onerror = null;
		            callback.call({"width":img.width,"height":img.height},null);
		            img.parentNode.removeChild(img);
		            img=null;
		        };
		    }
				 
			/*****************window下拉的时候头部显示和消失****************************/
			$(window).scroll(function(){
				var height = $("#detailModel .wall").height();
				var barH = $("#detailModel .top").height();
				var windowH = $(this).height();
				var scrollh = $(this).scrollTop();
				var fold = windowH + scrollh;
				
				$("#detailModel .top").css({"position":"fixed","top":"58px","width":"736px"});
				if(scrollh  > height + barH){
					
					$("#detailModel .top").hide();
				}else{
					$("#detailModel .top").show();
					if(scrollh == 0){
						$("#detailModel .top").css({"position":"relative","top":"0","width":"736px"});
					}
				}
			});
			/*****************点击game名称跳转到game详情页****************************/
			$(".gameFrom .userName").click(function(){
				$("#detailModel .gameUrl")[0].click();
			});

			$(".detailFoot .toUser").live("click",function(){
		    	$(this).closest(".detailFoot").find(".personUrl")[0].click();
		    });
			$(".linkUser").live("click",function(){
				$(this).closest(".userComment").find(".commentUser")[0].click();
			});
			
			$(".postUser").live("click",function(){
				$(".postHead .personUrl")[0].click();
			});

			$(".addModal").click(function(){
				
				$("#detailModel .top,.detailTop").css("z-index","100");
			});

	</script>
</body>
</html>