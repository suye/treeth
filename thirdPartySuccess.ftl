<!DOCTYPE html>
<html lang="en">
<#assign localPath="">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<#include "GA.ftl"/>
</head>
<body>
	<input id ="success" type="hidden" value="<#if (Session.success)??>${Session.success}</#if>"/>
		
	

	<input id ="bind" type="hidden" value="<#if (Session.bind)??>${Session.bind}</#if>"/>
		
	
	<script type="text/javascript" src="${localPath}/js/jquery-1.8.2.min.js"></script>
	<script>
	$(function(){
		var address = "/";
		var connectMethod = {
			//这里再写一个同名对象是因为这里不需要main。js那么多东西。这个页面不能加载更多的js了（加载不能太慢）
	            facebookLogin : 10,
	            googleplusLogin : 11,
	            twitterLogin :12,

	            facebookConnect :20,
	            googleplusConnect :21,
	            twitterConnect : 22,
	            yahooConnect :23,

	            facebookDisconnect :30,
	            googleplusDisconnect :31,
	            twitterDisconnect : 32,
	            yahooDisconnect :33,

	            facebookFriends : 40,
	            googleFriends :41,
	            yahooFriends :42,
	        };

		var loginFlag = document.getElementById("success");
		var loginStr = loginFlag.value;

		var bindFlag = document.getElementById("bind");

		var bindStr = bindFlag.value;
		
			
			if(loginStr && (bindStr ==null || bindStr =="" || bindStr == undefined)){
				
				window.opener.window.location.href="/";
				window.close();
			}

	
			
			if(bindStr){
				var parentMethod = window.opener.window.document.getElementById("connectMethod");
				

				
				switch(parseInt(parentMethod.value))
				{
			
					case connectMethod.facebookDisconnect:
						processParentWindow("facebook","Facebook","disconnect");
						/*var disconnect = $(window.opener.window.document.getElementById("facebookDisconnectBtn"));
						disconnect.toggleClass("connectFacebok");
						disconnect.toggleClass("cancelFacebok");
						disconnect.toggleClass("socialOn");
						disconnect.val("off");
						disconnect.css("background-image","url("+address+"img/NO.png)");
						disconnect.attr("id","facebookConnectBtn");
						
						window.opener.window.document.getElementById("facebookConnect").innerHTML=" Not Connect";
						var friends = $(window.opener.window.document.getElementsByClassName("facebook-friends")[0]);
							window.opener.window.console.log(friends);
							friends.trigger("click");*/
						break;

					case connectMethod.facebookConnect:
						processParentWindow("facebook","Facebook","connect");
						/*var connect = $(window.opener.window.document.getElementById("facebookConnectBtn"));
						connect.toggleClass("connectFacebok");
						connect.toggleClass("cancelFacebok");
						connect.toggleClass("socialOn");
						connect.val("on");
						connect.css("background-image","url("+address+"img/YES.png)");
						connect.attr("id","facebookDisconnectBtn");
						window.opener.window.document.getElementById("facebookConnect").innerHTML=" Connected";
						var friends = $(window.opener.window.document.getElementsByClassName("facebook-friends")[0]);
							window.opener.window.console.log(friends);
							friends.trigger("click");*/
						
						break;
					case connectMethod.googleplusConnect:
						processParentWindow("googleplus","Googleplus","connect");
						/*var title = $(window.opener.window.document.getElementsByTagName("title")).html();
						
						if(title == "Settings| Treeth"){
							var connect = $(window.opener.window.document.getElementById("googleplusConnectBtn"));
							connect.toggleClass("connectGoogle");
							connect.toggleClass("cancelGoogle");
							connect.toggleClass("socialOn");
							connect.val("on");
							connect.css("background-image","url("+address+"img/YES.png)");
							connect.attr("id","googleplusDisconnectBtn");
							
							window.opener.window.document.getElementById("googleplusConnect").innerHTML=" Not Connect";
						}else{
							window.opener.window.document.getElementById("googleData").value = 1;

							window.opener.window.$(".gmail-friends").trigger("click");
						}*/
						
					break;

					case connectMethod.googleplusDisconnect:
							processParentWindow("googleplus","Googleplus","disconnect");
						/*var title = $(window.opener.window.document.getElementsByTagName("title")).html();
						
						if(title == "Settings| Treeth"){
							var disconnect = $(window.opener.window.document.getElementById("googleplusDisconnectBtn"));
							disconnect.toggleClass("connectGoogle");
							disconnect.toggleClass("cancelGoogle");
							disconnect.toggleClass("socialOn");
							disconnect.val("off");
							disconnect.css("background-image","url("+address+"img/NO.png)");
							disconnect.attr("id","googleplusConnectBtn");
							window.opener.window.document.getElementById("googleplusConnect").innerHTML=" Connected";
						}else{
							window.opener.window.document.getElementById("googleData").value = 0;

							
						}*/
						break;
					case connectMethod.twitterConnect:
						processParentWindow("twitter","Twitter","connect");
						/*var connect = $(window.opener.window.document.getElementById("twitterConnectBtn"));
						
						connect.toggleClass("connectTwitter");
						connect.toggleClass("cancelTwitter");
						connect.toggleClass("socialOn");
						connect.val("on");
						connect.css("background-image","url("+address+"img/YES.png)");
						connect.attr("id","twitterDisconnectBtn");
						
						window.opener.window.document.getElementById("twitterConnect").innerHTML=" Not Connect";
						*/
						
						break;

					case connectMethod.twitterDisconnect:
					     processParentWindow("twitter","twitter","disconnect");
						/*var disconnect = $(window.opener.window.document.getElementById("twitterDisconnectBtn"));
						
						disconnect.toggleClass("connectTwitter");
						disconnect.toggleClass("cancelTwitter");
						disconnect.toggleClass("socialOn");
						disconnect.val("off");
						disconnect.css("background-image","url("+address+"img/NO.png)");
						disconnect.attr("id","twitterConnectBtn");
						window.opener.window.document.getElementById("twitterConnect").innerHTML=" Connected";
						*/
						break;
					case connectMethod.yahooConnect:
						 processParentWindow("yahoo","Yahoo","connect");
						/*var title = $(window.opener.window.document.getElementsByTagName("title")).html();
						
						if(title == "Settings| Treeth"){
						var connect = $(window.opener.window.document.getElementById("yahooConnectBtn"));
						
							connect.toggleClass("connectYahoo");
							connect.toggleClass("cancelYahoo");
							connect.toggleClass("socialOn");
							connect.val("on");
							connect.css("background-image","url("+address+"img/YES.png)");
							connect.attr("id","yahooDisconnectBtn");
						
							window.opener.window.document.getElementById("yahooConnect").innerHTML=" Connected ";
						}else{
							window.opener.window.document.getElementById("yahooData").value=1;
							  
				             window.opener.window.$(".yahoo-friends").trigger("click");
				           
						}*/
						break;

					case connectMethod.yahooDisconnect:
						 processParentWindow("yahoo","Yahoo","disconnect");
					 /*  	var title = $(window.opener.window.document.getElementsByTagName("title")).html();
					   	
						if(title == "Settings| Treeth"){
						var disconnect = $(window.opener.window.document.getElementById("yahooDisconnectBtn"));
						
							disconnect.toggleClass("connectYahoo");
							disconnect.toggleClass("cancelYahoo");
							disconnect.toggleClass("socialOn");
							disconnect.val("off");
							disconnect.css("background-image","url("+address+"img/NO.png)");
							disconnect.attr("id","yahooConnectBtn");
							window.opener.window.document.getElementById("yahooConnect").innerHTML="Not Connect";
						}else{
							window.opener.window.document.getElementById("yahooData").value=0;

						}*/
						break;
				}
				window.close();
			}

			function processParentWindow(thirdName,ThirdName,method){//第一个参数是首字母小写的第三方名字，第二个是首字母大写的第三方名字，第三个是绑定方法。connect、disconnect
						switch(method){
							case "connect" :
								var pageName = $(window.opener.window.document.getElementById("pageName")).val();
								
								if(pageName == 20){
									$(window.opener.window.document.getElementById(thirdName+"Data")).val(1);
									if(thirdName == "googleplus"){
										window.opener.window.$(".gmail-friends").trigger("click");
									}else if(thirdName == "yahoo"){
										window.opener.window.$(".yahoo-friends").trigger("click");
									}
									
									break;
								}
								var connect = $(window.opener.window.document.getElementById(thirdName+"ConnectBtn"));
									connect.toggleClass("connect"+ThirdName);
									connect.toggleClass("cancel"+ThirdName);
									connect.toggleClass("socialOn");
									connect.val("on");
									connect.css("background-image","url("+address+"img/YES.png)");
									connect.attr("id",thirdName+"DisconnectBtn");
							
									window.opener.window.document.getElementById(thirdName+"Connect").innerHTML=" Not Connect";
							break;

							case "disconnect" :

								
								var disconnect = $(window.opener.window.document.getElementById(thirdName+"DisconnectBtn"));
									disconnect.toggleClass("connect"+ThirdName);
									disconnect.toggleClass("cancel"+ThirdName);
									disconnect.toggleClass("socialOn");
									disconnect.val("off");
									disconnect.css("background-image","url("+address+"img/NO.png)");
									disconnect.attr("id",thirdName+"ConnectBtn");

									window.opener.window.document.getElementById(thirdName+"Connect").innerHTML="Not Connect";
							break;
						}
					
						
				}
	});
	</script>
</body>
</html>