<!DOCTYPE html>
<html>
<head>
	<#assign localPath="">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Find your friends</title>
    
    

    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet"> 
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
				<img />
			</div>
			<div class="friendsbox-body">
				<img src="${localPath}/img/facebook-butten.png"/>
				<button class="mybtns btn btn-default conn">Connect with Facebook</button>
			</div>
			
			<div class="friendsbox-footer">
				<p>Don't worry:we'll never post on your networks without asking first.</P>
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
				<a href="javascript:" class="mybtns email-friends">Email Contacts</a>
				<a href="javascript:" class="mybtns facebook-friends">Facebook Friends</a>
			</div>
			<div class="friendsbox-body">
					<!-- <#if (Request.connectData.facebookConnect)??>
                                                <input type="hidden" class="facebookConnect" value="${Request.connectData.facebookConnect}"/>
                                            </#if>
                                            <#if (Request.connectData.gmailConnect)??>
                                                <input type="hidden" class="gmailConnect" value="${Request.connectData.gmailConnect}"/>
                                                <#if (Request.contacts)??>
                                                    <div class="friendList gmailList">
                                                        <#list Request.contacts as contact>
                                                            <div class="fb-friends-checkout">
                                                                <img src="<#if contact.profileUrl??>${contact.profileUrl}</#if>" class="friendFace" />
                                                                <span class="friendName">${contact.email}</span>
                                                                <button type="button" class="btn btn-default invitebox" ></button>
                                                                <input type="hidden" class="email" value=""/>
                                                            </div>
                                                        </#list>
                                                        
                                                    </div>
                                                </#if>
                                            </#if>
                                            <#if (Request.connectData.yahooConnect)??>
                                                <input type="hidden" class="yahooConnect" value="${Request.connectData.yahooConnect}"/>
                                                  <#if (Request.contacts)??>
                                                    <div class="friendList yahooList">
                                                        <#list Request.contacts as contact>
                                                            <div class="fb-friends-checkout">
                                                                <img src="<#if contact.profileUrl??>${contact.profileUrl}</#if>" class="friendFace" />
                                                                <span class="friendName">${contact.email}</span>
                                                                <button type="button" class="btn btn-default invitebox" ></button>
                                                                <input type="hidden" class="email" value=""/>
                                                            </div>
                                                        </#list>
                                                    </div>
                                                </#if>
                                            </#if> -->
						<#if (Request.contacts)??>
						<div class="friendList">
							<#list Request.contacts as contact>
								<div class="fb-friends-checkout">
									<img src="<#if contact.profileUrl??>${contact.profileUrl}</#if>" class="friendFace" />
									<span class="friendName">${contact.email}</span>
									<button type="button" class="btn btn-default invitebox" ></button>
									<input type="hidden" class="email" value=""/>
								</div>
							</#list>
							
						</div>
						<#else>

						<img src="${localPath}/img/facebook-butten.png" class="facebook-icon" style="display:none;"/>
						<a href="/invite/facebook">
                            <button class="mybtns btn btn-default conn" style="display:none;">Connect with Facebook</button>
                        </a>
						<div class="send-invite-div">
							<div class="send-email-div">
								<img src="${localPath}/img/Email-icon.png">
								<div class="input-group send-email form-group">
							      <input placeholder="Separate each address by commas" type="email" class="form-control emails"/>
							      <span class="input-group-btn">
							      	<button class="mybtns btn btn-default sendSingle">Send Invite</button>	
							      </span>	
							    </div>
								<p class="error-p"></P>
							</div>
						    <div class="email-type-div">
								<img src="${localPath}/img/Gmail-butten.png" class="email-type">
								<span>Gmail</span>
								<a href="/invite/googleplus"><button class="mybtns btn btn-default send-gmail">Find Contacts</button></a>
							</div>
							<div class="email-type-div">
								<img src="${localPath}/img/Yahoo-butten.png" class="email-type">
								<span>Yahoo</span>
								<a href="/invite/yahoo"><button class="mybtns btn btn-default send-yahoo">Find Contacts</button></a>
							</div>
						</div>
						</#if>
			</div>

				<div class="friendsbox-footer">
                    <#if (Request.contacts)??>
                       <p class="attention-p"></P><button type="button"  class="mybtns btn btn-default inviteAll">Invite</button>
                    <#else>
						 <p>Just so you konw:We never email your contacts without your say so.</P>
                    </#if>
				</div>

			</div>
			
		</div>
	</div>
     
<#include "dropdown.ftl"/>
<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>

<script type="text/javascript">
    $(function(){
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
        if(facebookConnect == 1){
            FB.api('/me/taggable_friends?access_token='+access_token,function(response){
                var friends = response.data;
                var ids = [];
                $(".friendList").html("");
                for(var i = 0 ;i<friends.length;i++){
                    console.log(friends[i].id);

                    $(".friendList").append('<div class="fb-friends-checkout"><img src="'+friends[i].picture.data.url+'" class="friendFace" /><span class="friendName">'+friends[i].name+'</sapn><button type="button" class="btn btn-default invitebox" ></button><input type="hidden" value="'+friends[i].id+'"/></div>');
                }
            });
        }
       if(gmailConnect == 1 && yahooConnect == 1){

            $(".gmailList").hide();
            $(".yahooList").hide();  

       }
       if(gmailConnect == 1){

            $(".gmailList").hide();

       }
       if(gmailConnect == 1){

            $(".yahooList").hide();  

       }
        $(".email-friends").css({"background":"rgb(237,240,254)","color":"#101010"});
     	$(".email-friends").click(function(){
     		var fb_icon = $(".facebook-icon");
     		var fr = $(".friendsright .conn");
     		var sid = $(".send-invite-div");
            $(".facebook-friends").css({"background":"#fff","color":"#878787"});
            $(this).css({"background":"rgb(237,240,254)","color":"#101010"});
          
            if(fb_icon.html() == undefined)
                window.location.href="/user/invite";

                 fb_icon.hide();
                 fr.hide();
                 sid.show();

     	});
     	$(".facebook-friends").click(function(){

     		var sid = $(".send-invite-div");
     		var fb_icon = $(".facebook-icon");
     		var fr = $(".friendsright .conn");
             $(".email-friends").css({"background":"#fff","color":"#878787"});
            $(this).css({"background":"rgb(237,240,254)","color":"#101010"});
            if(fb_icon.html() == undefined){
                 window.location.href="/user/invite";

            }
                 fb_icon.show();
                 fr.show();
                 sid.hide();
     		
     	});
        $(".send-gmail,.send-yahoo").live("click",function(){
                $(this).attr("disabled",true);
        });
     	$(".invitebox").live("click",function(){
     		var  background = $(this).css("background-color");
     		
     		var val = $(this).next().val();
     	      
     		if(!isEmpty(val)){
	     		$(this).css("background-color","rgb(255,255,255)");
	     		$(this).next(".email").val("");
     		}else{
	     		$(this).css("background-color","rgb(230,230,230)");		     		
	     		$(this).next(".email").val("1");
     		}

     	});
     	function getEmail(){
     		var flag  = $(".email");
     		var email ="";
     		for(var i = 0;i<flag.length;i++){
     			var val = flag.get(i).value;
     			if(val ==1){

     				email += "\""+$(flag.get(i)).prev().prev().html()+"\",";/*.parent().find(".firstName").html();*/
     				
     			}
     		}
     	
     		return email.substr(0,email.lastIndexOf(","));
     		
     		
     		
     		
     		
     	}
     	$(".inviteAll").live("click",function(){
     			$(this).attr("disabled",true);
     			console.log(getEmail());
                if(isEmpty(getEmail())){

                    $(".attention-p").html("Choose at least one friend.").css("color","red");
                    $(".inviteAll").removeAttr("disabled");
                    return;

                }
               

     			$.post("/user/invite/friends",{'friends':"["+getEmail()+"]"},function(message){
     						if(message.statusCode == 1 && message.messageCode == 1){
     							console.log("success");

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
     			console.log(emailStr);
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
     							console.log("success");
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
     	 window.fbAsyncInit = function() {
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
           


                    (function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/en_US/sdk.js";
                        fjs.parentNode.insertBefore(js, fjs);
                      }(document, 'script', 'facebook-jssdk'));
            
             

        	function getFBlist(){
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
        	};





    });
</script>

</body>
</html>		