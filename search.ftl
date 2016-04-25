<!DOCTYPE html>
<html>
<head>


    <#assign localPath=""/>


    <title>search</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        
    </style>
   
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
            background-repeat: no-repeat;

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
    </style>
    <#include "GA.ftl"/>
</head>
<body class="mybody moreSearch">
    <#include "header.ftl"/>
     <img src="${localPath}/img/iconFoot.gif"   class="initload">
      <#if (Request["rex"])??>
         <input type="text"  class="searchName" value='${Request["rex"]}'>
     <#else>
   
     </#if>
<div class='topNavContainer'>
    <div class="usrlargebox"> 

     <div class="usrsmallbox">
        
     </div>
   
            <div class=" row usrbuttonbox">
                <div class="col-xs-4 nopadd">
               
                    <button type="button" class="mybtns mybtns btn btn-default showNow" id="followGames">
                        Games
                    </button>
               </div>
                <div class="col-xs-4 nopadd">
                    
                    <button type="button" class="mybtns btn btn-default " id="usrpost">Posts</button>
               </div>
               
                <div class="col-xs-4 nopadd">
                  
                   <button  type="button" class="mybtns mybtns btn btn-default" id="followUsers">
                        Users
                    </button>
               </div>
                     
           </div>
    </div>
   
    
    



   <#include "outerTop.ftl">
    


    <input type="hidden" value="" class="currentPost">
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

<script src="${localPath}/js/imagesloaded.pkgd.min.js"></script>
<script src="${localPath}/js/masonry.pkgd.js"></script>
<script src="${localPath}/js/kindeditor/kindeditor.js"></script>
<script src="${localPath}/js/kindeditor/lang/en.js"></script>
<script src="${localPath}/js/kindeditor/plugins/code/prettify.js"></script>
<script src="${localPath}/js/jquery.tagsinput.js"></script>
<script src="${localPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
<script src="${localPath}/js/jquery.VMiddleImg.js"></script>
<script src="${localPath}/js/project.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>
<script src="${localPath}/js/main.js"></script>
<script type="text/javascript">
   

        $(document).ready(function(){ 

            $(".initload").show();
            var address = "/";
            var searchName = $(".searchName").val();
            var pageNum = 1;
            var gameNum = 1;
            var userNum = 1;
            var totalWidth = 0;
            var imagesGameLoading = false;
            var thumLengthGameFlag = false;
            var thumLengthUserFlag = false;
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
            var likeButton = '<div class="col-xs-2 headImg"><img src="" alt="" class="user"/></div><div class="col-xs-8 userName"></div><div class="col-xs-2 centerLikeButton"><button class="mybtns btn btn-default editBtn user-center-like"  ><img src="'+address+'img/like-icon-03.png" alt="undo"/></button></div>';
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
                   var currentPostId =  $(this).parent().parent().prev().prev().val();
                   
                   $(".currentPost").val(currentPostId);
            });
           

            



           



            var myauthor = $(".mymode .myauthor");
            /* 请求各项count 和帖子数目*/
            $("#usrpost").live("click",function(){
                $(".loadFoot").hide();
                $(".initload").show();
                $("#masonry").html("");
                $(".noContentDiv").html("");
                $(".myauthor").css("padding","4px 8px 4px 8px");
                requestMethod ="post";
               $(".topNavContainer").removeClass("gameList");
               $(".gameUserBox").hide();
                 
                 $(".usrbuttonbox .mybtns").removeClass("showNow");
                 $(this).addClass("showNow");
                var count = 0;
                /********************mansor插件启动时删除掉以前保留的data值*******************************/
                var elem = document.getElementById("masonry");
                $.data(elem,"masonry","");
               initMasonry("/post/search",{"pageNum":1,"titleRex":searchName,"pageSize":"12","lan":"0"});
                
                   
            });

           

            $("#followGames").click(function(){
                $(".loadFoot").hide();
                $(".initload").show();
                $("#masonry").html("");
                $(".noContentDiv").html("");
                $(".myauthor").css("padding","15px 10px");
                requestMethod="game";
                $("#usrpost").removeClass("showNow");
                $("#followUsers").removeClass("showNow");
                   $("#usrfollowing").addClass("showNow");
                   $(this).addClass("showNow");
                   $(".topNavContainer").addClass("gameList");
                   var count = 0;
                   var elem = document.getElementById("masonry");
                   $.data(elem,"masonry","");
                   initGameMasonry();
            });
        
            $("#followGames").trigger("click");
            $("#followUsers").click(function(){
               $(".loadFoot").hide();
               $(".initload").show();
               $("#masonry").html("");
               $(".myauthor").css("padding","15px 10px");
               $("#masonry").attr("height","");
               $(".noContentDiv").html("");
               requestMethod="user";
               $("#usrpost").removeClass("showNow");
               $("#followGames").removeClass("showNow");
               
               $(this).addClass("showNow");
               $(".topNavContainer").addClass("gameList");
               var count = 0;
               var elem = document.getElementById("masonry");
               $.data(elem,"masonry","");
               initUserMasonry("/search/users",{"pageNum":1,"nameRex":searchName,"pageSize":"12","lan":"0",coverUrlCount:"6"});
            });
           /* $("#followUsers").trigger("click");*/
            
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



      
            /*game列表初始化列表*/
            function initGameMasonry(para) {
                var imgs = [];
                $(".initload").show();
                init = true;
                var requestPara = $.extend({"pageNum":1,"nameRex":searchName,"pageSize":"12","lan":"0",coverUrlCount:"6"},para);  
                 $.ajax({
                     url:'/game/search',
                     dataType:'json',
                     data:requestPara,
                     cache:false, 
                     ifModified :true ,

                     success:function(data){
                         imgs = data.followingForUsers;
                        
                        if(imgs.length == 0){
                            $(".initload").hide();
                            $("#masonry").html("");
                            $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Games.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+"'"+searchName+"'"+' has no matching Games.</P></div>');
                            return false;
                        }
                        if(imgs!=null && imgs.length < 12){
                            thumLengthFlag = true;
                        }
                        var items = getNewGameItems(imgs).css('opacity', 0);
                        processNewGameItems(items);

                        gameMasNode.append(items);
                        
                        /*gameNum = 4;*/
                        
                        imagesGameLoading = true;
                        items.imagesLoaded(function(){
                            
                            
                            imagesGameLoading = false;
                            items.css('opacity', 1);
                            var leftArray = [0,250,500,750,1000,1250,1500];
                            gameMasNode.masonry({
                                itemSelector: '.thumbnail',
                                isFitWidth: true,
                                leftArray:leftArray
                            });
                            
                            $(".initload").hide();
                            appendToGameMasonry();
                            /*appendToGameMasonry();
                            appendToGameMasonry();*/
                            
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
                var imgs = [];
                gameNum++;
                
                $.get("/game/search",{"pageNum":gameNum,"nameRex":searchName,"pageSize":"12","lan":"0",coverUrlCount:"6"},function(data){
                    
                    imgs = data.followingForUsers;
                
                     if(isEmpty(imgs)){
                        $(".footgif").hide();
                        $(".footpng").show();
                        $(".footFont").show();
                        $(".loadFoot").show();
                        thumLengthGameFlag = true;
                        return;
                    }
                    if(imgs !=null && imgs.length < 3){
                        thumLengthGameFlag = true;
                    }
                    var items = getNewGameItems(imgs).css('opacity', 0);

                    processNewGameItems(items);
                    gameMasNode.append(items);
                    
                    imagesGameLoading = true;
                    items.imagesLoaded(function(){
                        imagesGameLoading = false;
                        items.css('opacity', 1);
                        var leftArray = [];
                        
                        //var start = count * (pageNum - 1) - 1;
                        var thums = $("#masonry .Gamemode");
                        //var thums = $("#masonry .thumbnail:gt("+start+")");
                        
                        
                        leftArray.push(column1,column2,column3,column4,column5,column6,column7);
                        
                        gameMasNode.masonry('appended',  items,leftArray,remainShow);


                        
                        
                        
                    });
                    
                    
                    
                    
                });
            
            }

            /***********为game列表每一块添加数据**********/
            function getNewGameItems(imgs) {
                var newItemContainer = $('<div/>');
                $(imgs).each(function(index){
                
                    var elem = "";


                    var column = gameNum + ":" + (index + 1);
                    var followStatus = this.isOrNotFollowGameByCurrenUser ;
                    
                    if(followStatus == 1){
                        $(".followStatus").html("Follow");
                        $(".followStatus").removeAttr("disabled");
                    }else{

                        $(".followStatus").html("Unfollow");
                        $(".followStatus").removeAttr("disabled");
                    }
                    var gameImgList = this.coverPosts;
                    var gameImgs = "";
                    if(gameImgList != null && gameImgList.length > 0){
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
                $(".initload").show();
                init = true;
                var requestPara = $.extend({"pageNum":0,"pageSize":"12","lan":"0",coverUrlCount:"6"},para);
                 $.ajax({
                     url:requestUrl,
                     dataType:'json',
                     data:requestPara,
                     cache:false, 
                     ifModified :true ,

                     success:function(data){
                         imgs = data.followersForUsers;
                        
                        if(imgs.length == 0){
                            $(".initload").hide();
                            $("#masonry").html("");
                            $("#masonry")[0].style.height = "";
                            $(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Friends.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+"'"+searchName+"'"+' has no matching users.</P></div>');
                            return false;
                        }
                        if(imgs != null && imgs.length < 12){
                            thumLengthFlag = true;
                        }
                        var items = getNewUserItems(imgs).css('opacity', 0);
                        processNewUserItems(items);

                        gameMasNode.append(items);
                        
                       
                        
                        imagesUserLoading = true;
                        items.imagesLoaded(function(){
                            
                            
                            imagesUserLoading = false;
                            items.css('opacity', 1);
                            var leftArray = [0,250,500,750,1000,1250,1500];
                            gameMasNode.masonry({
                                itemSelector: '.thumbnail',
                                isFitWidth: true,
                                leftArray:leftArray
                            });
                            
                            $(".initload").hide();
                            appendToUserMasonry("/search/users");
                            appendToUserMasonry("/search/users");
                            appendToUserMasonry("/search/users");
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
            function appendToUserMasonry(requestUrl) {
            var imgs = [];
            userNum++;
             
            $.get(requestUrl,{"pageNum":userNum,"nameRex":searchName,"pageSize":"12","lan":"0",coverUrlCount:"6"},function(data){
                
                imgs = data.followingForUsers;
            
                if(isEmpty(imgs)){
                    $(".footgif").hide();
                    $(".footpng").show();
                    $(".footFont").show();
                    $(".loadFoot").show();
                    thumLengthUserFlag = true;
                    return;
                }
                if(imgs != null && imgs.length < 3){
                    thumLengthUserFlag = true;
                }
                var items = getNewUserItems(imgs).css('opacity', 0);

                processNewUserItems(items);
                gameMasNode.append(items);
                
                imagesUserLoading = true;
                items.imagesLoaded(function(){
                    imagesUserLoading = false;
                    items.css('opacity', 1);
                    var leftArray = [];
                    
                    //var start = count * (pageNum - 1) - 1;
                    var thums = $("#masonry .Gamemode");
                    //var thums = $("#masonry .thumbnail:gt("+start+")");
                    
                    
                    leftArray.push(column1,column2,column3,column4,column5,column6,column7);
                    
                    gameMasNode.masonry('appended',  items,leftArray,remainShow);


                    
                    
                    
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
                    var column = userNum + ":" + (index + 1);

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

                if((requestMethod == "post" && !thumLengthFlag) && $(document).height() - $(window).height() - $(document).scrollTop() < height) {
                    
                    if(!imagesLoading) {
                        $(".footgif").show();
                        $(".footpng").hide();
                        $(".footFont").hide();
                        $(".loadFoot").show();
                        appendToMasonry("/post/search",{"titleRex":searchName,"pageSize":"12","lan":"0"});
 

                    }
                    
                }
                if((requestMethod == "game" && !thumLengthGameFlag) && $(document).height() - $(window).height() - $(document).scrollTop() < height) {
                    
                    if(!imagesGameLoading) {
                        $(".footgif").show();
                        $(".footpng").hide();
                        $(".footFont").hide();
                        $(".loadFoot").show();
                        appendToGameMasonry();
 

                    }
                    
                }
                if((requestMethod == "user" && !thumLengthUserFlag) && $(document).height() - $(window).height() - $(document).scrollTop() < height) {
                    
                    if(!imagesUserLoading) {
                        $(".footgif").show();
                        $(".footpng").hide();
                        $(".footFont").hide();
                        $(".loadFoot").show();
                        appendToUserMasonry("/search/users");

                    }
                    
                }

                
                
















            
            });
           
        });
</script>

</body>
</html>