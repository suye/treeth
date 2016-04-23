<!DOCTYPE html>

<#assign localPath="">

<html >
<head>
    <title></title>
   
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <title>page not found</title>
    <link rel="icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${localPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${localPath}/css/bootstrap3/bootstrap.css">
    <link rel="stylesheet" href="${localPath}/js/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${localPath}/js/kindeditor/plugins/code/prettify.css"/>
    <link rel="stylesheet" href="${localPath}/css/style.css">
    <style type="text/css">
        body{
            background:#e9e9e9;
            
        }
        .watchout{
            margin: auto;
            display: block;
        }
        .msg{
            font-family: "Arial"!important;
            font-weight: bold;
            font-size: 24px;
            color: #878787;
            line-height: 30px;
            width: 500px;
            text-align: center;
            margin: auto;

        }
        .say{
            text-align: center;
            margin-top: 10%;
            font-weight: bold;
            margin-bottom: 20px;
        }

    </style>

        
        
    <#include "GA.ftl"/>
</head>
<body >
    <#include "header.ftl"/>
   <h3 class="say">You don't seem to have the permission to access this page.</h3>
   
    <div class="errorImg ">
        <div class="col-xs-3 part home">
            <img src="${localPath}/img/homeFeed.png" alt="">
            <p class="link">Home Feed</p>
        </div>
        
        <div class="col-xs-3 part popular">
            <img src="${localPath}/img/popular.png" alt="">
            <p class="link">Popular</p>
        </div>
        <div class="col-xs-3 part video">
            <img src="${localPath}/img/videos.png" alt="">
            <p class="link">Video</p>
        </div>
        <div class="col-xs-3 part game">
            <img src="${localPath}/img/games.png" alt="">
            <p class="link">Games</p>
        </div>
        

    </div>
    <#include "dropdown.ftl"/>
    <script src="${localPath}/js/jquery-1.8.2.min.js"></script>
    <script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
    <script src="${localPath}/js/kindeditor/kindeditor.js"></script>
    <script src="${localPath}/js/kindeditor/lang/en.js"></script>
    <script src="${localPath}/js/kindeditor/plugins/code/prettify.js"></script>
    <script  src="${localPath}/js/jquery.tagsinput.js"></script>
    <script src="${localPath}/js/jquery.form.js"></script>
    <script src="${localPath}/js/project.js"></script>
    
    <script src="${localPath}/js/ajaxfileupload.js"></script>
    <script src="${localPath}/js/main.js"></script>
</body>
</html>