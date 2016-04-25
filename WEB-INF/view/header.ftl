
<div class="topNav" role="navigation">
        <li class="emptyNotice emptyModel">
           
              <img src="${localPath}/img/emptyNotice.png" class="logoImg">
             
              <p class="content">
                You don't have any notifications.
              </p>

           
        </li>
        <li class="emptyMessage emptyModel">
           
            <h1>Photo</h1>   
            <p class="line1">
              Send messages to your friends!
            </p>
            <p class="line2">
              Plan projects,swap ideas and share your
            </p>
            <p class="line3">
                best discoveries.
            </p>

           
        </li>
         <div class="input-group search-head">
                <div class="input-group-addon moreSpan" id="moreOptions"><span class="glyphicon glyphicon-th-list moreSpan" id="moreSpan"></span></div>
                <input class="form-control search" type="search" placeholder="Search">
         </div>

            <a href="/"  class="logo"><img src="${localPath}/img/logo.png"></a>

      
          <div class="btn-group rightSide hasLogin">
            <#if (Session["USER_LOGIN_DATA"].user)??>
               <input type="hidden" name="" class="userInfo " value='${Session["USER_LOGIN_DATA"].user.id}'>
              
                                </span> <a href="#myModal" role="button" class="btn btn-default addModal" data-toggle="modal" data-target="#myModal" id="addpost">
                            </a><img src="${localPath}/img/split.png" class="split" />

                <div  class=" btn btn-default dropdown messagePart" id="privateletter">
                  <a href="javascript:;" class="dropdown-toggle startMenu" data-toggle="dropdown" style=""></a>
                  <li class="messageInfo newsModel">

                      <input type="hidden"  class="messageId">
                      <input type="hidden"  class="userId">
                      <input type="hidden"  class="status">
                     
                        <div class="row lineRow showDialogs" data-toggle="modal" data-target="#messageModel">
                          <div class="col-md-2 friendHead">
                            <a href="javascript:;" class="personUrl"><img src="${localPath}/img/2.png" class="friendImg"></a>
                          </div>
                          <div class="col-md-10 friendSay">
                            <p class="friendName messageBottom">UserName</p>
                            <p class="sayToMe messageBottom">I like what you write 1234688</p>
                            <p class="time messageBottom">Just now</p>
                          </div>
                        </div>
                     
                    </li>
                  <ul class="dropdown-menu messageList closedropdown" role="menu">
                    
                    
                  </ul>

                </div><img src="${localPath}/img/split.png" class="split" />
                <div  class="advicePart mybtns btn btn-default dropdown " id="sysMessage">
                  <a href="#" class="dropdown-toggle startMenu" data-toggle="dropdown" style=""></a>
                    <li class="messageInfo adviceMode">
                    
                      <input type="hidden"  class="adviceId">
                      <input type="hidden"  class="userId">
                      <input type="hidden"  class="postId">
                      <input type="hidden"  class="type">
                      <input type="hidden"  class="status">
  
                        <div class="row lineRow">
                          <div class="col-md-2 friendHead">
                            <a href="javascript:;" class="personUrl" >
                              <img src="${localPath}/img/2.png" class="friendImg">
                            </a>
                          </div>
                          <div class="col-md-8 friendSay">
                            <p class="sayToMe messageBottom">I like what you write 1234688</p>
                            <p class="time messageBottom">Just now</p>
                          </div>
                          <div class="col-md-2 postHead">
                            <a href="javascript:;" class="postUrl" ><img src="${localPath}/img/2.png" class="postImg"></a>
                          </div>
                        </div>
                    
                    </li>

                  <ul class="dropdown-menu messageList closedropdown" role="menu">
                    
                    
                  
                    
                  </ul>

                </div><img src="${localPath}/img/split.png" class="split" />

               

                <button type="button" class="mybtns btn btn-default userDropdowm">
                    <p class="usrname" title='<#if (Session["USER_LOGIN_DATA"].user)??>${Session["USER_LOGIN_DATA"].user.firstName} ${Session["USER_LOGIN_DATA"].user.lastName}</#if>'>
                    <#if (Session["USER_LOGIN_DATA"].user)??>${Session["USER_LOGIN_DATA"].user.firstName} ${Session["USER_LOGIN_DATA"].user.lastName}</#if></p>
                    <img class="facebox"src='<#if (Session["USER_LOGIN_DATA"].user)??>${Session["USER_LOGIN_DATA"].user.pictureUrl}</#if>' style="width:30px;height:30px; border-radius:50%;"/> 
                </button>
            </#if>
          </div>
   
         <div class="rightSide">


            <#if (Session["USER_LOGIN_DATA"].user)??>
                
            <#else>
            <a href="/register" role="button" class="btn btn-default "  id="signup">
                <span >Sign up</span>
            </a>
            <a href="javascript:" role="button" class="btn btn-default "  id="signin">
                <span >Log in</span>
            </a>
            </#if>
         </div>
        


</div>



        <div class="container emailSuccess" style="z-index:10000;">
            <p><img src="/img/fb-icon.png"></p>
            <p>Thanks!You should receive a confirmation email soon.</p>
        </div>


  <#if userActivateResultCode??>
        
        <div class="container verifySuccess "  style="z-index:10000; <#if userActivateResultCode == 1> display:block;</#if>">

            <p><img src="/img/fb-icon.png"></p>
            <p>Thanks!Your email has been confirmed.happy posting!</p>

        </div>
        
  </#if>
  <div class="center-layermask">
       <div class="upDataEmail">
           <form role="form">
                <ul>
                    <li class="q">
                        <p class="l">Update Email <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></p>
                    </li>
                    <li class="center-form"><p>your current email address is <span><#if (Session["USER_LOGIN_DATA"].user)??>${Session["USER_LOGIN_DATA"].user.username}</#if></span></p></li>
                    <li class="center-form"><label class="radio-inline"><span>New Email Address</span></label>
                       <div class="form-group">
                         <input type="Email" class="form-control input Email"  name="email" placeholder="Add Email" id="updateinput">
                       </div>

                    </li>
                    <li class="bottom-form">
                        <p class="errorSpan"></p><button type="button" class="btn btn-default" id="update">Update</button><button type="button" class="btn btn-default" id="cancel">Cancel</button>
                        
                    </li>
                </ul>
           </form>
       </div>
</div>
<div class="layer_mask oops_layer">
<div class="oops">
    <ul>
        <li class="OopsHead"><span>Oops!</span> <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></li>
        <li id="describe"></li>
        <li class="OopsFooter"><button type="button" class="mybtns btn btn-default btn-sm" id="ok">Okay</button></li>
    </ul>
</div>
</div>
<div class="layer_mask logout_layer">
<div class="oops">
    <ul>
        
        <li id="describe_logout">Are you sure you want to log out?</li>
        <li class="OopsFooter"><button type="button" class="mybtns btn btn-default btn-sm" id="cancel_logout">Cancel</button><button type="button" class="mybtns btn btn-default btn-sm" id="ok_logout">Okay</button></li>
    </ul>
</div>
</div>
<button class="btn btn-primary btn-lg loginBtn" data-toggle="modal" data-target="#loginModel" style="display:none">
      Launch demo modal
    </button>
<!--登陆模块-->
<div class="layer_mask" id="loginModel">
 <input type="hidden" name="" class="postId">
 <input type="hidden" name="" class="postUserId">
    <div class="login_now">
        <ul class="login">
            <li class="q">
                <p class="l">Log In to Treeth <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></p>
            </li>
            <li class="ftg">
                <ul class="list-inline">
                    <li><a href="/login/facebook" id="facebook"><img src="${localPath}/img/log-in-facebook01.png"></a></li>
                    <li class="center-li"><a href="/login/twitter" id="twitter"><img src="${localPath}/img/log-in-twitter01.png"></a></li>
                    <li><a href="/login/googleplus" id="google"><img src="${localPath}/img/log-in-google_plus01.png"></a></li>
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
                        <label class="password_login" for="InputPassword">Password</label>
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
<input type="hidden" calss="contextPath" value="${rc.contextPath}"/>




<!--=====================添加帖子模块start===========================-->
<div class="speModal modal fade postModal layer_mask" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modalTitle modal-title" id="myModalLabel" >Add Post</h4>
          </div>
          <div class="modal-body " id="infomodal">
        <form class="form-horizontal infos uploadForm" role="form" method="post" enctype="multipart/form-data" action="/post/add">
        <input type="hidden" name="postType" class="postType">
        <input type="hidden" name="originalLanguage" value="0">
          <#if (Request["springMVC.token"])??>
         <input type="hidden" name="springMVC.token" class="token" value='${Request["springMVC.token"]}'>
            <#else>
           
            </#if>
        <div class="uploadImgs clearfix upload" >
            <div class="back"></div>
            <!-- <div class="hasupImg fistImg span1">
                <img src="img/2.png" alt="" class="upImg">
                <img src="img/cancel.png" alt="" class="cancel">
                
            </div>-->
             
            
            <div class="mofileContainer" >
                
                <input type="file" name="doc_0" class="files firstFile">
                <input type="file" name="doc_1" class="files">  
                <input type="file" name="doc_2" class="files">  
                <input type="file" name="doc_3" class="files">  
                
                            
            </div> 
        </div>
        <div class="videoInfo">
            <div class="back"></div>
            <div class="form-group">
                <label class="control-label col-sm-2 " for="title">Video</label>
                <div class="col-sm-10 myurl">
                  <input type="url" name="videoUrl"  placeholder="http://" class="form-control urls">
                </div>

              </div>
             <div class="row uploadWarn ">
                <div class="col-xs-12 urldesc">Video:Only support YouTube video sharing</div> 
                <div class="col-xs-12 mustRequire">image or video is required</div> 
             </div>
        </div>
      <div class="upload clearfix uploadChose">
            
            <div class="row">
                <div class="uploadImg  ">
                  
                    <div class="fileInputContainer">
                        <input class="fileInput" type="file" name="doc_4" id="fileInput" />
                        
                    </div>
                            
                </div>
             
                <div class="uploadVideo ">
                    <div class="upvideo"></div>
                </div>
            </div>
            <div class="row uploadWarn">
                <div class="col-xs-6 imgurl">Image:Single upload supports to 5</div>
                <div class="col-xs-6 imgurl">Video:Only support YouTube video sharing</div> 
                <div class="col-xs-6 mustRequire">image or video is required</div>
            </div>
         </div> 
        
        <div class="info">
              

              <div class="form-group">
                <label class="col-xs-2 control-label " for="title">Title</label>
                <div class="col-xs-10 ">
                  <input type="text" id="title" name="title" class=" form-control" placeholder="Title of the post">
                  <span class="requireTitle">Required!</span>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-xs-2" for="desc">Description</label>
                <div class="col-xs-10">

                  <textarea  name="description" id="desc" class=" form-control" cols="20" rows="5" placeholder="What's your post about?"></textarea>
                  <span class="requireDesc">Required!</span>

                 

                </div>
              </div>
              <div class="form-group ">
                <label class="control-label col-xs-2" for="inputPassword">InterestTag</label>
                
                <div class="col-xs-10">
                    <input id="tags_1" name="label" type="text" class=" tags form-control" value="" />
                </div>
              </div>
              <span class=""></span>
              <div class="form-group">
                <label class="control-label col-xs-2" for="game">Game</label>
               
                 <!--  <input type="text" id="game" class="searchGame search" placeholder="name of the game"> -->
                 <div class=" col-xs-10">
                    <!-- <div class="gover_search_form">
                        
                        <input type="text" name="gameName" class="input_search_key search form-control" id="gover_search_key" placeholder="请输入关键词直接搜索" />
                        <img src="img/4.jpg" alt="" class="gameimg">
                        <div class="search_suggest" id="gov_search_suggest">
                            <ul>
                            </ul>
                        </div>
                    </div> -->
                    <div  class="searchGame"> 
                        <input type="text"  name="gameName" class=" search-text  form-control"  placeholder="Name of the game"/> 
                        <img src="${localPath}/img/user-picture.png" alt="" class="gameimg">
                        <span class="requireGame">Required!</span>
                    </div>
                </div>
                
              </div>
              


            
        </div>
        </form>
      </div>
          <div class="modal-footer">
            <button type="button" class="mybtns btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="button" class="mybtns btn btn-default uploadBtn">Upload</button>

          </div>
        </div>
      </div>
    </div>
<!--=====================添加帖子模块end===========================-->

<!--=====================展示私信模块start===========================-->
<div class="speModal modal fade messageModels" id="messageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <input type="hidden" class="sendId">
        
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myModalLabel">
          <span class="showTitle">Send Message</span>
          
          <span class="personName">UserName</span>
          </h4>

        </div>
        <div class="row msgPart sayModel" >
            <input type="hidden"  class="messageId">
            <input type="hidden"  class="fromUserId">
            <div class="col-md-2 headPart" >
              <img src="" class="head" >
            </div>
            <div class="col-md-10 say clearfix" >
              <div class="arrows"></div>
              <div class="popover right " style="display:block">
                <div class="arrow" ></div>
                
                <div class="popover-content">
                  <p class="sayToMe"></p>
                </div>
              </div>
            </div>
          </div>
        <div class="modal-body showMessages ">
         
         
        </div>
        <div class="modal-footer">
          <div class="form-group row messageContent">
            <div class="col-sm-12">
              <textarea   class="form-control news" cols="20"  placeholder="Write down what you want to say."></textarea>
            </div>
          </div>
          <hr>
          <button type="button" class="btn btn-default  mybtns focusBtn sendNews" >Send Message</button>
        </div>
      </div>
    </div>
  </div>
<!--=====================展示私信模块end===========================-->

<!--=====================info===========================-->
<div class="sessionInfo">
    <#if (Session["USER_LOGIN_DATA"].user)??>
 <input type="hidden" name="" class="userInfo loginId" value='${Session["USER_LOGIN_DATA"].user.id}'>
 <input type="hidden" name="" class="loginImg" value='${Session["USER_LOGIN_DATA"].user.pictureUrl}'>
 <input type="hidden" name="" class="loginName" value='${Session["USER_LOGIN_DATA"].user.firstName} ${Session["USER_LOGIN_DATA"].user.lastName}'>
    <#else>
   
    </#if>
 </div> 
<!--=====================info===========================-->

