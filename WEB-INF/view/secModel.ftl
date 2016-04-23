<div class="speModal modal fade detailModels" id="detailModel" style="" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content modal-contents">
     	<div class="">
     		 <div class="modal-header " >
		        <button type="button" class="close detailClose" data-dismiss="modal" >
		        	<img src="${localPath}/img/closeBig.png"  class="closeBig">
		        	<!-- <span aria-hidden="true">&times;</span> -->
		        	<span class="sr-only ">Close</span>
		        </button>
		       
		      </div>
		      <div class="modal-body content ">
		        
		        	<div class=" mycontainer clearfix">
		        		<input type="hidden" class="modelId"/>
		        		<input type="hidden" class="likeon"/>
		        		<input type="hidden" class="otherLength"/>
		        		<input type="hidden" class="userId"/>
		        		<div class=" leftContent ">
		        			<div class="topLeft clearfix" >
		        				<#include "innerTop.ftl">
			        			<div class="wall">
		        					<div class="showPic">
		        						
		        						 <img src="" alt="" class="detailImg"  >
		        					</div>
		        					<div class="smallPics">
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>
		        						<div class="smallPicBox"><img src="" alt="" class="smallPic"></div>

		        					</div>
		        					<div class="detailTags"></div>
		        					
			        			</div>

		        			</div>
		        			<div class="detailComments">
        						<div class="commentTop breadcrumb " style="">
									<div class="row " >
										<div class="col-xs-8 row">
				        					<div class="col-xs-2 postHead">
				        						<a href="javascript:;" class="personUrl">
				        							<img src="${localPath}/img/user-picture.png" alt="" class="head">
				        						</a>
				        					</div>
				        					<div class="col-xs-9 postTitles">
				        						<h4 class="postTitle">Clash of clans is good!</h4>
				        					</div>
				        				</div>
				        				<div class="col-xs-2 pull-right editDescription">
				        					<button class="btn btn-default editBtn" data-toggle="modal" data-target="#editModel">Edit</button>

				        				</div>
									</div>
			        				
								</div>
								<div class="userComment hide userModel">
										<div class="row lineRow">
											<!-- <div class="col-md-1 ">
												<img src="" alt="" class="head">
											</div> -->
											<div class="col-md-12 rightComment">
												<span class="userName postUser"></span>&nbsp;&nbsp;&nbsp;
												<img src="${localPath}/img/point.png" alt="">
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
											<div class="col-md-1 ">
												<a href="javascript:;" class="commentUser">
												
													<img src="" alt="" class="head">
												</a>
											</div>
											<div class="col-md-10 rightComment">
												<input type="hidden" class="commentId">
												<span class="userName linkUser">UserName</span>&nbsp;&nbsp;&nbsp;
												<img src="${localPath}/img/point.png" alt="">
												<span class="time">8 hours ago</span>
												<p class="comment">
													I never meant for this to happen, but I kinda saw Clash of Clans and got it for my brother, and then I knida FELL IN LOVE w/ the game.
												</p>
												<img src="${localPath}/img/reply.png" alt="" class="operate">
											</div>
										</div>
									</div>

								<a href="#localComment" id="localComment" style="display:none"></a>
        						<div class="otherCommets">
        							
									
									
        						</div>
        						<div class="moreComment clearfix ">
        							<div class="userComment  ">
										<div class="row">
											<div class="col-md-1 ">
												<a href="javascript:;" class="personUrl">
													<img src="${localPath}/img/user-picture.png" alt="" class="head">
												</a>
											</div>
											<div class="col-md-10 rightComment">
												<div class="loginInfo">
													<span class="userName">UserName</span>&nbsp;&nbsp;&nbsp;
													<img src="${localPath}/img/point.png" alt="">
													<span class="time">That's you!</span>
												</div>
												<p class="comment">
													<textarea name="" id=""  class="form-control postComment" rows="3" placeHolder="Add a comment....."></textarea>
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
													<div class="userName moreFlow toGame">
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
										<img src="${localPath}/img/user-picture.png" alt="" class="head">
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
		      <div class="modal-footer">
		       
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
 <button class="btn btn-primary btn-lg errorBtn" data-toggle="modal" data-target="#errorModel" style="display:none">
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
		 
		</form>
        <span class="postRequired">'text cannot be blank'!</span>
      </div>
      <div class="modal-footer">
      	<input type="hidden" class="commentId">
        <button type="button" class="btn btn-default mybtns" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-default editDesc mybtns focusBtn">Save</button>
      </div>
    </div>
  </div>
</div>
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