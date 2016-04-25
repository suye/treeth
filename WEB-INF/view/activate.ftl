<!DOCTYPE html>
<html>
<head>
<#assign localPath="">
    <title>Reset Password</title>
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
        .illegal-link{
            width: 730px;
            height: 215px;
            margin:auto;
            margin-top: 60px;
            text-align: center;
            padding: 0;
        }
        .illegal-link p{
            font-size: 24px;
            font-family: "Arial";
            line-height: 24px;

        }
    </style>
    <#include "GA.ftl"/>
</head>
<body class="mybody">
<div class="container-fluid topbar">

</div>
<div class="container illegal-link">
    <p><img src="${localPath}/img/illegal_link.png"></p>
    <p>Sorry!</p>
 
    <#if Request.userActivateResultCode == 3>
    <p>You have clicked on an invalid link.Please make sure that you </p>
    <p>have typed the link correctly. If are copying this link form a mail</p>
    <p>reader please emsure that you have copied all the lines in the link.</p>
    </#if>
    <#if Request.userActivateResultCode == 4>
    <p>You have been confirmed! Happy posting!</p>
    </#if>
</div>

<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
    /*$(".start").trigger("click");*/
</script>

</body>
</html>