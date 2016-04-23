<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<#include "GA.ftl"/>
</head>
<body>
	<input id ="failed" type="hidden" value="<#if (Session.failed)??>${Session.failed}</#if>">
		
	</input>
	<input id ="bind" type="hidden" value="<#if (Session.bind)??>${Session.bind}</#if>">
		
	</input>
	<h1 id="result"></h1>
	<script>
		var loginFlag = document.getElementById("failed");
		var loginStr = loginFlag.value;

		var bindFlag = document.getElementById("bind");
		var bindStr = bindFlag.value;
			
			if(loginStr && !bindStr){
				
				window.close();
			}
			if(loginStr && bindStr){
				document.getElementById("result").innerHTML="bind was failed";
				
			}

	</script>
</body>
</html>