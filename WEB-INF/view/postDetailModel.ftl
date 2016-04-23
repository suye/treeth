	<div class="sessionInfo">
            <#if (Session["USER_LOGIN_DATA"].user)??>
				 <input type="hidden" name="" class="userInfo loginId" value='${Session["USER_LOGIN_DATA"].user.id}'>
				 <input type="hidden" name="" class="loginImg" value='${Session["USER_LOGIN_DATA"].user.pictureUrl}'>
				 <input type="hidden" name="" class="loginName" value='${Session["USER_LOGIN_DATA"].user.firstName}'>
            <#else>
           
            </#if>
         </div>	

    <div >
		<div class=" detailHeader" >
	        <button type="button" class="close " data-dismiss="detailModel" >
	        	<img src="${localPath}/img/closeBig.png"  class="closeBig">
	        	
	        </button>
	       
	     </div>
		<div class=" detailTop" >
			<div class="breadcrumb clearfix " style="">
				
				<div class="leftbtn ">
					<div class="input-group">
				      <button class="input-group-addon addLike likebtns mybtns
				      " >
				      	<a href="javascript:;"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;&nbsp;like</a>
				      </button>
				      <div class="input-group-addon likeNumbtn">15</div>
			      
				    </div>
				</div>
				<div class=" commentClick">
					<button class="mybtns btn btn-default commentBtn ">Comment</button>
				</div>
				<div class="rightChoseBtn pull-right">
					<div class="  sendClick">
						<button class="mybtns btn btn-default sendBtn ">Send</button>
    				</div>
    				<div class="  shareClick">
    					<button class="mybtns btn btn-default shareBtn ">Share</button>
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
			      <textarea name="" name="desc" id="description" class="form-control" cols="20" rows="5" placeholder="supplement the post description"></textarea>
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
 
 
    


	
