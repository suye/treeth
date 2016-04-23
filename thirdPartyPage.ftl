<!DOCTYPE html>
<html lang="en">

	<#assign localPath="">
<head>
	<meta charset="UTF-8">
	<title>thrid party page!</title>
	<#include "GA.ftl"/>
</head>
<body>

	

	<script type="text/javascript" src="${localPath}/js/jquery-1.8.2.min.js"></script>
	<script>

		
	$(function(){
			var connectMethod = {
				//这里再写一个同名对象是因为这里不需要main。js那么多东西。这个页面不能加载更多的js了（加载不能太慢）
	            facebookLogin : 10,
	            googleplusLogin : 11,
	            twitterLogin :12,

	            facebookConnect :20,
	            googleplusConnect :21,
	            twitterConnect : 22,
	            yahooConnect : 23,
	            
	            facebookDisconnect :30,
	            googleplusDisconnect :31,
	            twitterDisconnect : 32,
	            yahooDisconnect : 33,

	            facebookFriends : 40,
	            googleFriends :41,
	            yahooFriends :42,
	        };

			var parentMethod = window.opener.document.getElementById("connectMethod");
			
				
			switch(parseInt(parentMethod.value))
			{
			
				case connectMethod.facebookLogin:
					window.location.href = "/login/third/facebook";
					break;
				case connectMethod.googleplusLogin:
					window.location.href = "/login/third/googleplus";
					break;
				case connectMethod.twitterLogin:
					window.location.href = "/login/third/twitter";
					break;
				case connectMethod.facebookDisconnect:
					window.location.href = "/cancel/connect/facebook";
					break;
				case connectMethod.facebookConnect:
					window.location.href = "/connect/facebook";
					break;
				case connectMethod.googleplusDisconnect:
					window.location.href = "/cancel/connect/googleplus";
					break;
				case connectMethod.googleplusConnect:
					window.location.href = "/connect/googleplus";
					break;
				case connectMethod.twitterDisconnect:
					window.location.href = "/cancel/connect/twitter";
					break;
				case connectMethod.twitterConnect:
					window.location.href = "/connect/twitter";
					break;
				case connectMethod.yahooConnect:
					window.location.href = "/connect/yahoo";
					break;
				case connectMethod.yahooDisconnect:
					window.location.href = "/cancel/connect/yahoo";
					break;
			}
			
				

					 
	});
			
		
	</script>

</body>
</html>