<!DOCTYPE html>
<html>
<head>
<#assign localPath="">
    <title>Login</title>
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




    <div class="login_now">
        <ul class="login">
            <li class="q">
                <p class="l">Log In to Treeth  <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></p>
            </li>
            <li class="ftg">
                <ul class="list-inline">
                    <li><a href="/login/facebook"><img src="${localPath}/img/log-in-facebook01.png"></a></li>
                    <li class="center-li"><a href="/login/twitter"><img src="${localPath}/img/log-in-twitter01.png"></a></li>
                    <li><a href="/login/googleplus"><img src="${localPath}/img/log-in-google_plus01.png"></a></li>
                </ul>
            </li>
            <li class="p login-p">
               <form role="form">
                   <div class="form-group">
                       <input type="email" class="form-control input" id="InputEmail" placeholder="Enter email" name="username">
                       <p class="point"></p>
                   </div>
                   <div class="form-group">
                       <input type="password" class="form-control input" id="InputPassword" placeholder="Password" name="password">
                       <p class="point"></p>
                       <label class="password_login" for="InputPassword">Password</label>
                   </div>
                   <div class="form-group form-last">
                       <ul class="list-inline">
                           <li class="other">
                               <ul>
                                   <li><a href="forgot/password" class="forgot-pwd">Forgot your password?</a></li>
                                   <li><a href="register" class="signup-a"> Sign up now</a></li>
                               </ul>
                           </li>
                           <li class="login-b"><button type="button" class="btn btn-default btn-sm" id="login">Log In</button></li>
                       </ul>

                   </div>

               </form>
            </li>
        </ul>
    </div>

<div class="layer_mask oops_layer">
<div class="oops">
    <ul>
        <li class="OopsHead"><span>Oops!</span> <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></li>
        <li id="describe"></li>
        <li class="OopsFooter"><button type="button" class="mybtns btn btn-default btn-sm" id="ok">Okay</button></li>
    </ul>
</div>
</div>



<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
    $(function(){
      $(".div_off").click(function(){
          window.history.back(-1);
      });
      
      $(window).keypress(function(btn){
        if(btn.keyCode ==13){
         
          if(!iflogin) $("#login").trigger("click");
        }
      });

    });
</script>

</body>
</html>