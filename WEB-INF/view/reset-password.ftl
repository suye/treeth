<!DOCTYPE html>
<html>
<head>
<#assign localPath=""/>
    <title>Pick a new password</title>
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
        .illegal-link a{

            font-weight: bold;
            color: #101010;

        }
    </style>
    <#include "GA.ftl"/>
</head>
<#if Request.userResetPasswordResultCode ==5>
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
    <a href="javascript:" role="button" class="btn btn-default addModal"  id="logintreeth">
                <span >Log in

                </span>
    </a>
</div>
<div class="container-fluid center_panel">
    <div class="pickNewPassword" style="background:#fff;">
        <form role="form">
            <ul>
                <li  class="one"><p>Pick a new Password</p></li>
                <li class="ptwo">
                    <div class="form-group">
                        <p class="input-left">New Password</p>
                        <input type="password" class="form-control input" id="newPassword" >
                        <input type="text" id="code" style="display:none" value="${Request.code}">
                    </div>
                </li>
                <li class="pthree">
                    <div class="form-group">
                        <p class="input-left">Type it Again</p>
                        <input type="password" class="form-control input" id="typeAgain"  name="typeAgain">
                    </div>
                </li>
                <li class="three">
                    <p class="point NotMatch">&nbsp;</p><button type="button" class="btn btn-default changepwd" id="submitPNP"><span>Change Password</span></button>
                </li>
            </ul>
        </form>
    </div>

</div>
<div class="container passwordSuccess">
        <p><img src="/img/fb-icon.png"></p>
        <p>Your password has been changed successfully!</p>
        <p><button type="button" class="btn btn-default" id="ok"><span style="font-weight: bold;font-size: 14px;">Okay</span></button>
        </p>
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

<#elseif  Request.userResetPasswordResultCode == 4>
<body style="background: #e9e9e9">
<div class="container-fluid topbar">

</div>
<div class="container illegal-link">
    <p><img src="${localPath}/img/illegal_link.png"></p>
    <p>Sorry!</p>
    <p>The password reset link was invalid/expired(valid for 24 hr),</p>
    <p>possibly because it has already been used.Please request</p>
    <p><a href="">a new Password reset.</a></p>
</div>

.user<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>

<script type="text/javascript">
    /*$(".start").trigger("click");*/
</script>
</body>
<#elseif  Request.userResetPasswordResultCode == 3>
<body style="background: #e9e9e9">
<div class="container-fluid topbar">

</div>
<div class="container illegal-link">
    <p><img src="${localPath}/img/illegal_link.png"></p>
    <p>Sorry!</p>
    <p>The password reset link was invalid/expired(valid for 24 hr),</p>
    <p>possibly because it has already been used.Please request</p>
    <p><a href="/forgot/password">a new Password reset.</a></p>
</div>

<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>

<script type="text/javascript">
    
</script>
</body>
</#if>
</html>