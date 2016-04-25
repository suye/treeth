<!DOCTYPE html>
<html>
<head>
<#assign localPath="">
    <title>Reset Password</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  
    <link href="${localPath}/css/bootstrap3/bootstrap.css" rel="stylesheet">
    

    <link href="${localPath}/css/docs.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="http://fineui.com/lib/html5shim/html5.js"></script>
    <![endif]-->


    <link href="${localPath}/css/style.css" rel="stylesheet">
    <style type="text/css">
        .three{
            background: #f5f5f5;
            height: 50px;
        }
        .three button{
            display: inline;
        }
        .point{
            padding: 10px 0 0 0;
            margin-left: 24px;
        }
    </style>
    <#include "GA.ftl"/>
</head>
<body class="mybody">
<div class="container-fluid topbar">
  <a href="/"  class="logo"><img src="${localPath}/img/logo.png"></a>
</div>
<div class="container comeon">
    <span>Come on in! Join Treeth today...it only takes like a second or so.</span>
    <a href="/register" role="button" class="btn btn-default addModal"  id="jointreeth">
                <span >Join Treeth

                </span>
    </a>
    <a href="/login" role="button" class="btn btn-default addModal"  id="logintreeth">
                <span >Log in

                </span>
    </a>
</div>
<div class="container-fluid center_panel" id="reset1" >
    <div class="resetpwd"  style="background:#fff;">
       <form role="form" >
            <ul>
                <li  class="one"><p>Reset Password</p></li>
                <li class="two">
                    <div class="form-group">
                        <input type="email" class="form-control input" id="InputEmail" placeholder="Enter email">
                        <p class="point"></p>
                    </div>
                </li>

                <li class="three">
                    <button type="button" class="btn btn-default" id="ResetPassword"><span>Reset Password</span></button>
                </li>
            </ul>
       </form>
    </div>

</div>
<div class="container-fluid center_panel" id="reset2">
    <div class="resetpwd">
        <form role="form">
            <ul>
                <li  class="one"><p>An email is headed your way!</p></li>
                <li class="two meg">
                   <p>We'll send a message to <span id="email"></span>. so you can pick your new password.</p>
                </li>
                <li class="three">
                    <button type="button" class="btn btn-default" id="ok"><span style="color: rgb(248,96,5);font-weight: bold;font-size: 14px;">Okay</span></button>
                </li>
            </ul>
        </form>
    </div>

</div>


<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
    $(function(){
        $("#ok").click(function(){
            window.location="/";
        });
    });
</script>

</body>
</html>