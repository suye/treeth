<!DOCTYPE html>
<html>
<head>
<#assign localPath=""/>
    <title>Sign up</title>
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
       #form-signup{

            background: rgb(233,233,233);
        }
        .div_input{

            background-color: rgb(233,233,233);;

        }
        #password_sign{
           font-family: "Georgia";
           color: #575757;
           font-size: 12px;
           font-style: italic;
           position: absolute;
           margin-top:-27px;
           margin-left:47px;
           padding-left: 10px;
        font-weight: normal;
           width: 190px;
           height: 25px;
           line-height: 25px;
        }

    </style>
    <#include "GA.ftl"/>
</head>
<body class="mybody">
<div class="container-fluid topbar">
      <a href="/"  class="logo"><img src="${localPath}/img/logo.png"></a>
</div>
<div class="container-fluid center_panel">

    <div id="sign-up" >
        <div id="megdiv1"><p id="meg1">"<span id="namef"></span>&nbsp;<span id="namel"></span>" has been already claimed</p></div>
        <div id="megdiv2"><p id="meg2"></p></div>
        <div id="megdiv3"><p id="meg3">There was a problem logging in, try again later.</p></div>
        <form role="form" method="post" id="form-signup" action="register">
        <div class="div_input container">
          <div class="input-name">
            <div class="form-group uname">
                <input type="text" class="form-control input " id="FirstName" placeholder="First Name" name="firstName">

            </div>
            <p class="checkP"></p>
            <div class="form-group uname">
                <input type="text" class="form-control input " id="LastName" placeholder="Last Name" name="lastName">
            </div>
			 <p class="checkP"></p>
          </div>
          <div class="input-info">
            <div class="form-group uinfo">
                <input type="email" class="form-control input " id="EmailAddr" placeholder="Email Address" name="username">

            </div>
              <p class="checkP"></p>
            <div class="form-group uinfo">
                <input type="password" class="form-control input " id="pwd" placeholder="Password" name="password">
                <label id="password_sign" for="pwd">Password</label>
            </div>
              <p class="checkP"></p>
              <div class="checkbox usex">
                  <label>
                     <input type="radio" value="1" class="sex-radio" name="sex" checked="checked"><span class="sex">Male</span>
                  </label>
                  <label>
                      <input type="radio" value="2" class="sex-radio" name="sex"><span class="sex">Female</span>
                  </label>
              </div>
          </div>
        </div>
        <p class="declare">By creating an account, I accept <a href="#" class="privacy_policy">Privacy Policy</a>.</p>
        <p class="declare"><a href="login" class="privacy_policy">Log In</a>.</p>
        <div class="div_button container">
            <div class="cancel-button">
            <button type="button" class="btn btn-default sign-button" id="cancelSign"><span>Cancel</span></button>
            </div>
            <div class="signup-button">
            <button type="button" class="btn btn-default sign-button" id="submitSign"><span>Sign Up</span></button>
            </div>
        </div>
        </form>
    </div>

</div>


<script src="${localPath}/js/jquery-1.8.2.min.js"></script>
<script src="${localPath}/js/bootstrap3/bootstrap.js"></script>
<script src="${localPath}/js/main.js"></script>
<script src="${localPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
   $(function(){
    var emailFlag = false;
    var nameFlag = false;
    var fname = $("#FirstName");
    var lname = $("#LastName");
    var eaddr = $("#EmailAddr");
    var pwd = $("#pwd");
    var spaceReg =/^\s+$/;
    fname.blur(function(){

        if(fname.val() == '' || spaceReg.test(fname.val()))
        $(this).parent().next().html("Required");
    });
    /*注册用户名验证模块*/
    /*fname.blur(function(){
     $.post(

     "",
     {

     },
     function(message) {
     $("#request-process-patent").html("提交数据失败！");
     }888
     );
     });*/
    fname.keypress(function(event){
        if( spaceReg.test(fname.val())){

            $(this).parent().next().html("Required");
            $(this).parent().removeClass("has-success");
            $(this).parent().addClass("has-error");

        }else{

            $(this).parent().next().html("");
            $(this).parent().removeClass("has-error");
            $(this).parent().addClass("has-success");
        }
    });
     lname.keypress(function(event){
        if( spaceReg.test(fname.val())){

            $(this).parent().next().html("Required");
            $(this).parent().removeClass("has-success");
            $(this).parent().addClass("has-error");

        }else{

            $(this).parent().next().html("");
            $(this).parent().removeClass("has-error");
            $(this).parent().addClass("has-success");
        }
    });
    lname.blur(function(){
        if(lname.val() == '' || spaceReg.test(lname.val())){
            $(this).parent().next().html("Required");
        }else{
            $(this).parent().next().html("");
            $.post( "/name/exist",

                    {"firstName":fname.val(),"lastName":lname.val()},

                    function (message) {
                        var messageCode  = message.messageCode;
                        var statusCode  = message.statusCode;
						
                        if(messageCode == 1 && statusCode==1){
                            var exist = message.exist;
							
                            if(exist){
                                nameFlag = false;
                                megdiv1.show();
                                $("#namef").html(fname.val());
                                $("#namel").html(lname.val());
                                setTimeout(function(){
                                    megdiv1.hide();
                                },5000);
                            }else{
                                nameFlag = true;
                                megdiv1.hide();
                            }
                        }else{
                            alert(message.statusCodeReason+"    "+message.messageCodeReason);
                        }
                    },"json");
        }
    });
    eaddr.blur(function(){
        var flag = checkEmail(eaddr);


        if( flag ==true){

            
            $.post(
                    "/account/exist",

                    {"username":eaddr.val()},

                    function (message) {
                        var messageCode  = message.messageCode;
                        var statusCode  = message.statusCode;

                        if(messageCode == 1 && statusCode==1){
                            var exist = message.exist;
							
                            if(exist){
                                emailFlag = false;
                               megdiv2.show().children("p").html("That email's taken. <a href='/forgot/password' style='color:rgb(248,96,5)'>Forget your password</a>?");
                                  eaddr.parent().next().html("");
                                setTimeout(function(){
                                    megdiv2.hide();
                                },5000);
                            }else{
                                emailFlag = true;
                                megdiv2.hide();
                            }
                        }else{
                            alert(message.statusCodeReason+"    "+message.messageCodeReason);
                        }
                    },"json"
            );
			eaddr.parent().next().html("");
        }else if(flag == false){

            megdiv2.show().children("p").html("Not a valid email address.");
            eaddr.parent().next().html("");
        }else if(flag == null){
            eaddr.parent().next().html("Required");
        }


    });
    pwd.keyup(function(event){
        var meg = pwd.val();

        var regNum = /^[A-Za-z].*[0-9]|[0-9].*[A-Za-z]$/;

      if(meg.length<6){

            pwd.parent().next().html("too short").css("color","red");
            megdiv3.show().children("p").html("The password must be at least 6 characters.");
            setTimeout(function(){
                megdiv3.hide();
            },5000);

        }else if(!regNum.test(meg)){
            pwd.parent().next().html("too simple").css("color","orange");
            megdiv3.show().children("p").html("Please make a stronger password.");
            setTimeout(function(){
                megdiv3.hide();
            },5000);

        }else{
            pwd.parent().next().html("");
            megdiv3.hide();
        }
    });


    /*注册提交模块*/
    $("#submitSign").click(function(){
           
        
        if(fname.val()=='' || spaceReg.test(fname.val())){
            fname.parent().next().html("Required");
           
        }
        if(lname.val() == '' ){
            lname.parent().next().html("Required");
            
        }
        if(checkEmail(eaddr)==null){
         fname.parent().next().html("Required");
            
        }
        
        if(pwd.val()=='' || pwd.val().length<6){
            pwd.parent().next().html("Required").css("color","red");
            
        }
        if(fname.val()=='' || spaceReg.test(fname.val())){
           return;
           
        }
        if(lname.val() == '' ){
              return;
            
        }
        if(checkEmail(eaddr)==null){
            return;
            
        }
        
        if(pwd.val()=='' || pwd.val().length<6){
             return;
            
        }
        if(checkEmail(eaddr)==false && emailFlag){
            return;
        }
        if(emailFlag == false){
            megdiv2.show().children("p").html("That email's taken. <a href='/forgot/password' style='color:rgb(248,96,5)'>Forget your password</a>?");
            return;
        }
        megdiv2.hide();
         $(this).attr("disabled",true);
        $("#form-signup").submit();
		
          $(this).attr("disabled",false);

    });





    var signbutton = $(".sign-button");
    signbutton.click(function(){
        $(this).css({"background":"none","outline":"none"});
    });

    signbutton.focus(function(){
        $(this).css({"background":"none","outline":"none"});
    });

    function checkEmail(input){
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        var email = input.val();

        if(email =="") {
            input.parent().removeClass("has-success");
            input.parent().addClass("has-error");

            return null;
        }
        else if(!reg.test(email)) {
            input.parent().removeClass("has-success");
            input.parent().addClass("has-error");
            return false;
        }else if(reg.test(email)){

            input.parent().removeClass("has-error");
            input.parent().addClass("has-success");


            return true;
        }
    }
  $("#cancelSign").click(function(){
        window.location="/";
    });
    $(window).keypress(function(btn){
                if(btn.keyCode == 13 || btn.keyCode == 108){
                    $("#submitSign").trigger("click");
                }
    });
    $("#password").click(function(){
        $(this).css({"display":"none"});
        $("input[name='password']").focus();
    });

        /*提示泡泡定位*/
        var megdiv1 = $("#megdiv1");
        var megdiv2 =  $("#megdiv2");
        var megdiv3 = $("#megdiv3");

        var fX2 = megdiv2.parent().offset().left;
        var fx1 = megdiv1.parent().offset().left;
        megdiv1.css("left",fx1-198+'px');
        megdiv2.css("left",fX2+480+'px');
        var fX3 = megdiv3.parent().offset().left;
        megdiv3.css("left",fX3+480+'px');
        $(window).resize(function(){

            fX2 = megdiv2.parent().offset().left;
            fx1 = megdiv1.parent().offset().left;
            megdiv2.css("left",fX2+480+'px');
            megdiv1.css("left",fx1-198+'px');
            fX3 = megdiv3.parent().offset().left;
            megdiv3.css("left",fX3+480+'px');

        });
    });
</script>

</body>
</html>