<!DOCTYPE html>
<html>
<head>
    <#assign localPath="">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Find your friends| Treeth</title>
    
    <link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />

    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/> 
    <link href="${localPath}/css/docs.css" rel="stylesheet">
    <link href="${localPath}/css/style.css" rel="stylesheet">
    <#include "GA.ftl"/>
</head>
    
  
<body class="mybody">
    <#include "header.ftl"/>
    <div class="showSearch invite">Find your friends</div>
    <div class="friendsbox row">
        <div class="friendsleft">
            <div class="friendsbox-head">
                <p class="lr-title">See who's here</p>
                <p>Follow people you know to keep up with their latest finds.</P>
            </div>
            <div class="friendsbox-pic">
                <img src="${localPath}/img/findFriends.png"/>
            </div>
            <div class="friendsbox-body">
                <img src="${localPath}/img/facebook-butten.png"/>
                <button class="mybtns btn btn-default conn">Connect with Facebook</button>
            </div>
            
            <div class="friendsbox-footer">
                <p>Don't worry: we'll never post on your networks without asking first.</P>
            </div>
        </div>
        <div class="friendsright">
                <div class="friendsbox-head">
                    <p class="lr-title">Invite whoever's missing</p>
                    <p>Ask your friends to join you on treeth.</P>
                </div>
                <div class="friendsbox-option">
                    <div class="container inviteSuccess" style="z-index:10000;">
                            <p><img src="${localPath}/img/fb-icon.png"></p>
                            <p>invites Sent!</p>
                    </div>
                    <a href="javascript:" class="mybtns email-friends gmail-friends">Gmail</a>
                    <a href="javascript:" class="mybtns email-friends yahoo-friends">Yahoo</a>
                    <a href="javascript:" class="mybtns facebook-friends">Facebook</a>
                </div>
                <div class="friendsbox-body">
                             <div class="send-invite-div gmail-invite-div">
                                  <div class="box-div">
                                      <img src="${localPath}/img/Gmail-box.png" class="facebook-icon" />
                                      <a href="javascript:">
                                          <button class="mybtns btn btn-default conn">Connect with Gmail</button>
                                      </a>
                                  </div>
                              
                                  <div class="send-email-div">
                                      <div class="input-group send-email form-group">
                                        <input placeholder="Separate each address by commas" type="email" class="form-control emails"/>
                                        <span class="input-group-btn">
                                          <button class="mybtns btn btn-default sendSingle">Send Invite</button>  
                                        </span>   
                                      </div>
                                      <p class="error-p"></P>
                                  </div>
                              
                              </div>
                         
                            <div class="send-invite-div facebook-invite-div">
                               <div class="box-div">

                                   <img src="${localPath}/img/fb-box.png" class="facebook-icon" />
                                   <a href="javascript:">
                                       <button class="mybtns btn btn-default conn" >Connect with Facebook</button>
                                   </a>

                               </div>

                               <div class="send-email-div">
                                   <div class="input-group send-email form-group">
                                     <input placeholder="Separate each address by commas" type="email" class="form-control emails"/>
                                     <span class="input-group-btn">
                                         <button class="mybtns btn btn-default sendSingle">Send Invite</button>    
                                     </span>    
                                   </div>
                                   <p class="error-p"></P>
                               </div>
                           
                           </div> 

                             
                         <div class="send-invite-div yahoo-invite-div">
                             <div class="box-div">
                                 <img src="${localPath}/img/Yahoo-box.png" class="facebook-icon"/>
                                 <a href="javascript:">
                                     <button class="mybtns btn btn-default conn">Connect with Yahoo</button>
                                 </a>
                             </div>
                             <div class="send-email-div">
                                 <div class="input-group send-email form-group">
                                   <input placeholder="Separate each address by commas" type="email" class="form-control emails"/>
                                   <span class="input-group-btn">
                                     <button class="mybtns btn btn-default sendSingle">Send Invite</button>  
                                   </span>   
                                 </div>
                                 <p class="error-p"></P>
                             </div>
                         
                         </div> 
                         
                         <div class="friendList gmailList"></div>
                         <div class="friendList yahooList"></div>
                         <div class="friendList facebookList"></div>
                                                    
                </div>

                <div class="friendsbox-footer">
                      
               
                       <p>Just so you know: We never email your contacts without your say so.</P>

                </div>

        </div>
        <input type="hidden" value="<#if (Request.connectData)??>${Request.connectData.facebookConnect}</#if>" id="facebookData"/>
        <input type="hidden" value="<#if (Request.connectData)??>${Request.connectData.yahooConnect}</#if>" id="yahooData"/> 
        <input type="hidden" value="<#if (Request.connectData)??>${Request.connectData.gmailConnect}</#if>" id="googleData"/>     
        
        <input type="hidden" value="20" id="pageName"/>
    </div>
     
<#include "dropdown.ftl"/>
<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/kindeditor/kindeditor.js"></script>
<script src="${localPath}/js/kindeditor/lang/en.js"></script>
<script src="${localPath}/js/kindeditor/plugins/code/prettify.js"></script>
<script  src="${localPath}/js/jquery.tagsinput.js"></script>
<script src="${localPath}/js/jquery.form.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>

<script type="text/javascript">
    $(function(){
        var address = "/"


      function isEmpty(obj){
        if(obj == null || obj == "" || obj == undefined){
            return true;
        }else{
            return false;
        }
    }
        var facebookConnect = $(".facebookConnect").val();
        var gmailConnect = $(".gmailConnect").val();
        var yahooConnect  =$(".yahooConnect").val();
       
       /* if(facebookConnect == 1){
            FB.api('/me/taggable_friends?access_token='+access_token,function(response){
                var friends = response.data;
                var ids = [];
                $(".friendList").html("");
                for(var i = 0 ;i<friends.length;i++){
                    console.log(friends[i].id);

                    $(".friendList").append('<div class="fb-friends-checkout"><img src="'+friends[i].picture.data.url+'" class="friendFace" /><span class="friendName">'+friends[i].name+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" value="'+friends[i].id+'"/></div>');
                }
            });
        }*/
               
        
        $(".gmail-friends").click(function(){
            
            $(".facebook-friends").css({"background":"#fff","color":"#878787"});
            $(".yahoo-friends").css({"background":"#fff","color":"#878787"});
            $(this).css({"background":"rgb(237,240,254)","color":"#101010"});
            $(".yahoo-invite-div").hide();
            $(".facebook-invite-div").hide();

            var flag = $("#googleData").val();
            if(parseInt(flag)){
               $.get(
                  "/contact/googleplus",
                  function(message){
                      if(message.statusCode == 1 && message.messageCode == 1){
                        var contacts = message.contacts;
                          
                          $(".send-invite-div").hide();
                          $(".friendList").hide();
                          $(".gmailList").show().html("");
                          if(contacts.length > 0){
                            $(".friendsright .friendsbox-footer").html('<p class="attention-p"></P><button type="button"  class="mybtns btn btn-default inviteAll">Invite</button>');
                              for(var i=0;i<contacts.length;i++){
                                
                                if(contacts[i].profileImageURL ==""|| contacts[i].profileImageURL ==null || contacts[i].profileImageURL ==undefined || contacts[i].profileImageURL=="null"){
                                  $(".gmailList").append('<div class="fb-friends-checkout"><img src="'+address+'img/user-picture.png" class="friendFace" /><span class="friendName">'+contacts[i].email+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" class="email" value=""/></div>');
                                }else{
                                  $(".gmailList").append('<div class="fb-friends-checkout"><img src="'+contacts[i].profileImageURL+'" class="friendFace" /><span class="friendName">'+contacts[i].email+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" class="email" value=""/></div>');
                                }
                              }
                          }else{
                            $(".gmailList").append('<p class="warnMsgs">You are not currently signed on with an account that can invite that buddy.</P>');
                          }
                      }
                  },"json");
            }else{
             $(".friendList").hide();
             $(".gmail-invite-div").show();
             $(".friendsright .friendsbox-footer").html('<p>Just so you know: We never email your contacts without your say so.</P>');
            }

        });

        $(".gmail-friends").trigger("click");
        
        $(".yahoo-friends").click(function(){
            
            $(".facebook-friends").css({"background":"#fff","color":"#878787"});
            $(".gmail-friends").css({"background":"#fff","color":"#878787"});
            $(this).css({"background":"rgb(237,240,254)","color":"#101010"});
            $(".facebook-invite-div").hide();
            $(".gmail-invite-div").hide();

            var flag = $("#yahooData").val();
        
            if(parseInt(flag)){
             $.get(
                "/contact/yahoo",
                 function(message){
                    if(message.statusCode == 1 && message.messageCode == 1){
                      var contacts = message.contacts;
                       
                        $(".send-invite-div").hide();
                        $(".friendList").hide();
                        $(".yahooList").show().html("");
                          if(contacts.length > 0){
                            $(".friendsright .friendsbox-footer").html('<p class="attention-p"></P><button type="button"  class="mybtns btn btn-default inviteAll">Invite</button>');
                            for(var i=0;i<contacts.length;i++){
                               if(contacts[i].profileImageURL ==""|| contacts[i].profileImageURL ==null || contacts[i].profileImageURL ==undefined || contacts[i].profileImageURL=="null"){
                                  $(".yahooList").append('<div class="fb-friends-checkout"><img src="'+address+'img/user-picture.png" class="friendFace" /><span class="friendName">'+contacts[i].email+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" class="email" value=""/></div>');
                                }else{
                                  $(".gyahooList").append('<div class="fb-friends-checkout"><img src="'+contacts[i].profileImageURL+'" class="friendFace" /><span class="friendName">'+contacts[i].email+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" class="email" value=""/></div>');
                                }
                            }
                          }else{
                               $(".yahooList").append('<p class="warnMsgs">You are not currently signed on with an account that can invite that buddy.</P>');
                              
                          }
                    }
                },"json"
              );

            }else{
               $(".friendList").hide();
               $(".yahoo-invite-div").show();
               $(".friendsright .friendsbox-footer").html('<p>Just so you know: We never email your contacts without your say so.</P>');
            }

        });
        $(".facebook-friends").click(function(){

            $(".warnMsgs").remove();
            $(".email-friends").css({"background":"#fff","color":"#878787"});
            $(this).css({"background":"rgb(237,240,254)","color":"#101010"});
            $(".yahoo-invite-div").hide();
            $(".gmail-invite-div").hide();


            var flag = $("#facebookData").val();
            if(parseInt(flag)){
             $.get(
                "/contact/facebook",
                 function(message){
                    if(message.statusCode == 1 && message.messageCode == 1){
                      var contacts = message.contacts;
                      $(".send-invite-div").hide();
                      $(".friendList").hide();
                      $(".yahooList").show().html("");

            
                      for(var i=0;i<contacts.length;i++){
                        if(contacts[i].profileImageURL ==""|| contacts[i].profileImageURL ==null || contacts[i].profileImageURL ==undefined || contacts[i].profileImageURL=="null"){
                          $(".gmailList").append('<div class="fb-friends-checkout"><img src="'+address+'img/user-picture.png" class="friendFace" /><span class="friendName">'+contacts[i].email+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" class="email" value=""/></div>');
                        }else{
                          $(".gmailList").append('<div class="fb-friends-checkout"><img src="'+contacts[i].profileImageURL+'" class="friendFace" /><span class="friendName">'+contacts[i].email+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" class="email" value=""/></div>');
                        }
                      }
                    }
                },"json"
              );

            }else{

               $(".facebook-invite-div").show();

            }
        });
       
      
        $(".invitebox").live("click",function(){
            var  background = $(this).css("background-color");
            
            var val = $(this).next(".email").val();
              
            if(!isEmpty(val)){
                $(this).css("background-color","rgb(255,255,255)");
                $(this).next(".email").val("");
            }else{
                $(this).css("background-color","rgb(230,230,230)");                 
                $(this).next(".email").val("1");
            }

        });



        $(".conn").click(function(){
            var info = $(this).html();
           
            if(info =="Connect with Yahoo"){
                 var w = window.open('','newwindow','width=700,height=500,z-look=yes','center'); 
                $.get("/socialauth",{providerId:"yahoo"}, function(message){
                               
                                $("#connectMethod").val(connectMethod.yahooConnect);
                                
                                w.location.href = "/login/yahoo/";
                               //window.open(treethInterFace,'newwindow','width=800, height=500','center');

                    },"text");
            }else if(info =="Connect with Gmail"){
             
                var w = window.open('','newwindow','width=700,height=500,z-look=yes','center'); 
                $.get("/socialauth",{providerId:"yahoo"}, function(message){

                                $("#connectMethod").val(connectMethod.googleplusConnect);
                               
                                w.location.href = "/login/googleplus/";
                                //window.open(treethInterFace,'newwindow','width=800, height=500','center');

                    },"text");
            }else{
                var w = window.open('','newwindow','width=700,height=500,z-look=yes','center'); 
                $.get("/socialauth",{providerId:"yahoo"}, function(message){

                                $("#connectMethod").val(connectMethod.facebookDisconnect);
                                w.location.href = "/login/facebook/";
                               //window.open(treethInterFace,'newwindow','width=800, height=500','center');

                    },"text");
            }
        });
        function getEmail(){
            var flag  = $(".email");
            var email ="";
            for(var i = 0;i<flag.length;i++){
                var val = flag.get(i).value;
                if(val == 1){

                    email += "\""+$(flag.get(i)).parent().text()+"\",";/*.parent().find(".firstName").html();*/
                    
                }
            }
        
            return email.substr(0,email.lastIndexOf(","));
            
            
            
            
            
        }
        $(".inviteAll").live("click",function(){
                $(this).attr("disabled",true);
               
                if(isEmpty(getEmail())){

                    $(".attention-p").html("Choose at least one friend.").css("color","red");
                    $(".inviteAll").removeAttr("disabled");
                    return;

                }
               

                $.post("/user/invite/friends",{'friends':"["+getEmail()+"]"},function(message){
                            if(message.statusCode == 1 && message.messageCode == 1){
                             
                                $(".inviteAll").removeAttr("disabled");
                                $(".inviteSuccess").show();
                                setTimeout(function(){
                                    $(".inviteSuccess").hide();
                                },2000);
                            }
                },"json");

        });
        $(".emails").blur(function(){
                var emailStr = $(this).val();
                if(isEmpty(emailStr)) return;

                var emails = emailStr.split(",");
                for(var j = 0 ; j < emails.length ; j++){
                    var testVal = testEmail(emails[j]);
                    if(testVal == false){
                        $(".form-group").addClass("has-error");
                        $(".error-p").html("Error! Mailbox format is wrong."); 
                        return;
                    }

                }
                $(".error-p").html("");
                $(".form-group").removeClass("has-error");
                $(".form-group").addClass("has-success");

        });
        $(".sendSingle").live("click",function(){
                $(this).attr("disabled",true);
                var emailStr = $(this).parent().prev().val();
                
                var emails = emailStr.split(",");
                var emailArray = ""; 
                for(var j = 0 ; j < emails.length ; j++){
                    var testVal = testEmail(emails[j]);
                    if(testVal == false){
                        $(".form-group").addClass("has-error");
                        $(".error-p").html("Error! Mailbox format is wrong."); 
                        return;
                    }

                }
                $(".error-p").html("");
                $(".form-group").removeClass("has-error");
                $(".form-group").addClass("has-success");
                for(var i = 0;i<emails.length;i++){
                    if(i == emails.length - 1 ){

                    emailArray += "\""+emails[i]+"\"";
                    break;

                    }
                    
                    emailArray += "\""+emails[i]+"\",";
                }
                if(isEmpty(emailArray)) 
                    return;
                else 
                    $.post("/user/invite/friends",{'friends':"["+emailArray+"]"},function(message){
                            if(message.statusCode == 1 && message.messageCode == 1){
                             
                                $(".sendSingle").removeAttr("disabled");
                                 $(".inviteSuccess").show();
                                setTimeout(function(){
                                    $(".inviteSuccess").hide();
                                },2000);
                            }
                },"json");

        });


        function testEmail(email){
             var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
             if(reg.test(email)) return true;
             else  return false;
             
        }

        /* window.fbAsyncInit = function() {
                          FB.init({
                            appId      : '1549208718648467',
                            cookie     : true,  // enable cookies to allow the server to access 
                                                // the session
                            xfbml      : true,  // parse social plugins on this page
                            version    : 'v2.2', // use version 2.1
                            frictionlessRequests:true,

                          });

                   
                $(".conn").on("click",function(){
                    
                    getFBlist();
                });
             
                                 

            };
           */

/*
                    (function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/en_US/sdk.js";
                        fjs.parentNode.insertBefore(js, fjs);
                      }(document, 'script', 'facebook-jssdk'));*/
            
             

        /*  function getFBlist(){
                    FB.login(function(response){
                      // Handle the response object, like in statusChangeCallback() in our demo
                      // code.
                    }, {scope: 'public_profile,email,user_friends,publish_actions'});

                    FB.getLoginStatus(function(response) {
                       if (response.status === 'connected') {
                            var access_token = response.authResponse.accessToken;
                            var flag = false;
                          
                            FB.api('/me/permissions',function(response){
                                    var permissions = response.data;
                                    
                                    for(var i =0;i<permissions.length;i++){
                                        console.log(permissions[i]);
                                        if(permissions[i].permission == "user_friends" && permissions[i].status == "granted"){
                                             FB.api('/me/taggable_friends?access_token='+access_token,function(response){
                                                 var friends = response.data;
                                                 var ids = [];
                                                 $(".friendList").html("");
                                                 for(var i = 0 ;i<friends.length;i++){
                                                    console.log(friends[i].id);

                                                    $(".friendList").append('<div class="fb-friends-checkout"><img src="'+friends[i].picture.data.url+'" class="friendFace" /><span class="friendName">'+friends[i].name+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" value="'+friends[i].id+'"/></div>');
                                                        FB.api(
                                                             '/v2.2/me/treeth-test:eat?access_token='+access_token+"&method=POST&tags="+friends[i].id+"&place=http://www.treeth-test.com&message=let us join in treeth @["+friends[i].id+"]",
                                                                      function(response) {
                                                                        console.log(response);
                                                                      }
                                                               );

                                                 }
                                                    
                                            });
                                        }   
                                    }

                            });
                           
                          
                        } });
            };*/





    });
</script>

</body>
</html>     