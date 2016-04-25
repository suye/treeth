<!DOCTYPE html>
<html>
<head>
<#assign localPath="">
    <title>Games</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   
    <link href="${localPath}/css/bootstrap3/bootstrap.min.css" rel="stylesheet">
    <link href="${localPath}/css/docs.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://fineui.com/lib/html5shim/html5.js"></script>
    <![endif]-->


    <link href="${localPath}/css/style.css" rel="stylesheet">
    <style type="text/css">

    </style>
       <#include "GA.ftl"/> 
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar" class="mybody">

    <#include "header.ftl"/>

    <div class="game-header">
        <img src="" class="game-header-background">
        <div class="game-layer">
            <div class="game-info">
                <p class="gameName"></p>
                <div class="centerDiv">
                    <div class="iconbox"><img src=""/></div>
                    <div class="game-info2">
                        
                        <a target="_blank" class="appStore-button"></a>
                        <a href="javascript:" class="follow-button followOpe">Follow</a>
                       <div><p class="followers">Followers <span></span></p></div>
                        <a  target="_blank" class="google-button"></a>
                    </div>
                </div>
                <div class="followers-list">
                
                   
                </div>
            </div>
        </div>
    </div>





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
                    <input type="hidden" value="2426.png" class="showimg"/>
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

<!--==========================================================================================================
                                    
==============================================================================================================-->


        <#include "secModel.ftl"/>
        <#include "dropdown.ftl"/>
        
    <script src="${localPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${localPath}/js/jquery.imgpreload.min.js"></script>
    <script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
    <script type="text/javascript" src="${localPath}/js/jquery.tagsinput.js"></script>
    <script src="${localPath}/js/masonry.pkgd.js"></script>
    <script src="${localPath}/js/imagesloaded.pkgd.min.js"></script>
    <script type="text/javascript" src="${localPath}/js/project.js"></script>
    <script src="${localPath}/js/main.js"></script>
    <script src="${localPath}/js/ajaxfileupload.js"></script>
    <script type="text/javascript">
        $(function(){
              $.imgpreload('/img/game-background.png',function(){
                // this = array of dom image objects
                // check for success with: $(this[i]).data('loaded')
                // callback
                if($(this).data('loaded')){
                    $(".game-header-background").attr("src","/img/game-background.png");
                }
            });



            var href = window.location.href;
            var hrefArray = href.split("/");
            var gameID =  hrefArray[4];
            var followers_members = $(".follow-members");
            
            $.get(
                "/game/detail",
                {"id":gameID,"count":8,"lan":0},
                function(message){
                    var statusCode = message.statusCode;
                    var messageCode = message.messageCode;
                    if(statusCode == 1 && messageCode ==1){
                        var gameInfo = message.gameInfo;
                        var gameName = gameInfo.gameName;
                        var icon = gameInfo.icon;
                        var followers = gameInfo.followers;
                        var users = message.users;
                        var followStatus = message.isOrNotFollowGameByCurrenUser;
                        var gameSoftwares = gameInfo.gameSoftwares;
                        $(".gameName").html(gameName);
                        $(".iconbox img").attr("src",icon);
                        $(".followers span").html(followers);
                        if(followStatus == 0){
                            $(".follow-button").html("Unfollow");
                        }else{
                            $(".follow-button").html("Follow");
                        }

                        for(var i = 0 ; i<gameSoftwares.length;i++){
                            var os = gameSoftwares[i].os;

                            var downloadUrl  = gameSoftwares[i].downloadUrl;
                            if(os == 1){
                                $(".appStore-button").attr("href",downloadUrl);
                                $(".appStore-button").css("background","url(/img/App_Store-02.png)");
                                $(".appStore-button").css("cursor","pointer");
                            }else if( os == 2){
                                $(".google-button").attr("href",downloadUrl);
                                $(".google-button").css("background","url(/img/Google_Play-02.png)");
                                $(".google-button").css("cursor","pointer");
                            }
                        }
                        
                      
                        for(i=0;i<users.length;i++){
                            if(i==0)
                            $(".followers-list").append('<a href="/'+users[i].id+'/"><img src="'+users[i].pictureUrl+'" class="follow-members first-follow-members"></a>');
                            else
                            $(".followers-list").append('<a href="/'+users[i].id+'/"><img src="'+users[i].pictureUrl+'" class="follow-members"></a>');
                        }
                    }
                },"json"
                );
                initMasonry("/game/post/list",{gameId:gameID});


$(".followOpe").live("click",function(){
        var flag = checkLogin();
        if(!flag){
            var val = $(this).html();
            var t = this;
            $(this).removeClass("followOpe");
            if(val == "Unfollow"){
                $.get("/game/follow/delete",{"gameId":gameID},function(data){
                    if(data){
                        $(t).html("Follow");
                        $(t).addClass("followOpe");
                       var number =  $(".followers span").html();
                       number--;
                       $(".followers span").html(number);
                    }
                });
            }else{
                $.get("/game/follow/add",{"gameId":gameID},function(data){
                    if(data == "0"){
                        $(t).html("Unfollow");
                        $(t).addClass("followOpe");
                        var number =  $(".followers span").html();
                            number++;
                       $(".followers span").html(number);
                    }
                    });
            }
        }
        
    });
    
         
});
        
    </script>

</body>
</html>