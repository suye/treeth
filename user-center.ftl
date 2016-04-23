<!DOCTYPE html>
<html>
<head>


    <#assign localPath=""/>


    <title>userHome</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        
    </style>
    <link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/>

    <link href="${localPath}/css/docs.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://fineui.com/lib/html5shim/html5.js"></script>
    <![endif]-->
    <link href="${localPath}/css/style.css" rel="stylesheet">
    <style>
        #masonry .thumbnail .myauthor .headImg button{
            padding: 2px;
        }
        .showNow{
            background-color: rgb(237,240,254);
             
            color: #101010!important;
            background-image: url(${localPath}/img/showNow.png)!important;
            background-position: top;
            background-repeat: repeat-x;

        }
        .addpostDiv{
            
            position: absolute;
            width: 236px;
            height: 140px;
            float: left;
            left: 0;
            top: 0;
            border: 2px dashed #c3c3c3 !important;
            background: none;

        }
        .addpostDiv .addDiv{
            width: 100%;
            height: 100%;
            text-align: center;
            padding-top: 20px;
            display: block;
            text-decoration: none;
            outline: none;
        }
        .addpostDiv .addDiv p{
            margin-top:10px;
            color: #101010;
            font-size: 16px;
            font-weight: bold;
            
        }
        #masonry .thumbnail .myauthor{
                 padding:4px 8px 4px 8px;
        }
        .myauthor .centerLikeButton{
                    padding: 0 2px 0 2px;
        }
        .myauthor .centerLikeButton button{
            width: 34px;
            height: 34px;
            text-align: center;
            padding: 2px;
        }
        #masonry{
            min-height: 0px;
        }
        .usrbuttonbox button:focus{
            background-repeat: repeat-x;
        }
        .topNavContainer{
            margin-top: 83px;
        }
    </style>
    <#include "GA.ftl"/>
</head>
<body class="mybody userCenter">
    <#include "header.ftl"/>
     <img src="${localPath}/img/iconFoot.gif" alt=""  class="initload">
<div class='topNavContainer'>
    <div class="usrlargebox"> 

     <div class="usrsmallbox">
        <div class="facebox"><img class="usrface" src=""/></div>
        <div class="usroperatebox">
            <span class="uname"></span>

            <button class="operate2 mybtns  sendOwnMessage" data-toggle="modal" data-target="#messageModel">Send Message</button>
            <button class="operate1 mybtns btn btn-default loginFollow"></button>

            <input type="hidden" class="currentUser" value='<#if (Session["USER_LOGIN_DATA"].user)??>${Session["USER_LOGIN_DATA"].user.id}</#if>'/>
        </div>
     </div>
    <!-- <div class="usrbuttonbox row">
       <div class="col-md-3">
            <button type="button" class="mybtns btn btn-default">Likes.<span>300</span></button>
       </div>
        <div class="col-md-3">
           <button type="button" class="mybtns mybtns btn btn-default">Followers.<span>56</span></button>
       </div>
        <div class="col-md-3">
            <button type="button" class="mybtns btn btn-default">Followings.<span>59</span></button>
       </div>  
    </div> -->
            <div class=" row usrbuttonbox">
                <div class="col-xs-3">
                    
                    <button type="button" class="mybtns btn btn-default showNow" id="usrpost">Posts·<span></span></button>
               </div>
               <div class="col-xs-3">
               
                    <button type="button" class="mybtns btn btn-default" id="usrlike" >Likes·<span></span></button>
               </div>
                <div class="col-xs-3">
                  
                   <button type="button" class="mybtns mybtns btn btn-default" id="usrfollower" >Followers·<span></span></button>
               </div>
                <div class="col-xs-3">
                    <button type="button" class="mybtns btn btn-default" id="usrfollowing" >Followings·<span></span></button>
               </div>        
           </div>
    </div>
   
    <div class="btn-group container-fluid gameUserBox">
        <button type="button" class="mybtns mybtns btn btn-default" id="followGames">
            Games.<span></span>
        </button>
        <button  type="button" class="mybtns mybtns btn btn-default" id="followUsers">
            Users.<span></span>
        </button>
    </div>
    



   <#include "outerTop.ftl">
    


    <input type="hidden" value="" class="currentPost">
    <input type="hidden" value="" class="currentUser">
    <input type="hidden" value="0" class="person">
    <div id="masonry" class="">

          
     </div>
 <div class="noContentDiv"></div>

    <!--================================================================================
                                        Post模板
    ====================================================================================-->
        <div id="masonry_ghost" class="hide">

         <div class="thumbnail mymode">
                <input type="hidden"  class="modelId" value="aaa"/>
                <input type="hidden"  class="userId" value=""/>
                <input type="hidden"  class="personsName" value=""/>
                <input type="hidden"  class="width" value=""/>
                <input type="hidden"  class="height" value=""/>
                <!-- <img src="/img/down.png" alt="" class="updown" />  -->
                <div class="myauthor row">
                   
                </div>
                <div class="imgs">
                    <input type="hidden" value="" class="showimg"/>
                    <img src="${localPath}/img/play.png" alt="" class="plays"/>
                    <div class="showAllImg">Expand Post</div>
                </div>
                <div class="caption">
                    <div class="upContent">
                        <div class="title"></div>
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
          


         <div class="thumbnail Gamemode">
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
                            <button type="button" class="mybtns btn btn-default loginFollow followStatus">Unfollow</button>
                        </div>
                    </div>
                </div>
            </div>  
        </div>


    

</div>    
           
        
    
  
    




    

<#include "secModel.ftl"/>
<#include "dropdown.ftl"/>
<#include "loadFoot.ftl"/>


<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/kindeditor/kindeditor.js"></script>
<script src="${localPath}/js/kindeditor/lang/en.js"></script>
<script src="${localPath}/js/kindeditor/plugins/code/prettify.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/imagesloaded.pkgd.min.js"></script>
<script src="${localPath}/js/masonry.pkgd.js"></script>

<script src="${localPath}/js/jquery.tagsinput.js"></script>
<script src="${localPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
<script src="${localPath}/js/jquery.VMiddleImg.js"></script>
<script src="${localPath}/js/project.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
   

        $(document).ready(function(){ 



            var address = "/";

            var pageNum = 1;
            var pageLikeNum = 1;
            var pageFollowerNum = 1;
            var pageGameNum = 1;
            var pageUserNum = 1;
            
            var totalWidth = 0;
            var imagesGameLoading = false;
            var imagesUserLoading = false;
            var thumLengthGameFlag = false;
            var thumLengthUserFlag = false;
            var thumLengthFollowFlag = false;
            var imagesUserLoading = false;
            var column1 = 0;
            var column2 = 250;
            var column3 = 500;
            var column4 = 750;
            var column5 = 1000;
            var column6 = 1250;
            var column7 = 1500;
            var gameMasNode = $("#masonry");
            var editButton = '<div class="col-xs-12 headImg"><button class="mybtns btn btn-default editBtn getPostId" data-toggle="modal" data-target="#editModel"><img src="'+address+'img/edit-icon-01.png" alt="Edit Post" class=""/></button></div>';
            var likeButton = '<div class="col-xs-2 headImg"><a href="javascript:;" class="personUrl"><img src="" alt="" class="user"/></a></div><div class="col-xs-8 userName postUser"></div><div class="col-xs-2 centerLikeButton"><button class="mybtns btn btn-default editBtn user-center-like"  ><img src="'+address+'img/like-icon-03.png" alt="undo"/></button></div>';
            var userId = window.location.href.split("/")[3];
            var currentUser = $(".currentUser").val();
            var requestMethod  = "post";
            $(".user-center-like").live("click",function(){
               
                $(this).toggle(function(){
                     $(this).find("img").attr("src",address+"img/like-icon-01.png");
                      $(this).parents(".imgModal").find(".like").trigger("click");
                },function(){
                     $(this).find("img").attr("src",address+"img/like-icon-03.png");
                      $(this).parents(".imgModal").find(".like").trigger("click");
                });
                
                $(this).trigger("click");
            });
            $(".getPostId").live("click",function(){
                   var currentPostId =  $(this).closest(".thumbnail").find(".modelId").val();
                   var userId = $(this).closest(".thumbnail").find(".userId").val();
                   $(".currentPost").val(currentPostId);
                   $(".currentUser").val(userId);
            });
           

            if(currentUser == userId){
                    $(".operate1")
                    .html('Find Friends')
                    .removeClass("loginFollow")
                    .css({"background-image":"url("+address+"img/Find-Friends01.png)",
                        "background-position":"left",
                        "background-repeat":"no-repeat",
                        "padding-left":"25px"});
                    $(".operate1").hover(function(){
                            $(this).css("background-image","url("+address+"img/Find-Friends02.png)");
                    },function(){
                          $(this).css("background-image","url("+address+"img/Find-Friends01.png)");
                    });
                    $(".operate2")
                    .html('Settings')
                    .attr("data-target","")
                    .css({"background-image":"url("+address+"img/Settings01.png)",
                        "background-position":"left",
                        "background-repeat":"no-repeat",
                        "padding-left":"25px"});
                    $(".operate2").hover(function(){
                            $(this).css("background-image","url("+address+"img/Settings02.png)");
                    },function(){
                          $(this).css("background-image","url("+address+"img/Settings01.png)");
                    });
                    $(".operate2").click(function(){
                        window.location.href="/user/update";
                    });
                     $(".operate1").click(function(){
                        window.location.href="/user/invite";
                    });
            }else{
                $(".operate1").html("Follow");
                $(".operate2").html("Send Message");
            }



            $.get(
                "/datas",
                {"userId":userId},
                function(message){
                    var userInfo = message.userInfo;
                    var pictureUrl = userInfo.pictureUrl;
                    var firstName = userInfo.firstName;
                    var postNum = userInfo.posts;
                    var likeNum = userInfo.likes;
                    var followerNum = userInfo.followers;
                    var followingNum = userInfo.followings;
                    var usersNum = userInfo.users;
                    var gamesNum = userInfo.games;
                    var isOrNotFollowByCuser = userInfo.isOrNotFollowByCuser;
                    $("title").html(firstName + " " + userInfo.lastName+" on Treeth");
                    $(".usrface").attr("src",pictureUrl);
                    $(".uname").html(firstName + " " + userInfo.lastName);
                    $("#usrpost span").html(postNum);
                    $("#usrlike span").html(likeNum);
                    $("#usrfollower span").html(followerNum);
                    $("#usrfollowing span").html(followingNum);
                    $("#followGames span").html(gamesNum);
                    $("#followUsers span").html(usersNum);
                    if(isOrNotFollowByCuser == 0 && currentUser != userId)
                        $(".operate1").html("Unfollow");

                 },"json"
                );



            var myauthor = $(".mymode .myauthor");
/* 请求各项count 和帖子数目*/
            $("#usrpost").click(function(){
                $(".loadFoot").hide();
                $("#masonry").html("");
                thumLengthFlag = false;
                pageNum = 1;
                $(".myauthor").css("padding","4px 8px 4px 8px");
                requestMethod ="post";
               $(".topNavContainer").removeClass("gameList");
               $(".gameUserBox").hide();
                 $("#masonry").css("height","0");
                 $(".usrbuttonbox .mybtns").removeClass("showNow");
                 $(this).addClass("showNow");
               var count = 0;
                    $.get(
                        "/count/posts",
                        {userId:userId},
                        function(message){
                            count = message.count;
                             $("#usrpost span").html(count);
                        $("#masonry").html("");
                              if(count == 0){
                                 if(currentUser == userId){
                                    $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Posts.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">Post anything you\'re interest in, and it will show up here.</P></div><a  role="button" class="btn btn-default addPost" style="display:block; width:100px; margin:auto; color:rgb(248,96,5);font-weight:bold;">Add Post</a>');
                                 }else{
                                    $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Posts.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+$(".uname").html()+' hasn\'t posted anything yet.</P></div>');
                                 }
                                }else{
                                    if(currentUser == userId){ 
                                        myauthor.html(editButton);
                                         $("#masonry").html('<div class="addpostDiv thumbnail imgModal"><a href="#myModal" class="addDiv" ><img src="'+address+'img/add-butten.png"/><p>Add a post</p></a></div>');
                                    }else{

                                            myauthor.html("").css("padding","0");
                                    }
                                    $(".noContentDiv").html("");
                                   
                                  
                                   var elem = document.getElementById("masonry");
                                   $.data(elem,"masonry","");
                                   initMasonry("/posts",{"userId":userId,pageNum:1});
                             }

                        },"json"

                        );
                   
            });



            $("#usrpost").click();
            $("#usrlike").click(function(){
                $(".loadFoot").hide();
                thumLikeLengthFlag = false;
                pageNum = 1;
               
                    $("#masonry").html("");
                    $(".myauthor").css("padding","9px 8px 4px");
                requestMethod="like";
                 $(".topNavContainer").removeClass("gameList");
                 $(".gameUserBox").hide();
                 $("#masonry").css("height","0");
                 $(".usrbuttonbox .mybtns").removeClass("showNow");
                 $(this).addClass("showNow");
                var count = 0;
                    $.get(
                        "/count/likes",
                        {userId:userId},
                        function(message){
                            count = message.count
                             $("#usrlike span").html(count);
                       $("#masonry").html("");
                            if(count == 0){
                                if(currentUser == userId){
                                     $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Posts-likes.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">Like posts you want to remember or save for later.</P></div><button role="button" class="pageOperation btn btn-default mybtns">Find Posts</button>');
                                }else{
                                    $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Posts-likes.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+$(".uname").html()+' hasn\'t liked any posts yet.</P></div>');
                                }
                            }else{
                                   $(".noContentDiv").html("");
                                 if(currentUser == userId) 
                                    myauthor.html(likeButton).css("padding","9px 8px 4px 8px"); 
                                 else
                                    myauthor.html('<div class="col-xs-2 headImg"><a href="javascript:;" class="personUrl"><img src="" alt="" class="user"/></a></div><div class="col-xs-10 userName postUser">Beay Akers</div>').css("padding","9px 8px 4px 8px");
                                    
                                 var elem = document.getElementById("masonry");
                                $.data(elem,"masonry","");
                                initMasonry("/likes",{"userId":userId,pageNum:1,"thumFlag":"like"});
                            }
                        },"json"
                        );
                
            });




            $("#usrfollower").click(function(){
             $(".loadFoot").hide();
             $("#masonry").html("");
             
             requestMethod="follower";
             $(".usrbuttonbox .mybtns").removeClass("showNow");
             $(this).addClass("showNow");
             $(".topNavContainer").addClass("gameList");
             $(".gameUserBox").hide();
             $("#masonry").css("height","0");
             var count = 0;
                $.get(
                    "/count/followers",
                    {userId:userId},
                    function(message){
                        count = message.count;
                         $("#usrfollower span").html(count);
                        $("#masonry").html("");
                        if(count == 0){
                            if(currentUser == userId){

                                $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Friends.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">Let people know you\'re on Treeth!</P></div><button role="button" class="pageOperation btn btn-default mybtns">Find Friends</button>');
                            }else{

                                $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Friends.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+$(".uname").html()+' doesn\'t have any followers yet.</P></div><button role="button" class="pageOperation btn btn-default mybtns loginFollow">Follow</button>');
                            }
                        }else{
                               $(".noContentDiv").html("");
   
                             var elem = document.getElementById("masonry");
                           $.data(elem,"masonry","");
                           initUserMasonry("/followers",{"userId":userId,"pageNum":1,"thumFlag":"follow"});
                           $(".user").css("border-radius","50%");
                           $(".userTag button").removeClass("followOpe");
                           $(".userTag button").addClass("loginFollow");
                        }

                    },"json"
                    );
             $(".myauthor").css({"padding":"15px 10px 12px 10px"});
            });

            var followingNum  = 0;
            $("#usrfollowing").click(function(){
                    $("#masonry").html("");
                  $(".usrbuttonbox .mybtns").removeClass("showNow");
                   $(this).addClass("showNow");
                   $(".gameUserBox").show();
                   $("#followGames").trigger("click");
                   $("#followGames").focus();
                $(".loadFoot").hide();
            });

            $("#followGames").click(function(){
                    
                $(".loadFoot").hide();
                $("#masonry").html("");
                requestMethod="game";
                $(".usrbuttonbox .mybtns").removeClass("showNow");
                $(".gameUserBox .mybtns").removeClass("showNow");
                   $("#usrfollowing").addClass("showNow");
                   $(this).addClass("showNow");
                   $(".topNavContainer").addClass("gameList");
                   var count = 0;
                   $("#masonry").css("height","0");
                $.get(
                        "/count/games",
                        {userId:userId},
                        function(message){
                            count = message.count;
                             $("#followGames span").html(count);
                             followingNum = parseInt($("#followGames span").html()) + parseInt($("#followUsers span").html());
                             $("#usrfollowing span").html(followingNum);
                            $("#masonry").html("");
                            if(count == 0){
                                    if(currentUser == userId){
                                        $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Games.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">Follow any game or person whose posts you want to see in your home feed</P></div><button role="button" class="pageOperation btn btn-default mybtns">Find Games</button>');
                                    }else{
                                        $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Games.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+$(".uname").html()+' hasn\'t followed any games yet.</P></div>');
                                    }
                                    $(".pageImg").css("margin-top","32px");
                            }else{
                                  $(".noContentDiv").html("");
                                
                                var elem = document.getElementById("masonry");
                                $.data(elem,"masonry","");
                                initGameMasonry({"userId":userId,"pageNum":1});
                                $(".user").css("border-radius","2px");
                                $(".userTag button").removeClass("loginFollow");
                                $(".userTag button").addClass("followOpe");
                            }

                        },"json"
                    );
                
            });

            $("#followUsers").click(function(){
               $(".loadFoot").hide();
               $("#masonry").html("");
               requestMethod="user";
               $(".usrbuttonbox .mybtns").removeClass("showNow");
               $(".gameUserBox .mybtns").removeClass("showNow");
               $("#usrfollowing").addClass("showNow");
               $(this).addClass("showNow");
               $(".topNavContainer").addClass("gameList");
               var count = 0;
               $("#masonry").css("height","0");
               $.get(
                        "/count/users",
                        {userId:userId},
                        function(message){
                            count = message.count;
                             $("#followUsers span").html(count);

                             followingNum = parseInt($("#followGames span").html()) + parseInt($("#followUsers span").html());
                             $("#usrfollowing span").html(followingNum);

                             $("#masonry").html("");
                                if(count == 0){
                                    if(currentUser == userId){
                                            $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Friends.png"></div><div style="text-align:center"><p class="pageDescribe">Follow any game or person whose posts you want to see in your home feed</P></div><button role="button" class="pageOperation btn btn-default mybtns">Browse Category</button>');
                                        }else{
                                            $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Friends.png"></div><div style="text-align:center"><p class="pageDescribe">'+$(".uname").html()+' hasn\'t followed anyone yet.</P></div>');
                                        }
                                        $(".pageImg").css("margin-top","32px");
                                }else{
                                       $(".noContentDiv").html("");
                                 
                                     var elem = document.getElementById("masonry");
                                     $.data(elem,"masonry","");
                                     initUserMasonry("/carers",{"userId":userId,"pageNum":1});
                                     $(".user").css("border-radius","50%");
                                     $(".userTag button").removeClass("followOpe");
                                     $(".userTag button").addClass("loginFollow");
                                }
                        },"json"
                    );
               
            });

            
            $(".pageOperation").live("click",function(){
                var requestArea = $(".pageOperation").html();
                if(requestArea == "Find Posts")
                    window.location.href="/popular/";
                else if(requestArea == "Find Games")
                    window.location.href="/game/";
                else if(requestArea == "Find Friends")
                    window.location.href="/user/invite";
                else if(requestArea =="Browse Category")
                    window.location.href="/popular/";


            });

            $(".addPost").live("click",function(){
               
                $("#addpost").trigger("click");
            });
















      
            /*game列表初始化列表*/
            function initGameMasonry(para) {
                var imgs = [];
                $(".initload").show();
                init = true;
                imagesGameLoading = true;
                var requestPara = $.extend({"pageNum":pageGameNum,"pageSize":"12","lan":"0",coverUrlCount:"6"},para);
                 $.ajax({
                     url:'/games',
                     dataType:'json',
                     data:requestPara,
                     cache:false, 
                     ifModified :true ,

                     success:function(data){
                         imgs = data.followingForUsers;
                        
                        
                        if(imgs!=null && imgs.length < 12){
                            thumLengthFlag = true;
                        }
                        var items = getNewGameItems(imgs).css('opacity', 0);
                        processNewGameItems(items);

                        gameMasNode.append(items);
                        
                        pageGameNum = 4;
                        
                        
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
                        
                        
                        
                        
                         },
                         async:false
                      });
                    
                    
                }
           
            $(window).keypress(function(btn){
                if(btn.keyCode ==13){
                    $("#login").trigger("click");
                }
            });
            /****************下拉的时候请求game列表数据****************/
            function appendToGameMasonry() {
            $(".loadFoot").show();
            var imgs = [];
            pageGameNum++;
            imagesGameLoading = true;
            
            $.get("/games",{pageNum:pageGameNum,pageSize:"3",lan:"0",coverUrlCount:"6",userId:userId},function(data){
                
                imgs = data.followingForUsers;
            

                if(isEmpty(imgs)){
                    thumLengthGameFlag = true;
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }
                if(imgs !=null && imgs.length < 3){
                    thumLengthGameFlag = true;
                }
                var items = getNewGameItems(imgs).css('opacity', 0);

                processNewGameItems(items);
                gameMasNode.append(items);
                
                
                items.imagesLoaded(function(){
                    
                    items.css('opacity', 1);
                    var leftArray = [];
                    
                    //var start = count * (pageNum - 1) - 1;
                    var thums = $("#masonry .Gamemode");
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
                    var followStatus = this.isOrNotFollowGameByCurrenUser;
                    
                    if(followStatus == 1){
                        $(".followStatus").html("Follow");
                        $(".followStatus").removeAttr("disabled");
                    }else{

                        $(".followStatus").html("Unfollow");
                        $(".followStatus").removeAttr("disabled");
                    }
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

                    elem = $(".Gamemode")
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
                            .removeClass("Gamemode");

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

          



            /*===========================================================================================================
                                                                请求用户
            =============================================================================================================*/
                /*user列表初始化列表*/
            function initUserMasonry(requestUrl,para) {
                var imgs = [];
                pageNum = 1;
                thumLengthUserFlag = false;
                $(".initload").show();
                init = true;
                var requestPara = $.extend({"pageNum":pageNum,"pageSize":"12","lan":"0",coverUrlCount:"6"},para);
                imagesUserLoading = true;
                 $.ajax({
                     url:requestUrl,
                     dataType:'json',
                     data:requestPara,
                     cache:false, 
                     ifModified :true ,

                     success:function(data){
                         imgs = data.followersForUsers;
                        
                        if(imgs != null && imgs.length < 12){
                            if(!isEmpty(para) && !isEmpty(para.thumFlag) && para.thumFlag == "follow"){
                                thumLengthFollowFlag = true;
                            }else{
                                thumLengthUserFlag = true;
                            }
                        }
                        
                        var items = getNewUserItems(imgs).css('opacity', 0);
                        processNewUserItems(items);

                        gameMasNode.append(items);
                        
                        pageNum = 4;
                        
                        imagesUserLoading = true;
                        items.imagesLoaded(function(){
                            
                            
                            imagesUserLoading = false;
                            items.css('opacity', 1);
                            var leftArray = [0,240,480,720,9601,1200,1440];
                            gameMasNode.masonry({
                                itemSelector: '.thumbnail',
                                isFitWidth: true,
                                leftArray:leftArray
                            });
                            
                            $(".initload").hide();
                            imagesUserLoading = false;
                                
                                
                            
                            
                        });
                        
                        
                        
                        
                         },
                         async:false
                      });
                    
                    
                }
           
            $(window).keypress(function(btn){
                if(btn.keyCode ==13){

                    var iflogin = ("#loginModel").is(":hidden");
                    if(!iflogin) $("#login").trigger("click");
                }
            });
            /****************下拉的时候请求user列表数据****************/
            function appendToUserMasonry(requestUrl,para) {
            var imgs = [];
          
            $(".loadFoot").show();
            imagesUserLoading = true;
            $.get(requestUrl,{pageNum:pageNum,pageSize:"3",lan:"0",coverUrlCount:"6",userId:userId},function(data){
                
                imgs = data.followingForUsers;
            
                if(isEmpty(imgs)){
                    if(!isEmpty(para) && !isEmpty(para.thumFlag) && para.thumFlag == "follow"){
                        thumLengthFollowFlag = true;
                    }else{
                       thumLengthUserFlag = true;
                    }
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }
                if(imgs != null && imgs.length < 3){
                    if(!isEmpty(para) && !isEmpty(para.thumFlag) && para.thumFlag == "follow"){
                        thumLengthFollowFlag = true;
                    }else{
                       thumLengthUserFlag = true;
                    }
                    
                }
                var items = getNewUserItems(imgs).css('opacity', 0);

                processNewUserItems(items);
                gameMasNode.append(items);
                
                imagesUserLoading = true;
                items.imagesLoaded(function(){
                    
                    items.css('opacity', 1);
                    var leftArray = [];
                    
                    //var start = count * (pageNum - 1) - 1;
                    var thums = $("#masonry .Gamemode");
                    //var thums = $("#masonry .thumbnail:gt("+start+")");
                    
                    
                    leftArray.push(column1,column2,column3,column4,column5,column6,column7);
                    
                    gameMasNode.masonry('appended',  items,leftArray,remainShow);

                    imagesUserLoading = false;
                    $(".loadFoot").hide();
                    
                    
                });
                
                
                
                
            });
            
        }

            /***********为game列表每一块添加数据**********/
            function getNewUserItems(imgs) {
                var newItemContainer = $('<div/>');
                $(imgs).each(function(index){
                
                    var elem = "";

                    var followStatus = this.isOrNotFollowUserByCurrenUser ;
                    var loginId = $(".sessionInfo .loginId").val();
                    if(followStatus == 1){
                        $(".followStatus").html("Follow");
                        $(".followStatus").removeAttr("disabled");
                    }else{
                        $(".followStatus").removeAttr("disabled");
                        $(".followStatus").html("Unfollow");
                    }
                    if(loginId == this.id){
                        $(".followStatus").html("That's you!");
                        $(".followStatus").attr("disabled",true);
                    }
                    var column = pageNum + ":" + (index + 1);

                    var gameImgList = this.coverPosts;
                    var gameImgs = "";
                    if(gameImgList != null && gameImgList.length > 0){
                        gameImgs = $('<div class="gameImgList clearfix"></div>');
                        $(gameImgList).each(function(){
                            var type = this.type;
                            var c = "";

                            if(type == "1"){

                                c = $('<div class="gameImg col-md-4"><input type="hidden" value="'+this.coverImg+'" class="showimg"/>'+
                                '<input type="hidden" class="postId" value="'+this.id+'">'+'<input type="hidden" value="'+this.userId+'" class="postUserId">'+'<img src="'+address+'img/play.png" alt="" class="plays" style="display:inline"/></div>');
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

                    elem = $(".Gamemode")
                            .find(".gameUrl")
                            .attr("href","/" + this.id +"/")
                            .end()
                            .find(".gameId")
                            .val(this.id)
                            .end()
                            .find(".user")
                            .attr("src",this.userImg)
                            .end()
                            .find(".userName")
                            .attr("title",this.userName +" " + this.lastName)
                            .html("")
                            .html(this.userName +" " + this.lastName)
                            .end()
                            .find(".imgs")
                            .html("")
                            .append(gameImgs)
                            .end()
                            .addClass("imgModal")
                            .clone()
                            .data("column",column)
                            .removeClass("Gamemode");

                    newItemContainer.append(elem);
                    
                });

                
                
                return newItemContainer.find('.thumbnail');
            }

            /*game列表处理显示图片*/
            function processNewUserItems(items) {
                items.each(function() {
                    var $this = $(this);
                    var imgsNode = $this.find('.imgs');

                    var imgNames = imgsNode.find('.gameImg');
                    $.each(imgNames, function(index, item) {
                        var img = $(item).find(".showimg").val();
                        
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

            $(".sendOwnMessage").click(function(){
                $(this).addClass("focusBgc");
            });
            $(window).scroll(function() {
                var height = $(window).height() / 2;
                if(requestMethod == "post" && thumLengthFlag){
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }
                if(requestMethod == "like" && thumLikeLengthFlag){
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }
                if(requestMethod == "follower" && thumLengthFollowFlag){
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }
                if(requestMethod == "game" && thumLengthGameFlag){
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }
                if(requestMethod == "user" && thumLengthUserFlag){
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    return;
                }

                if((!thumLengthFollowFlag ||!thumLengthUserFlag || !thumLengthFlag || !thumLengthGameFlag) && $(document).height() - $(window).height() - $(document).scrollTop() < height) {
                    
                    if(!imagesUserLoading || !imagesGameLoading || !imagesLoading) {
                        
                       /* if(!$(".pageDescribe")){
                            if(requestMethod == "post") appendToMasonry("/posts",{userId:userId});
                            
                            if(requestMethod == "like") appendToMasonry("/likes",{userId:userId});
                            if(requestMethod == "follower") appendToUserMasonry("/followers");
                            if(requestMethod == "game") appendToGameMasonry();
                            if(requestMethod == "user") appendToUserMasonry("/carers");
                        }*/

                        if(requestMethod == "post" && !thumLengthFlag && !imagesLoading){
                            appendToMasonry("/posts",{userId:userId});
                        }
                            
                        if(requestMethod == "like" && !thumLikeLengthFlag && !imagesLoading){
                            

                            appendToMasonry("/likes",{userId:userId,"thumFlag":"like"});
                        }
                        if(requestMethod == "follower" && !thumLengthFollowFlag && !imagesUserLoading){
                            
                            appendToUserMasonry("/followers",{"thumFlag":"follow"});
                        }
                        if(requestMethod == "game" && !thumLengthGameFlag && !imagesGameLoading){
                            appendToGameMasonry();
                        }
                        if(requestMethod == "user" && !thumLengthUserFlag && !imagesUserLoading){
                            appendToUserMasonry("/carers",{"thumFlag":"user"});
                        }
                    }
                    
                }
            
            });
           
        });
</script>

</body>
</html>