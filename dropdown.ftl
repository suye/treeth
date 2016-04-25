
 <!--右侧下拉条-->
 <div class="mydropDown">      
    <div class="userOption">
        <ul>
            <li class="ys">
                <P><a href="/<#if (Session["USER_LOGIN_DATA"].user)??>${Session["USER_LOGIN_DATA"].user.id}</#if>/">Your Profile & Posts</a></p>
                <p><a href="/user/update">Settings</a></P>
            </li>
            <li class="ff">
                <p><a href="/user/invite">Find Friends</a></P>
                <p><a href="/game/">Follow Games</a></P>
            </li>
            <li class="logout"><a href="javascript:">Log Out</a></li>
        </ul>
    </div>
 </div>

 <!--左侧下拉条-->
<div class="leftDropDown">

    <div class="leftOptions">
        <ul>
            <li><a href="/" class="off-rightOptions">Home Feed</a></li>
            <li><a href="/popular/" class="off-rightOptions">Popular</a></li>
            <li><a href="/video/" class="off-rightOptions">Videos</a></li>
            <li><a href="/game/" class="games arrowMore">Games </a></li>
            <li style="display:none"><a href="javascript:" class="interestTag arrowMore">Interest Tag </a></li>
            <li class="no-bottom" style="display:none"><a href="javascript:" class="language arrowMore">Language</a></li>
            <li class="aboutOptions off-rightOptions">
               <ul>
                    <li><a href="/about">About</a></li>
                    <li><a href="#contactModal" data-toggle="modal">Contact Us</a></li>

                    <li><a href="/PrivacyPolicy">Privacy Policy</a></li>
               </ul> 
            </li>
        </ul>
    </div>

    <div class="rightOptions">
        <ul style="margin-bottom:0px;">
            <li><a href="javascript:"></a></li>
            <li><a href="javascript:"></a></li>
            <li><a href="javascript:"></a></li>
            <li><a href="javascript:"></a></li>
            <li><a href="javascript:"></a></li>
            <li><a href="javascript:"></a></li>
           
            <!--<li><a href="javascript:"></a></li>-->
            <li class="more" style="margin-top:-10px; padding-top:8px;"><a href="/game/" class="ellipsis-more">More...</a></li>     
        </ul>
    </div>
  
</div>
<!--=====================展示contact us模块start===========================-->
<div class="speModal modal fade models layer_mask contactModals" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">Contact Us</h4>
          </div>
          <div class="modal-body">
            <div class="tell" data-toggle="modal" data-target="#generalModel">
                <a href="javascript:;"  class="general">General FeedBack</a><br>
                <p class="opeDesc">Tell us about your treeth experience</p>
            </div>
            <div class="moreProblem" data-toggle="modal" data-target="#problemModel">
                <a href="javascript:;" class="choseProblem">Something isn't Working</a><br>
                <p class="opeDesc">Let us know about a broken feature.</p>
            </div>
            
           
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default  mybtns " data-dismiss="modal">Cancel</button>
          </div>
        </div>
      </div>
    </div>
<!--=====================展示contact us模块end===========================-->

<!--=====================展示General FeedBack模块start===========================-->
<div class="speModal modal fade models layer_mask generalModels pubModel" id="generalModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">General FeedBack</h4>
          </div>
          <div class="modal-body">
            <div class="choseType">
                <p class="desc fontColor">
                    Let us know how we can improve your experience with Treeth.
                </p>
                <h4>Product</h4>
                <div class="choseOpe">
                        
                        <select name="" id="" class="form-control projectType">
                            <option value="0">Please Select</option>
                            <option value="1">Posts</option>
                            <option value="2">Games</option>
                            <!--<option value="3">Interest tags</option>-->
                            <option value="4">Home Feed</option>
                            <option value="5">Notifications</option>
                            <option value="6">Messages</option>
                            <option value="7">Profile</option>
                            <option value="8">Search</option>
                            <option value="9">Login/Sign up</option>
                            <option value="10">Comments</option>
                            <option value="11">Find Friends</option>
                            <option value="12">Share</option>
                           
                        </select>
                   
                </div>
            </div>
            <div class="say">
                <p class="fontColor">
                    Thanks for taking the time to give us feedback. We don't typically respond to feedback emails, but we're reviewing them.
                </p>
                <h4>Your feedback</h4>
                <textarea name="" id="" cols="25" rows="3" class="form-control generalDesc "></textarea>
                <p class="errorMessage" >Please give us your feedback.</p>
            </div>
            
           
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default mybtns generalSend" >Send</button>
          </div>
        </div>
      </div>
    </div>
<!--=====================展示General FeedBack模块end===========================-->

<!--=====================展示Report a problem模块start===========================-->
<div class="speModal modal fade models layer_mask problemModels pubModel" id="problemModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">Report a Problem</h4>
          </div>
          <div class="modal-body">
            <form  class="problemForm" method="post" enctype="multipart/form-data">
                <div class="choseType">
                    <p class="desc ">                   

                       Where is the problem?
                    </p>
                    
                    <div class="choseOpe">
                           
                            <select name="projectType" id="" class="form-control projectType">
                                <option value="0">Please Select</option>
                                <option value="1">Posts</option>
                                <option value="2">Games</option>
                                <!--<option value="3">Interest tags</option>-->
                                <option value="4">Home Feed</option>
                                <option value="5">Notifications</option>
                                <option value="6">Messages</option>
                                <option value="7">Profile</option>
                                <option value="8">Search</option>
                                <option value="9">Login/Sign up</option>
                                <option value="10">Comments</option>
                                <option value="11">Find Friends</option>
                                <option value="12">Share</option>
                               
                            </select>
                       
                    </div>
                </div>
                <div class="say">
                    <p class="">
                       What happened?
                    </p>
                   
                    <textarea name="problemDesc" id="" cols="30" rows="3" class="form-control problemDesc" placeholder="Briefly explain what happened and what steps we can take to reproduce the problem……"></textarea>
                </div>
                <p class="errorMessage">Please select a product.</p>
                <div class="upload">
                    <p>Upload Screenshot(s):</p>
                    <div class="row">
                        <div class="col-xs-3 imgBtn">
                            <div class="btn btn-default mybtns uploadBtn ">
                                Upload
                              <input class="problemUpload" id="problemUpload1" type="file" name="descPic" />
                              <input class="problemUpload" id="problemUpload2"type="file" name="descPic" />
                              <input class="problemUpload" id="problemUpload3" type="file" name="descPic" />
                            </div>
                        </div>
                        <div class="imgs col-xs-8 row" >
                            
                            
                            
                           
                        </div>
                    </div>

                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default  mybtns " data-dismiss="modal">Cancel</button>

            <button type="button" class="btn btn-default mybtns focusBtn problemSend" >Send</button>
          </div>
        </div>
      </div>
    </div>
<!--=====================展示Report a problem模块end===========================-->

 <button class="btn btn-primary btn-lg thanksBtn" data-toggle="modal" data-target="#thanksModel" style="display:none">
  Launch demo modal
</button>
<!--=====================Thanks模块start===========================-->
<div class="speModal modal fade models layer_mask thanksModels " id="thanksModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">Thanks!</h4>
          </div>
          <div class="modal-body">
            <p class="content">
                Thanks for your feedback.We aren't responding to each email we receive through this channel, but we may reach out to you for more  info  as we work on improving this experience.
            </p>
            
           
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default mybtns focusBtn" data-dismiss="modal">Okay</button>
          </div>
        </div>
      </div>
    </div>
<!--=====================Thanks模块end===========================-->

 <!--左侧下拉条-->
<div class=" searchLists searchMode">

    <div class="">
      
      <div class="games clearfix">
        <div class="breadcrumb" >
          <div class="row">
            <div class="col-xs-1">
              <img src="${localPath}/img/point.png" >
            </div>
            <div class="col-xs-1 searchType">
               Games
            </div>
          </div>
        </div>
        <div class="game row showList myList cloneModel">
           
            <div class="gameImg col-xs-1 showList">
              <a href="javascript:;" class="typeUrl"><img src="" class="head"></a>
            </div>
            <div class="title col-xs-10 showList">
              <a href="javascript:;" class="name typeUrl eclipse"></a>
            </div>
        </div>

        <div class="gameLists myList">
          
          



        </div>
      </div>
      <div class="posts clearfix">
        <div class="breadcrumb" >
          <div class="row">
            <div class="col-xs-1">
              <img src="${localPath}/img/point.png" >
            </div>
            <div class="col-xs-1 searchType">
               Posts
            </div>
          </div>
        </div>
        <div class="post row showList myList cloneModel">
            
          <div class="title col-xs-12 showList">
            <a href="javascript:;" class="typeUrl name eclipse"></a>
          </div>
        </div>
        <div class="postLists myList">
          
          


        </div>
      </div>

      

      <div class="users clearfix">
        <div class="breadcrumb" >
          <div class="row">
            <div class="col-xs-1">
              <img src="${localPath}/img/point.png" >
            </div>
            <div class="col-xs-1 searchType">
               Users
            </div>
          </div>
        </div>
        <div class="user row showList myList cloneModel">
          <div class="gameImg col-xs-1 showList">
            <a href="javascript:;" class="typeUrl"><img src="" class="head"></a>
          </div>
          <div class="title col-xs-10 showList">
            <a href="javascript:;" class="typeUrl name eclipse"></a>
          </div>
        </div>
        <div class="userList myList">
          

          



        </div>
      </div>

      <div class="allSearch clearfix">
        <div class="breadcrumb" >
          <div class="row">
            <div class="col-xs-1">
              <img src="${localPath}/img/point.png" >
            </div>
            <div class="col-xs-10 searchType">
               <a href="javascript:;" class="allResults">See All Results</a>
            </div>
          </div>
        </div>
        
        
      </div>

     


    </div>

   
  
</div>
 <!-- Modal -->
  <div class="speModal modal models fade layer_mask" id="postDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myModalLabel">Delete Post</h4>
        </div>
        <div class="modal-body">

          Are you sure you want to permanently delete this Post?
        </div>
         <div class="modal-footer clearfix">
            <button type="button" class="btn btn-default mybtns" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-default cancelPost mybtns focusBtn">Delete Post</button>
        </div>
      </div>
    </div>
  </div>