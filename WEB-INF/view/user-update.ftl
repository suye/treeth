<!DOCTYPE html>
<html>
<head>


<#assign localPath=""/>


    <title>Settings</title>
  
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <link href="${localPath}/css/bootstrap3/bootstrap.min.css" rel="stylesheet">
    <link href="${localPath}/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
    <link href="${localPath}/css/docs.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="http://fineui.com/lib/html5shim/html5.js"></script>
    <![endif]-->


    <link href="${localPath}/css/style.css" rel="stylesheet">
    <style type="text/css">
        #destination{
            filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(true,sizingMethod=scale);
            width: 74px;
            height: 74px;
            border: 1px solid #e2e3e5;
            overflow: hidden;
            border-radius: 4px;
        }
        .radio-inline{
            cursor: auto;
        }
        #faceImage{
           width: 74px;
            height: 74px;
            padding: 0;
            margin:0;
        }

        .radioSex{
            cursor: pointer;
            margin-top: 15px !important;

        }
        #SexFemale{
            margin-left: 100px;
        }
        #imgUpload{
            width: 168px;
            position: absolute;
            margin-top: 0;
            margin-left: 500px;
        }
        #setPWD{
            color: rgb(248,96,5);
            margin-left: 24px;
        }
        .socialUrl{
            color: rgb(248,96,5);
        }
        .socialOff{
            width: 61px;
            height: 28px;
            background-image: url("${localPath}/img/NO.png");
            border: 0;
            font-size: 0;
            outline: none;
        }
        .socialOn{
             background-image: url("${localPath}/img/YES.png");
           
        }
        .socialOff:focus{
            border: 0;
            outline: none;
        }
        
        .pwdfailed{
            color: #f86005;
            display: none;
        }
        .center_panel{
          height: 100%;
        }
    
    </style>
    
<#include "GA.ftl"/>
</head>
<body class="mybody">
  <#include "header.ftl">
<div class="container-fluid center_panel">
  
    <div class="settings" >
        <form  role="form" enctype="multipart/form-data" method="post" id="settingsForm" action="/user/update">
            <div class="basics">
                <ul>
                    <li class="headBasics"><span>Basics</span></li>
                    <input style="display:none;" name="id" value="${Request.userData.id}">
                    <li class="ne regular">  <label class="radio-inline"><span>Email Address</span></label>  <label class="radio-inline"><input type="Email" class="form-control input Email"   id="SetEmail" placeholder="Add Email" value="<#if Request.userData.username??>${Request.userData.username}<#else>未成功获取邮箱</#if>" readonly></label></li>
                    <li class="pg regular">  <label class="radio-inline"><span>Passsword</span></label>   <label class="radio-inline checkPassword">
                      <#if Request.setPasswordType??>
                        <#if Request.setPasswordType == 2>
                        <a href="javascript:" id="changePassword">Change Password</a>
                        <#else>
                        <a href="javascript:" id="setPassword">Set Password</a>
                        </#if>
                      </#if>
                    </label></li>
                    <li class="pg regular">  <label class="radio-inline"><span>Gender</span></label>

                            <input type="radio" name="sex" id="sexMale" value="1" class="radioSex" <#if Request.userData.sex == 1>checked</#if>> Male


                            <input type="radio" name="sex" id="SexFemale" value="2" class="radioSex" <#if Request.userData.sex == 2>checked</#if>> Female
                    </li>
                    <li class="ne regular"> <label class="radio-inline"><span>Name</span></label>
                        <label class="radio-inline">
                            <input type="text" class="form-control input Name"  placeholder="FirstName" name="firstName" value="<#if Request.userData.firstName??>${Request.userData.firstName}<#else>为成功获取fname</#if>">
                        </label>
                        <label class="radio-inline">
                            <input type="text" class="form-control input Name" placeholder="LastName" name="lastName" value="<#if Request.userData.lastName??>${Request.userData.lastName}<#else>为成功获取lname</#if>">
                        </label>
                    </li>
                    <li class="pic regular"> <label class="radio-inline"><span>Picture</span></label>
                        <label class="radio-inline" id="destination">
                            <img src="${Request.userData.pictureUrl}" alt="face" class="img-rounded" id="faceImage">
                        </label>
                        <label class="radio-inline">
                            <div class="btn btn-default fileinput-button">
                                  <span>Change Pictrue</span>
                              <input id="imgUpload" type="file" name="userPicture" draggable="true" />
                            </div>
                        </label>
                    </li>
                </ul>
            </div>
        <div class="socialNet">
                <li class="headBasics "><span>Social Networks</span></li>
                <li class="connect"><label class="radio-inline firstLabel smallFont"><img src="${localPath}/img/log-in-facebook01.png">
                    <#if Request.userConnectFacebook??>
                        <#if Request.userConnectFacebook>
                          Connect
                        <#else>
                          Not Connect
                        </#if>
                      </#if>
  
                </label><label class="radio-inline"></label></li>
                <li class="connect"><label class="radio-inline firstLabel">Log in with Facebook</label>
                    <label class="radio-inline">
                      <#if Request.userConnectFacebook??>
                        <#if Request.userConnectFacebook>
                         <a href="/cancel/connect/facebook"> <input type="button" class="btn btn-default socialOff socialOn connectFacebok" value="on"></a>
                        <#else>
                         <a href="/connect/facebook"> <input type="button" class="btn btn-default socialOff cancelFacebok" value="off"></a>
                        </#if>
                      </#if>
                    </label>
                      
                    <label class="radio-inline smallFont">Use your Facebook account to log in</label></li>
                <li class="connect"><label class="radio-inline firstLabel">Link to Timeline</label>
                    <label class="radio-inline">
                        <a href="javascript:"><input type="button" class="btn btn-default socialOff" value="off"></a>
                    </label>
                    <label class="radio-inline smallFont">Post your activity to Timeline</label></li>
                <li class="connect"><label class="radio-inline firstLabel smallFont"><img src="${localPath}/img/log-in-twitter01.png">
                     <#if Request.userConnectTwitter??>
                        <#if Request.userConnectTwitter>
                          Connect
                        <#else>
                          Not Connect
                        </#if>
                      </#if>


                </label>
                    <label class="radio-inline"></label></li>
                <li class="connect"><label class="radio-inline firstLabel">Log in with Twitter</label>
                    <label class="radio-inline">
                      <#if Request.userConnectTwitter??>
                        <#if Request.userConnectTwitter>
                         <a href="/cancel/connect/twitter"><input type="button" class="btn btn-default socialOff socialOn connectTwitter" value="on"></a>
                        <#else>
                         <a href="/connect/twitter"><input type="button" class="btn btn-default socialOff cancelTwitter" value="off"></a>
                        </#if>
                      </#if>
                    </label>
                    <label class="radio-inline smallFont">Use your Twitter account to log in</label></li>
                <li class="connect"><label class="radio-inline firstLabel smallFont"><img src="${localPath}/img/log-in-google_plus01.png">
                      <#if Request.userConnectGoogleplus??>
                        <#if Request.userConnectGoogleplus>
                          Connect
                        <#else>
                          Not Connect
                        </#if>
                      </#if>
                </label>
                    <label class="radio-inline"></label></li>
                <li class="connect"><label class="radio-inline firstLabel">Connect with Google+</label>
                    <label class="radio-inline">
                       <#if Request.userConnectGoogleplus??>
                        <#if Request.userConnectGoogleplus>
                         <a href="/cancel/connect/googleplus"><input type="button" class="btn btn-default socialOff socialOn connectGoogle" value="on"></a>
                        <#else>
                         <a href="/connect/googleplus"><input type="button" class="btn btn-default socialOff cancelGoogle" value="off"></a>
                        </#if>
                      </#if>
                    </label>
                    <label class="radio-inline smallFont">
                        Connect to Google+
                    </label></li>
                <li class="lastli">
                    <label class="radio-inline">
                        <button type="button" class="btn btn-default" id="cancelSet"><span>Cancel</span></button>
                    </label>
                    <label class="radio-inline">
                        <button type="button" class="btn btn-default changepwd" id="SaveSet"><span>Save Settings</span></button>
                    </label>
                </li>
            </div>
        </form>
    </div>

    <div class="container passwordSuccess">
        <p><img src="${localPath}/img/fb-icon.png"></p>
        <p>Your password has been changed successfully!</p>
        <p><button type="button" class="btn btn-default" id="ok_changePassword"><span style="font-weight: bold;font-size: 14px;">Okay</span></button>
        </p>
    </div>
    <div class="container-fluid center_panel changePassword layer_mask">
        <div class="chpwd">
            <form role="form" method="post">
                <ul>
                    <li class="q chq"><p class="l">Change Password <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></p></li>
                    <li class="pwdInput">
                        <div class="form-group">
                            <p class="opt">Old Password</p>
                            <input type="password" class="form-control input" id="cOldPassword" >

                        </div>
                    </li>
                    <P class="pwdfailed piw">password is wrong</P>
                    <li class="pwdInput">
                        <div class="form-group">
                            <p class="opt">New Password</p>
                            <input type="password" class="form-control input" id="cNewPassword">

                        </div>
                    </li>

                    <li class="pwdInput">
                        <div class="form-group">
                            <p class="opt npa">New Password Again</p>
                            <input type="password" class="form-control input" id="cNewPasswordAgain">

                        </div>
                    </li>
                    <P class="pwdfailed pdm">Passwords don't match</P>
                    <li class="form-bottom">
                        <div class="form-group">
                            <ul class="list-inline">

                                <li  class="forgot-pwd"><a href="/forgot/password">Forgot your password?</a></li>
                                <li><button type="button" class="btn btn-default btn-sm" id="cancelCPWD">Cancel</button></li>

                                <li class="login-b"><button type="button" class="btn btn-default btn-sm" id="submitChangePassword">Change Password</button></li>
                            </ul>


                        </div>
                    </li>
                </ul>
            </form>
        </div>

    </div>
    <div class="container-fluid center_panel setPassword layer_mask">
        <div class="chpwd">
            <form role="form" method="post">
                <ul>
                    <li class="q chq"><p class="l">Set Password <button type="button" class="close div_off"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></p></li>

                    <li class="pwdInput">
                        <div class="form-group">
                            <p class="opt">New Password</p>
                            <input type="password" class="form-control input" id="sNewPassword" >

                        </div>
                    </li>
                    <li class="pwdInput">
                        <div class="form-group">
                            <p class="opt npa">New Password Again</p>
                            <input type="password" class="form-control input" id="sNewPasswordAgain" >
                        
                        </div>
                    </li>
                    <P class="pwdfailed pdm">Passwords don't match</P>
                    <li class="form-bottom">
                        <div class="form-group">
                            <ul class="list-inline">


                                <li><button type="button" class="btn btn-default btn-sm" id="cancelSPWD" 
                                  style="font-size:blod;">Cancel</button></li>

                                <li class="login-b"><button type="button" class="btn btn-default btn-sm" id="submitSetPassword" style="color:rgb(237,96,5); font-size:blod;">Set Password</button></li>
                            </ul>


                        </div>
                    </li>
                </ul>
            </form>
        </div>

    </div>
</div>

<#include "dropdown.ftl">  
<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script type="text/javascript" src=""></script>
<script src="${localPath}/js/jquery.form.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>

<script type="text/javascript">
   $(function() {
      $("#cancelSet").click(function(){
          window.location="/";
       });
      
      $("#ok_changePassword").click(function(){
        $(this).parents(".passwordSuccess").hide();
      });

      $(".socialOff").click(function(){
          $(this).css({"border":0,"outline":"none"});
      });

       /*设置密码*/
       var snewPassword = $("#sNewPassword");
       var snewPasswordAgain = $("#sNewPasswordAgain");
       snewPasswordAgain.blur(function(){

           if(snewPassword.val() == snewPasswordAgain.val() && snewPasswordAgain.val() !=''){
               snewPasswordAgain.parent().removeClass("has-error");
               snewPassword.parent().removeClass("has-error");
               snewPassword.parent().addClass("has-success");
               snewPasswordAgain.parent().addClass("has-success");
               snewPasswordAgain.prev().css("color","#101010");
               snewPasswordAgain.css("background","#ffffff");
               snewPasswordAgain.css("border-width","1px");
               $(".pdm").hide();

               checkFlag =true;

           }else{
               snewPasswordAgain.parent().removeClass("has-success");
               snewPassword.parent().removeClass("has-success");
               snewPasswordAgain.parent().addClass("has-error");
               snewPasswordAgain.prev().css("color","red");
               snewPasswordAgain.css("background","rgb(227,168,170)");
               snewPasswordAgain.css("border-width","2px");
               $(".pdm").show();
               checkFlag =false;

           }
       });



       var socialOff = $(".socialOff");
       socialOff.live("click",function(){
             if( $(this).val() == "on"){
                $(this).css("background-image","url(/img/NO.png)");

             }else{
               $(this).css("background-image","url(/img/YSE.png)");
             } 
       });
      
       socialOff.focus(function(){
           $(this).css("background-color","none");
       });

       $("#cancelSPWD").click(function(){
           $(this).parents(".setPassword").hide();
       });
       $("#submitSetPassword").click(function(){
           var newPassword = $("#sNewPasswordAgain").val();
           if(newPassword =='' || !checkFlag)
                return;
           $.post(
             "/user/set/password",
             {"newPassword":newPassword},
              function (message) {
                   var messageCode  = message.messageCode;
                   var statusCode  = message.statusCode;
                  
                   if(messageCode == 1 && statusCode==1){
                      $(".setPassword").hide();
                      $(".passwordSuccess").show();
                      $(".checkPassword").html('<a href="javascript:" id="changePassword">Change Password</a>');
                   }else{
                      $(".oops_layer").show();
                      $("#describe").html("Internal wrong.");
                   }
               },"json"
             );
           
          
       });
   $("#imgUpload").click(function(){
      $(this).css("outline","none");

   });

   var imageFlag = true;
 $("#imgUpload").change(function () {
 
    var pic = document.getElementById("faceImage"),
        file = document.getElementById("imgUpload");
 
    var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
 
     // gif在IE浏览器暂时无法显示
     if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
         $(".oops_layer").show();
         $("#describe").html("That filetype is not supported.");
         imageFlag = false;
         return;
     }
     imageFlag = true;
     var isIE = navigator.userAgent.match(/MSIE/)!= null,
         isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
 
     if(isIE) {
        file.select();
        file.blur();
        var reallocalpath = document.selection.createRange().text;
        
        // IE6浏览器设置img的src为本地路径可以直接显示图片
         if (isIE6) {
            pic.src = reallocalpath;

         }else {
            // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
             pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";
             pic.style.width="74px";
             pic.style.height="74px";
             // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
             pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
         }
     }else {
        html5Reader(file,pic);
     }
 
  });

 function html5Reader(file,pic){
     var file = file.files[0];
     var reader = new FileReader();
     reader.readAsDataURL(file);
     reader.onload = function(e){
    
         pic.src=e.target.result;
     }
 }

  $("#SaveSet").click(function(){

    if(imageFlag){
      var sex1 = $("#sexMale").is(":checked");
      var sex2 = $("#SexFemale").is(":checked");
      if(sex1 !=true && sex2 !=true){
        $(".oops_layer").show();
        $(" #describe").html(" Gender is requried.");
        return;
      }
      $(this).attr("disabled","disabled");
      $("#settingsForm").submit();
    }
     });
  });
</script>

</body>
</html>