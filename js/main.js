

	
	



   var address = "/";






   /*setTimeout(function(){
        $(".verifySuccess").hide();
    },3000);*/

   

    var spaceReg =/^\s$/;
    $("#signin").live("click", function(){
        $("#loginModel").show();
    });
	$(".div_off").click(function(){
        $(this).parents("#loginModel").hide();
        $(".layer_mask").hide();
        $(".sendOwnMessage").removeClass("focusBgc");
        $(this).parents('.changePassword').hide();
        $(this).parents('.setPassword').hide();
        $(this).parents('.center-layermask').hide();

    });
    /*登陆验证*/
    /*邮箱验证全局方法 -保证固定的HTML格式才能用*/
    function checkEmail(input){
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        var email = input.val();

        if(!reg.test(email) && email !="") {
            input.parent().removeClass("has-success");
            input.parent().addClass("has-error");
            input.next().html("Incorrect ! Check your email address.");
            return false;
        }
        else if(email =="") {
            input.next().html("Required");
            return "";
        }else if(reg.test(email)){

            input.parent().removeClass("has-error");
            input.parent().addClass("has-success");
            input.next().html("");

            return true;
        }
    }
    var inputEmail = $("#InputEmail");
    var InputPassword = $("#InputPassword");

    inputEmail.blur(function(){

        var flag = checkEmail(inputEmail);

    });

    inputEmail.click(function(){
        inputEmail.focus();
    });
    InputPassword.click(function(){
         InputPassword.focus();
    });

    inputEmail.keypress(function(){
        inputEmail.next().html("");
    });
    InputPassword.keypress(function(){
         InputPassword.next().html("");
    });
    $("#login").click(function(){
       if(inputEmail.val()!='' && InputPassword.val()!=''){
        $(this).attr("disabled",true);
        $.post(
           
           "/login",
            
          {"username":inputEmail.val(),"password":InputPassword.val()},
       
          function (message) {
           
                var messageCode  = message.messageCode;
                var statusCode  = message.statusCode;
                var exist = message.exist;  
                var userStatus = message.userStatus;
               $("#login").removeAttr("disabled");
                if(messageCode == 1 && statusCode==1){
                    
                        var postId = $("#loginModel .postId").val();
                        if(postId != null && postId != "" && postId != undefined){
                            var userId = $("#loginModel .postUserId").val();
                           

                            $.get("/post/like/add",{userId:userId,postId:postId},function(data){
                                if(data == "0"){
                                    $("#loginModel").hide();
                                   
                                    window.location.reload();
                                   
                                      //  window.location="http://192.168.1.67:18080/treeth/user/update";
                                      
                                      var obj = document.getElementById("loginModel");
                                      if(!obj){
                                        window.history.back(-1);
                                      }
                                     
                                }
                            });

                            

                        }else{
                           $("#loginModel").hide();
                       
                            window.location.reload();
                           
                              //  window.location="http://192.168.1.67:18080/treeth/user/update";
                              
                              var obj = document.getElementById("loginModel");
                              if(!obj){
                                window.location.href="/";
                              }
                          
                        }


                      

                    
                }else if (messageCode == 4 || messageCode == 5){
                    $(".oops_layer").show()
                    $("#describe").html("Password or account was wrong.");
                }
            }, "json"
          
        );
       }
       if(inputEmail.val() ==''){
         inputEmail.next().html("Required");
       }
       if(InputPassword.val()==''){
         InputPassword.next().html("Required");
       }
    });
	/*登陆注册提醒*/

    $("#sign_up_a").hover(function(){
        $(this).html("<img src='/img/Sign-up-with-Email-Button-active.png'>");
    },function(){
        $(this).html("<img src='/img/Sign-up-with-Email-Button-wait.png'>");
    });
	/*注册验证模块*/



    /*pick new password提交&验证模块*/
    var newPassword = $("#newPassword");
    var typeAgain = $("#typeAgain");
    var checkFlag = false;
    typeAgain.blur(function(){

        if(typeAgain.val() == newPassword.val() && newPassword.val()!=''){

            typeAgain.parent().removeClass("has-error");
            typeAgain.parent().addClass("has-success");
            $(".NotMatch").html("ok!").css("color","green");
            checkFlag = true;
        }else{

            typeAgain.parent().removeClass("has-success");
            typeAgain.parent().addClass("has-error");
            $(".NotMatch").html("Your new passwords did not match!").css("color","red");
            checkFlag =false;

        }
    });
    $("#submitPNP").click(function(){
        
        if(checkFlag ==true) {
             $(this).attr("disabled",true);
            $.post(
        
            "/reset/password",
             {"code":$("#code").val(),"newPassword":$("#typeAgain").val()},
   
                 function (message) {
                 $("#submitPNP").removeAttr("disabled");
                    var messageCode  = message.messageCode;
                    var statusCode  = message.statusCode;

                    if(messageCode == 1 && statusCode==1){

                        $(".passwordSuccess").show();
                        setTimeout(function(){
                            $(".passwordSuccess").hide();
                            window.location.href="/";
                        },3000);
                        
                    }else{
                       alert("Server Exception");
                    }
                }, "json"
               );
        }
        
        });

 
    /*Change Password提交&验证模块*/
        var cOldPassword = $("#cOldPassword");
        var cNewPassword = $("#cNewPassword");
        var cNewPasswordAgain = $("#cNewPasswordAgain");

    cNewPasswordAgain.blur(function(){
        if(cNewPassword.val() == cNewPasswordAgain.val() && cNewPasswordAgain.val() !=''){
            cNewPasswordAgain.parent().removeClass("has-error");
            cNewPassword.parent().removeClass("has-error");
            cNewPassword.parent().addClass("has-success");
            cNewPasswordAgain.parent().addClass("has-success");
           
         
            cNewPasswordAgain.css("border-width","1px");
            $(".pdm").hide();

            checkFlag =true;
        }else{
            cNewPasswordAgain.parent().removeClass("has-success");
            cNewPassword.parent().removeClass("has-success");
            cNewPasswordAgain.parent().addClass("has-error");
          
            cNewPasswordAgain.css("border-width","2px");
            $(".pdm").show();
            checkFlag =false;

        }
        if(cNewPasswordAgain.val().length < 6){
            cNewPasswordAgain.parent().removeClass("has-success");
            cNewPassword.parent().removeClass("has-success");
            cNewPasswordAgain.parent().addClass("has-error");
           
            
            cNewPasswordAgain.css("border-width","2px");
            $(".pdm").show().html("Password must be at least 6 characters.");
            checkFlag =false;

        }else{
            cNewPasswordAgain.parent().removeClass("has-error");
            cNewPassword.parent().removeClass("has-error");
            cNewPasswordAgain.parent().addClass("has-success");
            
            cNewPasswordAgain.css("border-width","1px");
            $(".pdm").hide();
            checkFlag =true;
        }
    });
    $("#submitChangePassword").click(function(){
        if(checkFlag == true){
            $(this).attr("disabled",true);
            $.post(
           
              "/user/update/password",
              
               GetChPData() ,
                
                function (message) {
                      $("#submitChangePassword").removeAttr("disabled");
                   var statusCode =message.statusCode;
                   var messageCode = message.messageCode;
                    if(messageCode == 1 && statusCode == 1){
                        $(".changePassword").hide();
                        $(".passwordSuccess").show();
                    }else if(messageCode == 2){
                         $(".oops_layer").show()
                        $("#describe").html("Service Wrong.");
                    }else if(messageCode ==3){
                        cOldPassword.parent().removeClass("has-success");
                        cOldPassword.parent().addClass("has-error");
                         cOldPassword.css("border-width","2px");
                        $(".oops_layer").show()
                        $("#describe").html("Old Password is wrong.");
                    }else if(messageCode == 6){
                        $(".oops_layer").show()
                        $("#describe").html("Not login or expired");
                    }
                },"json"
               
            );

        }

    });
    $("#ok").click(function(){
        $(this).parents(".layer_mask").hide();
    });
    function GetChPData(){
        var json = {
            
            "oldPassword":cOldPassword.val(),
            "newPassword":cNewPasswordAgain.val()
        };
        return json;
    }
    $("#cancelCPWD").click(function(){
        $(this).parents('.changePassword').hide();
    });
    $("#cancel").click(function(){
        $(this).parents('.center-layermask').hide();
    });
    $("#changePassword").live("click",function(){
        $(".changePassword").show();
    });
    $("#setPassword").live("click",function(){
        $(".setPassword").show();
    });
    $("#SetEmail").blur(function(){
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        var email = $(this).val();

        if(!reg.test(email) && email !="") {
            email.parent().removeClass("has-success");
            email.parent().addClass("has-error");

            return false;
        }
        else if(email =="") {
            email.parent().removeClass("has-success");
            email.parent().addClass("has-error");
            return "";
        }else if(reg.test(email)){

            email.parent().removeClass("has-error");
            email.parent().addClass("has-success");
            email.next().html("");

            return true;
        }
    });
    /*==========更新邮箱===========*/
        $("#update").click(function(){

            var email = $("input[name='email']");
            var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(!reg.test(email.val())){
                email.parent().removeClass("has-success");
                email.parent().addClass("has-error");
                $(".errorSpan").html("Incorrect ! Check your email address.");
            }else{
                email.parent().removeClass("has-error");
                email.parent().addClass("has-success");
                $(".errorSpan").html("");
                  $(this).attr("disabled",true);
                $.post(
                
                 "/user/update/register/mail",
               
                    GetUEData(),
                    
                   function (message) {
                      $("#update").removeAttr("disabled");
                        var statusCode = message.statusCode;
                        var messageCode = message.messageCode;
                        if(statusCode == 1 && messageCode == 1){
                            var es =  $(".emailSuccess");
                            es.show();
                            $(".center-layermask").hide();
                            setTimeout(function () {
                                es.hide();
                            }, 5000);
                        }else{
                            $(".oops_layer").show()
                            $("#describe").html("Server Wrong.");
                        }
                    },"json"
                   
                );

            }
        });
    function GetUEData(){
       return {
            "email":$("input[name='email']").val()
        };
     }
     $("#resendEmail").live("click",function(){
        var es =  $(".emailSuccess");
        $(this).attr("disabled",true);
         $.post(
                "/user/resend/active/mail",
               {},
                function(message){
                    $("#resendEmail").removeAttr("disabled");
                    var statusCode = message.statusCode;
                    var messageCode = message.messageCode;
                    if(statusCode == 1 && messageCode ==1){
                         es.show();
                         setTimeout(function () {
                                 es.hide();
                              }, 5000);
                          $(".checkEmail").hide();
                    }else{
                         $(".oops_layer").show()
                         $("#describe").html("Server Wrong.");
                    }
                },"json"
                );
        
        
         
        
        
     });
    $("#changeYourEmail").live("click",function(){
       $(".center-layermask").show();
        $(".checkEmail").hide();
    });

    /*重置密码*/
    $("#ResetPassword").click(function(){  
   
        var flag =checkEmail(inputEmail);

        if(flag){
            $(this).attr("disabled",true);
            $.post(
               
                "/forgot/password",
                {"email":inputEmail.val()},
              
                 function (message) {
                    $("#ResetPassword").removeAttr("disabled");
                    var statusCode = message.statusCode;
                    var messageCode = message.messageCode;
                    if(messageCode == 1 &&statusCode ==1){
                        $("#reset1").hide();
                        $("#reset2").show();
                        $("#email").html(inputEmail.val());
                    }else if(messageCode == 2){
                        $(".oops_layer").show();
                        $("#describe").html("Server Exception.");
                    }
                },"json"
               
            );

        }
    });
/*头部交互模块*/
        /*↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓信息监控模块↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/
           setInterval(function(){
                $.get(
                    "/count/notifications",
                    function(message){
                        var statusCode = message.statusCode;
                        var messageCode = message.messageCode;
                        if(statusCode == 1 && messageCode == 1){
                            var count = message.count;
                            if(count > 0){

                                $("#sysMessage").css("background-image","url("+address+"img/sysMeg-3.png)");
                            }else{
                                 $("#sysMessage").css("background-image","url("+address+"img/sysMeg.png)");
                            }

                        
                        }
                    },"json"
                );
            }, 30000);

            setInterval(function(){
                $.get("/count/messages",function(message){
                    var statusCode = message.statusCode;
                    var messageCode = message.messageCode;
                    if(statusCode == 1 && messageCode == 1){
                        var count = message.count;
                        if(count > 0){

                            $("#privateletter").css("background-image","url("+address+"img/privateLetter-3.png)");
                        }else{
                            $("#privateletter").css("background-image","url("+address+"img/privateLetter.png)");

                           
                        }
                    }
                },"json"
                );
            },30000);
        /*↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑信息监控模块↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑*/


$("#sysMessage").click(function(){
    $(".mydropDown").hide();
    $(".leftDropDown").hide();
    $(".userDropdowm").css("background","#f5f5f5");
});
$("#privateletter").click(function(){
    $(".mydropDown").hide();
    $(".leftDropDown").hide();
    $(".userDropdowm").css("background","#f5f5f5");
});
$("#privateletter").live("mouseenter",function(){
    $(this).css("background-image","url("+address+"img/privateLetter-2.png)");
});
$("#privateletter").live("mouseleave",function(){
    $(this).css("background-image","url("+address+"img/privateLetter.png)");
});
$("#sysMessage").live("mouseenter",function(){
    $(this).css("background-image","url("+address+"img/sysMeg-2.png)");
});
$("#sysMessage").live("mouseleave",function(){
    $(this).css("background-image","url("+address+"img/sysMeg.png)");
});

/**********************页面load的时候请求通知和私信接口是否有未读消息************************************/
$(window).load(function(){
    $.get(
        "/count/notifications",
        function(message){
            var statusCode = message.statusCode;
            var messageCode = message.messageCode;
            if(statusCode == 1 && messageCode == 1){
                var count = message.count;
                if(count > 0){

                    $("#sysMessage").css("background-image","url("+address+"img/sysMeg-3.png)");
                    
                }else{

                     $("#sysMessage").css("background-image","url("+address+"img/sysMeg.png)");
                }

            
            }
        },"json"
    );



    $.get("/count/messages",function(message){
        var statusCode = message.statusCode;
        var messageCode = message.messageCode;
        if(statusCode == 1 && messageCode == 1){
            var count = message.count;
            if(count > 0){

                $("#privateletter").css("background-image","url("+address+"img/privateLetter-3.png)");

            }else{

                $("#privateletter").css("background-image","url("+address+"img/privateLetter.png)");

               
            }
        }
    },"json"
    );
});

 $("#signup").live("click",function(){
            window.location.href="/register";
        });
        
        $(".userDropdowm").live("click",function(){
            var hide = $(".mydropDown").is(":hidden");

            
            if(hide){
                $(".mydropDown").show();
                $(this).css("background","rgb(237,240,254)");
                $(".usrname").css("color","#101010");
                $(this).unbind("mouseleave");
                  
            }else{
                $(".mydropDown").hide();
                $(".userDropdowm").css("background","#f5f5f5");            
                $(".usrname").css("color","#878787");
                  $(".userDropdowm").bind("mouseleave",function(){
                     $(this).css("background","#f5f5f5");
                     $(".usrname").css("color","#878787");
                  });
            }
            
        });
         $(".userDropdowm").mouseenter(function(){
             $(this).css("background","rgb(237,240,254)");
             $(".usrname").css("color","#101010");

        });

        $(".userDropdowm").bind("mouseleave",function(){
             $(this).css("background","#f5f5f5");
            $(".usrname").css("color","#878787");
        });
        $(document).click(function(event){ 
            var t = $(event.target).attr("class");
            var hide = $(".mydropDown").is(":hidden");
               
            if(!hide && t != "usrname" && t != "facebox" && t !="mybtns btn btn-default userDropdowm"){

                $(".mydropDown").hide();
                $(".userDropdowm").css("background","#f5f5f5");
                 $(".usrname").css("color","#878787");
                $(".userDropdowm").bind("mouseleave",function(){
                     $(this).css("background","#f5f5f5");
                     $(".usrname").css("color","#878787");

               });
            }
           /* if($(event.target).parents(".mydropDown").length==0){ 
                var mydropDown =  $(".mydropDown");
                if(mydropDown.css("display") =="block"){
                    mydropDown.hide();
                }
            }*/
        });

        
        
         $(".logout a").click(function(){   
            
            $(".logout_layer").show();

         });
         $("#ok_logout").click(function(){
           $(this).attr("disabled",true);
            $.post(
                "/logout",
                function(message){
                  $("#ok_logout").removeAttr("disabled");
                    if(message.statusCode ==1 && message.messageCode == 1){

                        $(".rightSide").removeClass("btn-group hasLogin").html('<a href="javascript:" role="button" class="btn btn-default addModal" data-toggle="modal" data-target="#myModal" id="signup"><span >Sign up</span></a><a href="javascript:" role="button" class="btn btn-default addModal" data-toggle="modal" data-target="#myModal" id="signin"><span >Log in</span></a>');
                        // window.location="http://192.168.1.67:18080/treeth";
                        $(".logout_layer").hide();
                         window.location.href="/";
                    }else{
                        $(".oops_layer").show();
                        $("#describe").html("logout failed.");
                    }
                },"json"
                );
            
         });

         $("#cancel_logout").click(function(){
            $(this).parents(".logout_layer").hide();
         });

         /*input placeHoder*/

            var doc=document, 
                inputs=doc.getElementsByTagName('input'), 
                supportPlaceholder='placeholder'in doc.createElement('input'), 
                placeholder=function(input){ 
            var text=input.getAttribute('placeholder'), 
                defaultValue=input.defaultValue; 
            if(defaultValue==''){ 
                input.value=text ;
            } 
            input.onfocus=function(){ 
                if(input.value===text) 
                { 

                    this.value='' ;
                } 
            }; 
            input.onblur=function(){ 
                if(input.value===''){ 
                    this.value=text;
                } 
            } 
            }; 
            if(!supportPlaceholder){ 
                for(var i=0,len=inputs.length;i<len;i++){ 
                var input=inputs[i], 
                text=input.getAttribute('placeholder'); 
                    if(input.type==='text'&&text){ 
                    placeholder(input) 
                    } 
                } 
            }       
        
         var isIE = navigator.userAgent.match(/MSIE/)!= null,
         isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
           var password_sign = $("#password_sign"),
               password_login = $(".password_login");
               var pwd = $("#pwd");
         if(( isIE || isIE6 ) && !supportPlaceholder){
         
               if(password_sign){
                    password_sign.show();
                    password_sign.focus(function(){
                        password_sign.hide();
                    });
                     pwd.focus(function(){
                        password_sign.hide();
                    });

                    pwd.blur(function(){
                         if(pwd.val()!=''){
                            password_sign.hide();
                        }else{
                            password_sign.show();
                        }
                    });
                    if(pwd.val()!=''){
                        password_sign.hide();
                    }

               }

               if(password_login){
                    password_login.show();
                     password_login.focus(function(){
                        password_login.hide();
                    });

                    InputPassword.focus(function(){
                       
                            password_login.hide();
                        
                    });
                    InputPassword.blur(function(){
                            if(InputPassword.val()!=''){
                                password_login.hide();
                            }else{

                            password_login.show();

                            }
                    });

                    if(InputPassword.val()!=''){
                        password_login.hide();
                    }

               }


         }else{
            password_sign.hide();
            password_login.hide();
         }


     /*input placeHoder*/
     /*====================================================================
                            左侧下拉条
     =====================================================================*/
     $(".games.arrowMore").mouseenter(function(){
            $(".rightOptions a").not(".ellipsis-more").attr("href","javascript:");  
            $(this).parent().css("border-right","0");
            var gamesList = $(".rightOptions a").not(".ellipsis-more");

                $.get(
                    "/game/rank",
                    function(message){
                        var statusCode = message.statusCode;
                        var messageCode = message.messageCode;
                        if(statusCode == 1 && messageCode == 1){
                            var games = message.games;
                           if(games != null){
                                 for(var i =0;i<games.length;i++){

                                gamesList.eq(i).html(games[i].gameName);
                                gamesList.eq(i).attr("href","/game/"+games[i].id+"/");

                            }
                           }
                        }
                        $(".rightOptions").animate({width:"166px"},100);
                    },"json"
                );
            
             $(".ellipsis-more").html("More...");
            /*$(".ellipsis-more").css("background","url(/img/ellipsis.png) no-repeat right");*/

    });

     $(".games.arrowMore").mouseleave(function(){
             $(this).parent().css("border-right","1px solid #e2e3e5");
            
     });
      $(".interestTag").mouseenter(function(){
            $(".rightOptions a").not(".ellipsis-more").attr("href","javascript:"); 
            $(".rightOptions").animate({width:"166px"},300);
            $(this).parent().css("border-right","0");
            $(".rightOptions a").not(".ellipsis-more").html("interest Of Treeth");
            $(".ellipsis-more").html("More");
            /*$(".ellipsis-more").css("background","url(/img/ellipsis.png) no-repeat right");*/
     }); 
     $(".interestTag").mouseleave(function(){
             $(this).parent().css("border-right","1px solid #e2e3e5"); 
               
     });

     $(".language").mouseenter(function(){
        $(".rightOptions a").not(".ellipsis-more").attr("href","javascript:");    
            $(".rightOptions").animate({width:"166px"},300);
            $(this).parent().css("border-right","0");   
            var language = $(".rightOptions a").not(".ellipsis-more") ;
          /*  language[0].html="Deutsch";
            language[1].html="English";
            language[2].html="Español";
            language[3].html="Français";
            language[4].html="Português";
            language[5].html="Pусский";
          */

            $(".ellipsis-more").html("");
            language.html("");
            language.eq(0).html("Deutsch");
            language.eq(1).html("English");
            language.eq(2).html("Español");
            language.eq(3).html("Français");
            language.eq(4).html("Português");
            language.eq(5).html("Pусский");
            $(".ellipsis-more").css("background","url(/img/ellipsis.png) no-repeat right");                                                                                                                                                                                                                                                                                             
     });
     $(".language").mouseleave(function(){
            $(this).parent().css("border-right","1px solid #e2e3e5"); 
                     
     });
     $(".off-rightOptions").mouseenter(function(){
            $(".rightOptions").animate({width:"0px"},200);
     });
     
      $(".ellipsis-more").mouseenter(function(){
        $(".ellipsis-more").css("background","url(/img/ellipsis-hover.png) no-repeat right");  
      });
      $("#moreOptions").click(function(){
            var hide = $(".leftDropDown").is(":hidden");
             
            if(hide){
              $("#moreOptions").unbind("mouseleave");  
              $(".leftDropDown").show();

              $(this).css("background","rgb(237,240,254)");
              $(".moreSpan").css("color","#101010");
          }else{
               $("#moreOptions").bind("mouseleave",function(){
                      $(this).css("background","#f5f5f5");
                      $(".moreSpan").css("color","#878787");
                });
              $(".leftDropDown").hide();

              $(this).css("background","#f5f5f5");
              $(".moreSpan").css("color","#878787");
          }
      });
      $("#moreOptions").mouseenter(function(){
                $(this).css("background","rgb(237,240,254)");
              $(".moreSpan").css("color","#101010");
      });
      $("#moreOptions").bind("mouseleave",function(){
              $(this).css("background","#f5f5f5");
              $(".moreSpan").css("color","#878787");
      });
    $(document).click(function(event) { 
            var t = $(event.target).attr("id");
            var c = $(event.target).attr("id");
            var hide = $(".leftDropDown").is(":hidden");
               
            if(!hide && t != "moreOptions" && c!="moreSpan"){
                $(".leftDropDown").hide();
                $("#moreOptions").css("background","#f5f5f5");
                $(".moreSpan").css("color","#878787");
                $("#moreOptions").bind("mouseleave",function(){
                    $(this).css("background","#f5f5f5");
                    $(".moreSpan").css("color","#878787");
                });
            }
           /* if($(event.target).parents(".mydropDown").length==0){ 
                var mydropDown =  $(".mydropDown");
                if(mydropDown.css("display") =="block"){
                    mydropDown.hide();
                }
            }*/
        }); 
/*=======================================================================================
                                     游戏详情页
=======================================================================================*/
            
            
            
            





         $("#facebook").hover(function(){
            $(this).children().attr("src",address+"img/log-in-facebook02.png");
         },function(){
             $(this).children().attr("src",address+"img/log-in-facebook01.png");
             
         });
         $("#twitter").hover(function(){
            $(this).children().attr("src",address+"img/log-in-twitter02.png");
         },function(){
             $(this).children().attr("src",address+"img/log-in-twitter01.png");
         });
         $("#google").hover(function(){
            $(this).children().attr("src",address+"img/log-in-google_plus02.png");
         },function(){
             $(this).children().attr("src",address+"img/log-in-google_plus01.png");
         });
         var connectMethod = {
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
         $("#facebook").live("click",function(){
            var w = window.open('','newwindow','width=700,height=500,z-look=yes','center'); 
            $.get("/socialauth",{providerId:"facebook"}, function(message){
                            
                            $("#connectMethod").val(connectMethod.facebookLogin);
                            w.location.href = "/login/facebook/";
                           //window.open(treethInterFace,'newwindow','width=800, height=500','center');

                        
                },"text"
            );
         });

          $("#twitter").click(function(){
            var w = window.open('','newwindow','width=700,height=500,z-look=yes','center'); 
            $.get("/socialauth",{providerId:"twitter"}, function(message){
               

                           $("#connectMethod").val(connectMethod.twitterLogin);
                           w.location.href = "/login/twitter/";
                          // window.open(treethInterFace, 'newWindow', 'width=800, height=500','center');
                           
                },"text"
            );
         });

           $("#google").click(function(){
            var w = window.open('','newwindow','width=700,height=500,z-look=yes','center'); 
            $.get("/socialauth",{providerId:"googleplus"}, function(message){
               
                       
                           $("#connectMethod").val(connectMethod.googleplusLogin);
                           w.location.href = "/login/googleplus/";
                           //window.open(treethInterFace, 'newWindow', 'width=800, height=500','center');
                       
                },"text"
            );
         });

    var showAdviceFlag = true;
    /*************************获取通知列表***********************************/
    function showNotices(pageNum){
        $.get("/notifications",{pageNum:pageNum,pageSize:10},function(data){

            if(data.statusCode ==1 && data.messageCode == 1){
                var notifications = data.notificationForUsers;
                
                if(notifications.length > 0){
                    if(notifications.length < 10){
                        showAdviceFlag = false;
                    }else{
                        showAdviceFlag = true;
                    }
                    $(notifications).each(function(){
                       var elem = $(".advicePart .adviceMode")
                                  .find(".adviceId")
                                  .val(this.id)
                                  .end()
                                  .find(".userId")
                                  .val(this.userId)
                                  .end()
                                  .find(".postId")
                                  .val(this.postId)
                                  .end()
                                  .find(".type")
                                  .val(this.type)
                                  .end()
                                  .find(".status")
                                  .val(this.status)
                                  .end()
                                  .find(".personUrl")
                                  .attr("href", "/" + this.userId + "/")
                                  .end()
                                  .find(".postUrl")
                                  .attr("href", "/post/" + this.postId + "/")
                                  .end()
                                  .find(".friendImg")
                                  .attr("src",this.userImg)
                                  .end()
                                  .find(".sayToMe")
                                  .html(this.userName + " " + this.content)
                                  .attr("title",this.userName + " " + this.content)
                                  .end()
                                  .find(".time")
                                  .html(this.createTime)
                                  .end()
                                  .find(".postImg")
                                  .attr("src",this.coverImg)
                                  .end()
                                  .clone()
                                  .removeClass("adviceMode");
                        var status = this.status;
                        if(status == "0"){
                            $(elem).find(".lineRow").addClass("unread");
                        }
                        var follow = this.isOrNotFollowUserByCurrenUser;

                        if(this.type == "0"){
                            $(elem).find(".postUrl").remove();
                            var follow = "";
                            if(this.isOrNotFollowUserByCurrenUser == "0"){
                                follow = $('<button type="button" class="mybtns btn btn-default loginFollow">Unfollow</button>');
                            }else{
                                follow = $('<button type="button" class="mybtns btn btn-default loginFollow">Follow</button>');
                            }
                            
                            $(elem).find(".postHead").append(follow);
                        }else if(this.type == "1"){
                            var comment = this.commment;
                            if(this.commment.length > 85){
                                comment = this.commment.substring(0,85) + "...";
                            }
                            var regexp = /@\w+\s\w+\s/gi;
                            var r = comment.match(regexp);
                           
                            var content = $('<p class="comment" title="'+r+'">'+comment+'</p>');
                            $(elem).find(".sayToMe").after(content);
                        }
                        $(".advicePart .messageList").append(elem);
                        
                    });
                    
                    notifyPageNum++;
                }else{
                    if(pageNum == 1){
                        var elem = $(".emptyNotice").clone().removeClass("emptyModel");
                 
                        $(".advicePart .messageList").append(elem);
                        $(".advicePart .messageList").css({"height":"414px","overflow":"auto"});
                    }
                }
           
            }
        })
        
      
    }

    var showMessageFlag = true;
     /*************************获取私信列表***********************************/
    function showMessages(pageNum){
        $.get("/messages",{pageNum:pageNum,pageSize:10},function(data){

            if(data.statusCode ==1 && data.messageCode == 1){
                var notifications = data.messageForUsers;
                if(notifications.length > 0){
                    if(notifications.length < 10){
                        showMessageFlag = false;
                    }else{
                        showMessageFlag = true;
                    }
                    $(notifications).each(function(){
                       var elem = $(".messagePart .newsModel")
                                  .find(".messageId")
                                  .val(this.id)
                                  .end()
                                  .find(".userId")
                                  .val(this.fromUserId)
                                  .end()
                                  .find(".status")
                                  .val(this.status)
                                  .end()
                                  .find(".friendName")
                                  .html(this.userName)
                                  .end()
                                  .find(".personUrl")
                                  .attr("href", "/" + this.fromUserId + "/")
                                  .end()
                                  .find(".friendImg")
                                  .attr("src",this.icon)
                                  .end()
                                  .find(".sayToMe")
                                  .html(this.content)
                                  .attr("title",this.content)
                                  .end()
                                  .find(".time")
                                  .html(this.sendTime)
                                  .end()
                                  .clone()
                                  .removeClass("newsModel");
                        var status = this.status;
                        if(status == "0"){
                            $(elem).find(".lineRow").addClass("unread");
                        }
                        
                        $(".messagePart .messageList").append(elem);
                        
                    });
                    messagePageNum++;
                }else{
                    if(pageNum == 1){
                        var elem = $(".emptyMessage").clone().removeClass("emptyModel");
                 
                        $(".messagePart .messageList").append(elem);
                        $(".messagePart .messageList").css({"height":"414px","overflow":"auto"});
                    }
                }
                 
              
            }
        })
        
      
    }


    /*****************初始化通知内容*********************/
    var notifyPageNum = 1;
    $(".advicePart .startMenu").click(function(){
        var hidden = $(".advicePart .messageList").is(":hidden");
        if(hidden){
            $(".advicePart .messageList").html("");
            showNotices(1);
        }
       
       
    });

    var messagePageNum = 1;
    $(".messagePart .startMenu").click(function(){
        var hidden = $(".messagePart .messageList").is(":hidden");
        if(hidden){
            $(".messagePart .messageList").html("");
            showMessages(1);
        }
       
       
    });

    
    /*******************通知下拉到底部请求数据*************************/
    $(".advicePart .messageList").scroll(function(){
        
       
        var nScrollHight = 0; 
        var nScrollTop = 0;   
        var nDivHight = $(".advicePart .messageList").height();
        nScrollHight = $(this)[0].scrollHeight;
        nScrollTop = $(this)[0].scrollTop; 
        if(nScrollHight - (nScrollTop + nDivHight) < 10){

            if(showAdviceFlag){
                showNotices(notifyPageNum);
            }
        }
    });

    $(".messagePart .messageList").scroll(function(){
        
       
        var nScrollHight = 0; 
        var nScrollTop = 0;   
        var nDivHight = $(".messagePart .messageList").height();
        nScrollHight = $(this)[0].scrollHeight;
        nScrollTop = $(this)[0].scrollTop; 
        if(nScrollHight - (nScrollTop + nDivHight) < 10){

            if(showMessageFlag){
                showMessages(messagePageNum);
            }
        }
    });

    $(".advicePart .messageInfo").live("click",function(event){
        var t = event.target || event.srcElement;
       
        var c = $(t).attr("class");
        var that = this;
        var messageInfo = $(this).closest(".messageInfo");
        var status = $(messageInfo).find(".status").val();
        var type = $(messageInfo).find(".type").val();

        if(status == "0"){
            var id = $(messageInfo).find(".adviceId").val();
            $.get("/notification/done",{id:id},function(data){
                if(data.statusCode ==1 && data.messageCode == 1){
                    if(type != "0"){
                        if(c != "friendHead" && c!= "friendImg" && c!= "personUrl"){
                            var href = $(messageInfo).find(".postUrl").attr("href");
                            window.location.href = href;
                            
                        }else{
                            var href = $(messageInfo).find(".personUrl").attr("href");
                            window.location.href = href;
                            
                        }
                        
                    }else{
                        if(!(c.indexOf("loginFollow") > -1)){
                           var href = $(messageInfo).find(".personUrl").attr("href");
                           window.location.href = href;
                        }
                        
                    }
                }
            })
        }else{
            if(type != "0"){
                if(c != "friendHead" && c!= "friendImg" && c!= "personUrl"){
                    $(messageInfo).find(".postUrl")[0].click();
                }else{
                    $(messageInfo).find(".personUrl")[0].click();
                }
                
            }else{
                if(!(c.indexOf("loginFollow") > -1)){
                    $(messageInfo).find(".personUrl")[0].click();
                }
                
            }
        }
        
    });
    
    var dialogPageNum = 1;

    
    /******************显示私信框消息**********************/
    function showDialogs(pageNum){
        var userId = $(".messageModels .sendId").val();
        var loginId = $(".sessionInfo .loginId").val();
        $.get("/message/dialogs",{userId:userId,pageNum:pageNum,pageSize:10},function(data){
             if(data.statusCode ==1 && data.messageCode == 1){
                var messages = data.messageForUsers;
                
                if(pageNum == 1){
                    $(messages).each(function(){
                       var elem = $(".messageModels .sayModel")
                                  .find(".messageId")
                                  .val(this.id)
                                  .end()
                                  .find(".userId")
                                  .val(this.fromUserId)
                                  .end()
                                  .find(".head")
                                  .attr("src",this.icon)
                                  .end()
                                  .find(".sayToMe")
                                  .html(this.content)
                                  .attr("title",this.content)
                                  .end()
                                  .clone()
                                  .removeClass("sayModel");
                        var fromUserId = this.fromUserId;
                        if(fromUserId == loginId){
                           
                            $(elem).addClass("userPart").find(".popover").addClass("left").removeClass("right");
                        }else{
                            $(".messageModels .personName").html(this.userName);
                            $(elem).addClass("friendPart");
                        }
                        
                        $(".messageModels .showMessages").prepend(elem);
                        
                    });
                    
                    $(".messagePart .messageList").html("");
                    showMessages(1);
                    $.get("/count/messages",function(message){
                        var statusCode = message.statusCode;
                        var messageCode = message.messageCode;
                        if(statusCode == 1 && messageCode == 1){
                            var count = message.count;
                            if(count > 0){

                                $("#privateletter").css("background-image","url("+address+"img/privateLetter-3.png)");

                            }else{

                                $("#privateletter").css("background-image","url("+address+"img/privateLetter.png)");

                               
                            }
                        }
                    },"json"
                    );
                }else{
                    if(messages.length > 0){
                        var obj1 = {
                            startTime:"",
                            endTime:"",
                            list:[]
                        };
                  
                        var objArray = [];
                        var m = messages[0].sendTime;
                        var n = 0;
                        obj1.startTime = m;
                        var flag = false;
                        obj1.list.push(messages[0]);
                        objArray.push(obj1);
                       
                        for(var i = 1;i < messages.length;i++){
                            var message = messages[i];
                            var sendTime = message.sendTime;
                            var time = GetDateDiff(m,sendTime);
                            
                            
                            if(time.day >= 1){
                               flag = true;
                               objArray[n].endTime = messages[i - 1].sendTime;
                               n++;
                               
                               objArray[n] = new Object();
                               objArray[n].list = [];
                               objArray[n].startTime = sendTime;
                               m = sendTime;  
                               
                            }
                            objArray[n].list.push(message);
                        }
                        if(!flag){
                            objArray[objArray.length - 1].endTime = messages[messages.length - 1].sendTime;
                        }
                        for(var j = 0;j < objArray.length;j++){
                            var messages = objArray[j].list;
                            for(var k = 0;k < messages.length;k++){
                                var obj = messages[k];
                                var elem = $(".messageModels .sayModel")
                                      .find(".messageId")
                                      .val(obj.id)
                                      .end()
                                      .find(".userId")
                                      .val(obj.fromUserId)
                                      .end()
                                      .find(".head")
                                      .attr("src",obj.icon)
                                      .end()
                                      .find(".sayToMe")
                                      .html(obj.content)
                                      .attr("title",obj.content)
                                      .end()
                                      .clone()
                                      .removeClass("sayModel");
                                var fromUserId = obj.fromUserId;
                                if(fromUserId == loginId){
                                    $(".messageModels .personName").html(this.userName);
                                    $(elem).addClass("userPart").find(".popover").addClass("left").removeClass("right");
                                }else{
                                    $(elem).addClass("friendPart");
                                }
                                
                                if(k == 0){
                                    var startShow = $('<p class="startTime">'+objArray[j].startTime+'<img src="'+address+'img/line.png" class="lineImg"></p>');
                                    $(".messageModels .showMessages").prepend(startShow);
                                    $(".messageModels .showMessages").prepend(elem);
                                }else{
                                    $(".messageModels .showMessages").prepend(elem);
                                }
                                
                                
                            }
                        }
                    }
                  
                }
                var moreList = data.existNextPage;
                if(moreList == 0){
                    var more = $('<p class="more">More</p>')
                    $(".messageModels .showMessages").prepend(more);
                }
                dialogPageNum++;
             }
        })
    }
    /**********************计算两个数字的时间差*************************/
     function GetDateDiff(startTime, endTime) {
        var date1 = new Date(startTime);  //开始时间
        var date2 = new Date(endTime);     //结束时间
        var date3 = date2.getTime() - date1.getTime();   //时间差的毫秒数
        //计算相差的年数
        var years = Math.floor(date3 / (12 * 30 * 24 * 3600 * 1000));
        //计算相差的月数
        var leave = date3 % (12 * 30 * 24 * 3600 * 1000);
        var months = Math.floor(leave / (30 * 24 * 3600 * 1000));
        //计算出相差天数
        var leave0 = leave % (30 * 24 * 3600 * 1000);
        var days = Math.floor(leave0 / (24 * 3600 * 1000));
        //计算出小时数
        var leave1 = leave0 % (24 * 3600 * 1000);     //计算天数后剩余的毫秒数
        var hours = Math.floor(leave1 / (3600 * 1000));
        //计算相差分钟数
        var leave2 = leave1 % (3600 * 1000);         //计算小时数后剩余的毫秒数
        var minutes = Math.floor(leave2 / (60 * 1000));
        //计算相差秒数
        var leave3 = leave2 % (60 * 1000);       //计算分钟数后剩余的毫秒数
        var seconds = Math.round(leave3 / 1000);
        var obj = {
            day:days,
            hour:hours,
            minutes:minutes,
            seconds:seconds
        };
        return obj;
    }

    /***********************初始化私信列表********************************/
    $(".messagePart .messageInfo").live("click",function(){
        var userId = $(this).closest(".messageInfo").find(".userId").val();
        var loginId = $(".sessionInfo .loginId").val();
        $(".messageModels .showMessages").html("");
        $(".messageModels .sendId").val(userId);
        $("#detailModel .top,.detailTop").css("z-index","100");
        
        showDialogs(1);


    });

    /*********************发送私信*************************/
    $(".sendNews").click(function(){
        var val = $(".messageModels .news").val();
        var userId = $(".messageModels .sendId").val();
        $(this).attr("disabled",true);
        var t = this;
        if(val != "" && val != undefined){
            $.post("/message/add",{userId:userId,content:val},function(data){
                if(data.statusCode ==1 && data.messageCode == 1){
                    var icon = $(".sessionInfo .loginImg").val();
                    var elem = $(".messageModels .sayModel")
                              .find(".head")
                              .attr("src",icon)
                              .end()
                              .find(".sayToMe")
                              .html(val)
                              .attr("title",this.content)
                              .end()
                              .clone()
                              .removeClass("sayModel");
                    $(elem).addClass("userPart").find(".popover").addClass("left").removeClass("right");
                    $(".messageModels .showMessages").append(elem);
                    var scrollHeights = $(".messageModels .showMessages")[0].scrollHeight;
                    $(".messageModels .showMessages")[0].scrollTop = scrollHeights;
                    $(".messageModels .news").val("");
                    $(t).attr("disabled",false);
                }
            })
        }
    });

    $(".messageModels .more").live("click",function(){
        $(this).remove();
        showDialogs(dialogPageNum);

    });

    $(".sendOwnMessage").click(function(){
        var loginFlag = checkLogin();
        if(!loginFlag){
            var sendId = window.location.href.split("/")[3];
            var userName = $(".usroperatebox .uname").html();
            $(".messageModels .sendId").val(sendId);
            $(".messageModels .personName").html(userName);
       
            $(".messageModels .showMessages").html("");

            showDialogs(1);
        }else{
            $(this).attr("data-toggle","0");
        }
        
    });

   

    $(".problemModels .showImg").live("mouseenter",function(){
        $(this).find(".cancel").show();
    });
    $(".problemModels .showImg").live("mouseleave",function(){
        $(this).find(".cancel").hide();
    });
    /*****************General Feedback点击Send按钮提交数据*************************/
    $(".generalSend").click(function(){
       
        var projectType = $(".generalModels .projectType").val();
       
        var desc = $(".generalModels .generalDesc").val();
        if(isEmpty(desc)){
            
            $(".generalModels .generalDesc").addClass("warnerror");
            $(".generalModels .errorMessage").show();
            return false;
        }
        $(this).attr("disabled",true);
        $.post("/feedback/add/general",{generalDesc:desc,projectType:projectType},function(data){
            if(data.statusCode ==1 && data.messageCode == 1){
                $(".generalModels .close").trigger("click");
                $(".thanksModels .content").html("Thanks for your feedback.We aren‘t responding to each email we receive through this channel,but we may reach out to you for more  info  as we work on improving this experience.");
                $(".thanksBtn").trigger("click");
                $(".generalSend").attr("disabled",false);
            }
        });

    });

    $(".generalDesc").on("input",function(){
        $(".generalModels .generalDesc").removeClass("warnerror");
        $(".generalModels .errorMessage").hide();   
    });
    /******************cantact us上传图片删除**********************************/
    $(".problemModels .cancel").live("click",function(){
        var index = $(".problemModels .cancel").index(this);
        var i = $(this).closest(".showImg").data("index");
       
        $(this).parent().remove();
        $(".problemModels .uploadBtn").attr("disabled",false);
        var s = $('<input class="problemUpload aa" id="problemUpload'+(i + 1)+'" type="file" name="descPic" />');

        $(".problemUpload:eq("+i+")").replaceWith(s);

        
    });
    $(".problemSend").click(function(){
       /* var files = $(".problemModels .problemUpload");
        $(files).each(function(){
            alert($(this).val());
        });*/
        var projectType = $(".problemModels .projectType").val();
        if(projectType == "0"){
            $(".problemModels .projectType").addClass("warnerror");
            $(".problemModels .errorMessage").html("Please select a product.").show();
            return false;
        }
        var desc = $(".problemModels .problemDesc").val();

        if(isEmpty(desc)){
            $(".problemModels .problemDesc").addClass("warnerror");
            $(".problemModels .errorMessage").html("Please provide more details about the problem you are experiencing.").show();
            return false;
        }
        var t = this;
        var loadImg = address + "img/load.gif";
        $(this).hide();
        $(".problemModels .modal-footer").append($('<img src="'+loadImg+'" class="load">'));
        
        $.ajaxFileUpload({
            url: "/feedback/add/problem",
            secureuri: false,
            fileElementId: ["problemUpload1","problemUpload2","problemUpload3"],// 这个地方变成数组了
            data:{
                problemDesc: desc,
                projectType:projectType
            },
            success:function(data,status){
                $(".problemModels .close").trigger("click");
                $(".thanksModels .content").html("Thanks for your feedback.We aren‘t responding to each email we receive through this channel,but we may reach out to you for more  info  as we work on improving this experience.");
                $(".thanksBtn").trigger("click");
                $(".problemModels .load").hide();
                $(".problemSend").show();
            }
        })

    });
    $(".testBtn").click(function(){
        var options = {
                    url : "/feedback/add/general",
                    type : "POST",
                    dataType : 'json',
                    success : function() {
                        alert("ok");
                    }
                };
      
        $("#myform").ajaxSubmit(options);
    });
    /******************report a problem预览图片***************************/
    $(".problemUpload").live("change",function(){
        
     var current = this;

     var index = $(".problemUpload").index(this);
     
      if (FileReader) {
          var reader = new FileReader(),
              file = this.files[0];
          reader.readAsDataURL(file);
          reader.onload = function(e) {
            
            var s = $('<div class="col-xs-3  showImg"><img src="'+e.target.result+'" class="img"><img src="'+address+'img/cancel.png" class="cancel"></div>');
            $(s).data("index",index);
            $(".problemModels .imgs").append(s);
            $(current).hide();
            
            $(current).prev().show();
            var len = $(".problemModels .showImg").length;
            if(len == 3){
              $(".problemModels .uploadBtn").attr("disabled",true);
            }
            
          };
          
      }
      else {
          
          var fileupload = $(this).get(0);
          fileupload.select();
          fileupload.blur();
          path = document.selection.createRange().text;
          
          if (/"\w\W"/.test(path)) {
              path = path.slice(1,-1);
          }
      
          document.selection.empty();
          var s = $('<div class="col-xs-3  showImg"><img src="" class="img"><img src="'+address+'img/cancel.png" class="cancel"></div>');
          $(s).data("index",index);
          $(".problemModels .imgs").append(s);
          $(".problemModels .img:last").get(0).style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='"+path+"')"; 
          $(".problemModels .img:last").get(0).src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';


          $(current).hide();
          $(current).prev().show();
          var len = $(".problemModels .showImg").length;
          if(len == 3){
           $(".problemModels .uploadBtn").attr("disabled",true);
          }
       
      }
    });

    $(".problemModels .projectType").change(function(){
        var val = $(this).val();
        if(val != "Please Select a product"){
            $(this).removeClass("warnerror");
            $(".problemModels .errorMessage").html("Please select a product.").hide();
        }
    });
    $(".problemModels .problemDesc").on("input",function(){
        $(".problemModels .problemDesc").removeClass("warnerror");
        $(".problemModels .errorMessage").hide();   
    });


    $(".messageList").mouseleave(function(){
        $("#privateletter").css("background-color","");
    });

    /*******************contact us选择第二项的时候清空之前输入的内容************************/
    $(".moreProblem").click(function(){
        $(".problemModels .projectType").val(0);
        $(".problemModels .problemDesc").val("");
        $(".problemModels .imgs").html("");
        var s = $('<span>Upload</span> <input class="problemUpload" id="problemUpload1" type="file" name="descPic" /><input class="problemUpload" id="problemUpload2"type="file" name="descPic" /><input class="problemUpload" id="problemUpload3" type="file" name="descPic" />');
        $(".problemModels .uploadBtn").html("").append(s);
        $(".problemModels .uploadBtn").attr("disabled",false);
        $(".problemModels .projectType").removeClass("warnerror");
        $(".problemModels .errorMessage").hide();
    });

    /*******************contact us选择第一项的时候清空之前输入的内容************************/
    $(".contactModals .tell").click(function(){
        $(".generalModels .projectType").val(0);
        $(".generalModels .generalDesc").val("");
    });




    /*****************textarea光标移动到末尾*********************/
    function moveEnd(obj){
        obj.focus();
        var len = obj.value.length;
        if (document.selection) {
            var sel = obj.createTextRange();
            sel.moveStart('character',len);
            sel.collapse();
            sel.select();
        } else if (typeof obj.selectionStart == 'number' && typeof obj.selectionEnd == 'number') {
            obj.selectionStart = obj.selectionEnd = len;
        }

    }

    function getCookie(name){ 
        var str=document.cookie.split(";") 
        for(var i=0;i<str.length;i++){ 
            var str2=str[i].split("="); 
            
            if($.trim(str2[0])==name)return unescape(str2[1]); 
        } 
    } 
    function delCookie(name) 
    { 
        var exp = new Date(); 
        exp.setTime(exp.getTime() - 1); 
        var cval=getCookie(name); 
        if(cval!=null) 
            document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
    }
 function isEmpty(obj){
        if(obj == null || obj == "" || obj == undefined){
            return true;
        }else{
            return false;
        }
    }
    /**************添加帖子***************/
    
    
    var getTag = true;
    var editor1;
    var editor2;
    var K;
    
    KindEditor.ready(function(K) {
                   editor1 = K.create('#desc',{
                       cssPath:address + '/js/kindeditor/plugins/code/prettify.css',
                       width:'100%',
                       langType : 'en',
                    afterBlur: function(){this.sync();}
                   });
                   editor2 = K.create('#description',{
                       cssPath:address + '/js/kindeditor/plugins/code/prettify.css',
                       width:'100%',
                       langType : 'en',
                    afterBlur: function(){this.sync();}
                   });
                   editor3 = K.create('#desc2',{
                       cssPath:address + '/js/kindeditor/plugins/code/prettify.css',
                       width:'100%',
                       langType : 'en',
                    afterBlur: function(){this.sync();}
                   });
            });
    $(".addModal").click(function(){
        $(".postModal .load").remove();
        $(".postModal .uploadBtn").show();
        $(".postModal .mydesc").val("");

            
        /*editor = UE.getEditor('editor',{
          zIndex:9999
        });*/
        /*editor.addListener( 'afterSelectionChange', function( editor ) {
             alert("ok");
         } );*/
        var loginFlag = checkLogin();
        

        if(getTag){
            
            var userId = $(".userInfo").val();
            $.get("/label/user/list?userId=" + userId,function(data){
                //var tags = data.split(",");

                var tags = data;
                if(tags != "" && tags.length != 0){
                    $('#tags_1').tagsInput({width:'100%',hasTags:tags});
                }else{
                    $('#tags_1').tagsInput({width:'100%'});
                    $(".useTag").hide();
                }
                
            });
            getTag = false;
        }
        
        
    });
    var $search = $('.searchGame'); 
    //取得输入框JQuery对象 
    var $searchInput = $search.find('.search-text'); 
    //关闭浏览器提供给输入框的自动完成 
    $searchInput.attr('autocomplete','off'); 
    //创建自动完成的下拉列表，用于显示服务器返回的数据,插入在搜索按钮的后面，等显示的时候再调整位置 
    var $autocomplete = $('<div class="autocomplete"></div>').hide().insertAfter('.gameimg'); 
    //清空下拉列表的内容并且隐藏下拉列表区 
    var clear = function(){ 
        $autocomplete.empty().hide(); 
    }; 
    //注册事件，当输入框失去焦点的时候清空下拉列表并隐藏 
    $searchInput.blur(function(){ 
        setTimeout(clear,500); 
    }); 
    //下拉列表中高亮的项目的索引，当显示下拉列表项的时候，移动鼠标或者键盘的上下键就会移动高亮的项目，想百度搜索那样 
    var selectedItem = null; 
    //timeout的ID 
    var timeoutid = null; 
    //设置下拉项的高亮背景 
    var setSelectedItem = function(item){ 
        //更新索引变量 

        selectedItem = item ; 
        //按上下键是循环显示的，小于0就置成最大的值，大于最大值就置成0 
        if(selectedItem < 0){ 
            selectedItem = $autocomplete.find('li').length - 1; 
        } else if(selectedItem > $autocomplete.find('li').length-1 ) { 
            selectedItem = 0; 
        } 
        //首先移除其他列表项的高亮背景，然后再高亮当前索引的背景 
        $autocomplete.find('li').removeClass('highlight') .eq(selectedItem).addClass('highlight'); 
    }; 
    var ajax_request = function(){ 
    //ajax服务端通信 
    var speKey = $(".searchGame .search-text").val();
    $autocomplete.empty();
    if(speKey != "" && speKey != undefined){
        $.post("/game/name/list",{"key":speKey,"lan":0},function(data){
        var games = data;
        $autocomplete.empty();
        if(data.length) {
        //遍历data，添加到自动完成区 
        $.each(games, function(index,term) { 
            //创建li标签,添加到下拉列表中 
            $('<li></li>')
            .text(term.game)
            .appendTo($autocomplete) 
            .addClass('clickable') 
            .hover(function(){ 
            //下拉列表每一项的事件，鼠标移进去的操作 
            $(this).siblings().removeClass('highlight'); 
            $(this).addClass('highlight'); 
            selectedItem = index; 
            },function(){ 
            //下拉列表每一项的事件，鼠标离开的操作 
            $(this).removeClass('highlight'); 
            //当鼠标离开时索引置-1，当作标记 
            selectedItem = -1; 
            }).click(function(){ 
            //鼠标单击下拉列表的这一项的话，就将这一项的值添加到输入框中 
            $(".postModal .requireGame").hide();
            $searchInput.val(term.game); 
            /*alert(term.src);*/
            $(".searchGame").find("img").attr("src",term.src).css("display","inline");
            //清空并隐藏下拉列表 
            $autocomplete.empty().hide(); 
            }); 
        });//事件注册完毕 
        //设置下拉列表的位置，然后显示下拉列表
            var ypos = $searchInput.position().top; 
            var xpos = $searchInput.position().left; 
            $autocomplete.css('width',$searchInput.css('width')); 
            if(games.length > 6){
                $autocomplete.css({'height':"202px","overflow-y":"scroll"}); 
            }
            
            //$autocomplete.css({'position':'relative','left':xpos + "px",'top':ypos +"px"}); 
            //$autocomplete.css({'left':xpos + "px",'top':ypos +"px"}); 
            setSelectedItem(0); 
            //显示下拉列表 
            $autocomplete.show(); 
        }
        })
    }

    }; 


    

    //对输入框进行事件注册 
    $searchInput .keyup(function(event) { 
    //字母数字，退格，空格 

        if(event.keyCode > 40 || event.keyCode == 8 || event.keyCode ==32 ) { 
        //首先删除下拉列表中的信息 

            $autocomplete.empty().hide(); 
            clearTimeout(timeoutid); 
            timeoutid = setTimeout(ajax_request,100); 
        } else if(event.keyCode == 38){ 
        //上 
            //selectedItem = -1 代表鼠标离开 
            if(selectedItem == -1){ 
                setSelectedItem($autocomplete.find('li').length-1); 
            } else { 
            //索引减1 
                setSelectedItem(selectedItem - 1); 
            } 
            event.preventDefault(); 
        } else if(event.keyCode == 40) { 
            //下 
            //selectedItem = -1 代表鼠标离开 
            if(selectedItem == -1){ 
            setSelectedItem(0); 
            } 
            else { 
            //索引加1 
            setSelectedItem(selectedItem + 1); 
            } 
            event.preventDefault(); 
        }else if(event.keyCode == 17){
            if(isEmpty(speKey)){
                $(".postModal .requireGame").hide();
                if($autocomplete.find('li').length == 0 || selectedItem == -1) { 
                    return; 
                } 
                    
                $searchInput.val($autocomplete.find('li').eq(selectedItem).text()); 
                $autocomplete.empty().hide(); 
                event.preventDefault(); 
            }
        }
    }).keypress(function(event){ 
        
        $(".postModal .requireGame").hide();
        //enter键 
        if(event.keyCode == 13) { 
        //列表为空或者鼠标离开导致当前没有索引值 
        if($autocomplete.find('li').length == 0 || selectedItem == -1) { 
        return; 
        } 
        
        $searchInput.val($autocomplete.find('li').eq(selectedItem).text()); 
        $autocomplete.empty().hide(); 
        event.preventDefault(); 
        } 
    }) .keydown(function(event){ 
        //esc键 
        if(event.keyCode == 27 ) { 
        $autocomplete.empty().hide(); 
        event.preventDefault(); 
        } 
    }).on("input",function(event){ 
        speKey = $(".searchGame .search-text").val();
        if(!isEmpty(speKey)){
           $autocomplete.empty().hide(); 
           clearTimeout(timeoutid); 
           timeoutid = setTimeout(ajax_request,100);  
        }
    }); 


     
    /*上传图片模块*/
    var typeFitFlag = false;
    var path,
          FileReader = window.FileReader;
    $("#fileInput").live("change",function() {

      var imgurlShow = $(".postModal .imgurl").is(":hidden");
      if(imgurlShow){
        $(".postModal .mustRequire").hide();
        $(".postModal .imgurl").show();
      }
      
      var fit = checkfile(this);
    
      if(!fit){
       
        $(".postModal .imgurl").hide();
        $(".postModal .typeRequire").html("That filetype is not supported.").show();
        return;
      }else if(fit == "unfit"){
        $(".postModal .imgurl").hide();
        $(".postModal .typeRequire").html("maxsize 2m").show();
        return;
      }else{
        $(".postModal .typeRequire").hide();
      }
      $(".postModal .typeRequire").hide();
      if (FileReader) {
          var reader = new FileReader(),
              file = this.files[0];
          reader.readAsDataURL(file);
          reader.onload = function(e) {

            
            var s = $('<div class="hasupImg col-xs-1 countImg fistImg" style="display:block"><img src="'+e.target.result+'" class="upImg"><img src="'+address+'img/cancel.png" alt="" class="cancel"></div>');
            $(".uploadImgs").append(s);

            $(".uploadImgs").show();
            
            $(".mofileContainer").show();
            $(".uploadChose").hide();
          };
          
      }
      else {
         
          var fileupload = $(this).get(0);
          fileupload.select();
          fileupload.blur();
          path = document.selection.createRange().text;
          if (/"\w\W"/.test(path)) {
           path = path.slice(1,-1);
         }
        
         document.selection.empty();
      
         var s = $('<div class="hasupImg col-xs-1 countImg fistImg" style="display:block"><img src="" class="upImg"><img src="'+address+'img/cancel.png" alt="" class="cancel"></div>');
         $(".uploadImgs").append(s);
         $(".uploadImgs").show();
         $(".mofileContainer").show();
         $(".fistImg .upImg").get(0).style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='"+path+"')"; 
         $(".fistImg .upImg").get(0).src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
        
         $(".uploadChose").hide();
          
         
       
      }
                
});
    
    /**********************添加帖子url失去焦点的时候判断是否为空********************************/
    $(".postModal .urls").keyup(function(){
        var len = $(this).val().length;
        if(len > 0){
            var show = $(".videoInfo .urldesc").is(":hidden");
            if(show){
                $(".postModal .mustRequire").hide();
                $(".videoInfo .urldesc").show();
            }
        }
    });
   /* $("#fileInput").click(function(event){
        var one = $("#fileInput").val();
        var files = $(".files");
        var choseFlag = false;
        if(one == "" || one == undefined){
            $(files).each(function(){
                
                if($(this).val() != ""){
                    choseFlag = true;
                    return;
                }
            });
        }else{
            
            //$(this).attr("disabled",true);
            event = event || window.event;
            if(event.preventDefault){
                event.preventDefault();
            }else{
                event.returnValue = false;
            }
            $(".uploadChose").hide();
            $(".uploadImgs").show();
        }
    });*/
    /*******************添加多图的时候选择文件**************************/
    $(".files").live("change",function(){
        /*var length = $(".countImg").length + 1;
     var index = $(".files").index(this);*/
     var current = this;
     var index = $(".files").index(this);
     var fit = checkfile(this);
     if(!fit){
       
        $(".postModal .imgurl").hide();
        $(".postModal .typeRequires").html("That filetype is not supported.").show();
        return;
      }else if(fit == "unfit"){
        $(".postModal .imgurl").hide();
        $(".postModal .typeRequires").html("maxsize 2m").show();
        return;
      }else{
        $(".postModal .typeRequires").hide();
      }
      if (FileReader) {
          var reader = new FileReader(),
              file = this.files[0];
          reader.readAsDataURL(file);
          reader.onload = function(e) {
            
            var s = $('<div class="hasupImg col-xs-1 countImg" style="display:block"><img src="'+e.target.result+'" class="upImg"><img src="'+address+'img/cancel.png" alt="" class="cancel"></div>');
            $(".uploadImgs").append(s);
            $(current).hide();
            
            $(current).next().show();
            var len = $(".hasupImg .upImg").length;
            if(len == 5){
                $(".mofileContainer").css("opacity","0.5");
                $(".mofileContainer").css("background","url("+address+"img/addImg_gray.png) no-repeat center center");

            }
          };
          
      }
      else {
          
          var fileupload = $(this).get(0);
          fileupload.select();
          fileupload.blur();
          path = document.selection.createRange().text;
          
          if (/"\w\W"/.test(path)) {
              path = path.slice(1,-1);
          }
      
          document.selection.empty();
          var s = $('<div class="hasupImg col-xs-1 countImg" style="display:block"><img src="" class="upImg"><img src="'+address+'img/cancel.png" alt="" class="cancel"></div>');
          $(".uploadImgs").append(s);
          $(".upImg:last").get(0).style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='"+path+"')"; 
          $(".upImg:last").get(0).src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
          $(current).hide();
          $(current).next().show();
          var len = $(".hasupImg .upImg").length;
          if(len == 5){
            $(".mofileContainer").css("opacity","0.5");
            $(".mofileContainer").css("background","url("+address+"img/addImg_gray.png) no-repeat center center");
            
            
          }
       
      }
    });


    


    var cancelFlag = false;
    /********************已经添加的图片删除*******************************/
    $(".uploadImgs .cancel").live("click",function(){

        var index = $(".cancel").index(this);
            
        var c = $(this).parent().attr("class");
        var h = $(".mofileContainer").html();
        
        if(c.indexOf("fistImg") > -1){
            $("#fileInput").remove();
            $(".mofileContainer").append($('<input type="file" name="doc" class="files">'));
            cancelFlag = true;
        }else{
            if(cancelFlag){
                $(".files:eq("+index+")").remove();
            }else{
                $(".files:eq("+(index - 1)+")").remove();
            }
            $(".mofileContainer").append($('<input type="file" name="doc" class="files">'));
        }
         $(".mofileContainer").css("opacity","1");
         
         $(".mofileContainer").mouseenter(function(){
            $(".mofileContainer").css("background","url("+address+"img/addImg_gray.png) no-repeat center center");
         });
         $(".mofileContainer").mouseleave(function(){
            $(".mofileContainer").css("background","url("+address+"img/addImg.png) no-repeat center center");
         });
        $(this).parent().remove();
        var length = $(".countImg").length;
        if(length == 4){
            $(".files:last").show();
        }
    });
    
    /*****************已经添加的图片鼠标放上去，删除按钮显示**************************/
    $(".hasupImg").live("mouseenter",function(){
        $(this).find(".cancel").show();
    });
    $(".hasupImg").live("mouseleave",function(){
        $(this).find(".cancel").hide();
    });

    $(".uploadImgs .back").click(function(){
        $(this).parent().hide();
        $(".uploadChose").show();
    });
    $(".videoInfo .back").click(function(){
        var len = $(".postModal .urls").val().length;
        $(this).parent().hide();
        if(len > 0){
            $(".uploadChose .imgurl").show();
        }
        $(".uploadChose").show();
    });
    $(".uploadVideo").click(function(){
        var hide = $(".postModal .mustRequire").css("display");
        $(this).parent().parent().hide();
        $(".videoInfo").show();
        
        if(hide != "none"){
            $(".videoInfo .urldesc").hide();
        }
    });
    
    /*************上传帖子*******************/
    $(".postModal .uploadBtn").click(function(){
        var show = $(".uploadImgs").is(":hidden");
        var pass = true;
       
        if(!show){
            $(".postModal .postType").val("0");
            $(".videoInfo").css("display","none");
            var singFile = $("#fileInput").val();
            var emptyFlag = false;
            if(singFile == "" || singFile == null || singFile == undefined){
                var files = $(".postModal .files");
                $(files).each(function(){
                    var val = $(this).val();
                    if(val != "" && val != undefined){
                        emptyFlag = true;
                    }
                });
            }else{
                emptyFlag = true;
            }
            if(!emptyFlag){
                $(".upload .uploadWarn .imgurl").hide();
                
                $(".upload .uploadWarn .mustRequire").fadeIn(10);
                pass = false;
            }
        }else{
            $(".postModal .postType").val("1");
            var url = $(".postModal .urls").val();
            if(url == null || url == "" || url == undefined){
                $(".upload .uploadWarn .imgurl").hide();
                $(".videoInfo .uploadWarn .urldesc").hide();
                $(".upload .uploadWarn .mustRequire").fadeIn(10);
                $(".videoInfo .uploadWarn .mustRequire").fadeIn(10);
                pass = false;
            }
            $(".uploadImgs").css("display","none");
        }
        var title = $(".postModal #title").val();
        if(title == "" || title == undefined){
            $(".postModal #title").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireTitle").html("Required!").fadeIn(10);

            pass = false;
        }else{
            var titles = $(".postModal #title");
            var fit = validateContent($(titles),50);
            if(fit == "2"){
                $(".postModal .requireTitle").html("50 characters or fewer, please!").fadeIn(10);
                pass = false;
            }
        }
        //var desc = $(".postModal #desc").val();
        var desc = editor1.text();

        if(editor1.isEmpty()){
            $(".postModal #desc").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireDesc").html("Required!").fadeIn(10);
            pass = false;
        }else{
            /*var descs = $(".postModal #desc");
            var fit = validateContent($(descs),5000);
            if(fit == "2"){
                $(".postModal .requireDesc").html("5000 characters or fewer, please!").fadeIn(10);
                pass = false;
            }else{
                var s = desc.replace("\n","<br />");
                $(".postModal .mydesc").val(s);
            }*/
            
            var content = editor1.html();
            alert(editor1.text());
           
            if(desc.length > 5050){
                $(".postModal .requireDesc").html("5000 characters or fewer, please!").fadeIn(10);
                pass = false;
            }else{
                alert(content);
                $(".postModal .mydesc").val(content);
            }

        }
        var gameName = $(".postModal .search-text").val();
        if(gameName == "" || gameName == undefined){
            $(".postModal .search-text").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireGame").html("Required!").fadeIn(10);
            pass = false;
        }

        if(pass){
            
           var loadImg = address + "img/load.gif";
            $(this).prev().after($('<img src="'+loadImg+'" class="load">'));
            $(this).hide();

            $(".postModal .load")[0].onload = function(){
                var options = {
                    url : "/post/add",
                    type : "POST",
                    success : function(data) {
                        data = data.substring(0,data.lastIndexOf("}") + 1);
                        data = eval("(" + data + ")");

                        if(data.statusCode == 1){
                            if(data.messageCode == 1){
                                var person = $(".person").val();
                                if(!isEmpty(person) && person == "0"){
                                    window.location.href="";
                                }else{
                                    window.location.href="/";
                                }
                                
                            }else if(data.messageCode == 10){
                                $(".postModal .token").val(data.messageCodeReason);
                               
                                $(".postModal .imgurl").hide();
                                $(".postModal .typeRequires").html("That filetype is not supported.").show();
                                $(".postModal .load").remove();
                                $(".postModal .uploadBtn").show();
                            }else if(data.messageCode == 11){
                                $(".postModal .token").val(data.messageCodeReason);
                                $(".postModal .imgurl").hide();
                                $(".postModal .typeRequires").html("maxsize 2m").show();
                                $(".postModal .load").remove();
                                $(".postModal .uploadBtn").show();
                            }
                        }
                       
                    }
                };
                $(".uploadForm").ajaxSubmit(options);
                return false;
            };
        }
        
    });

    /************tag添加限制**************/
    $(".mytag").live("focus",function(){
        
            var tag = $(".tagsinput .tag");
            
            if(tag.length > 4){
                $(".mytag").attr("disabled",true);
            }else{
                $(".mytag").removeAttr("disabled");
            }
            if(tag.length >0){
                $(".mytag").removeAttr("data-default").css("max-width","100px");
            }
            
    });
    $(".mytag").live("blur",function(){
        if($(".tagsinput .tag").length ==0){
            
            $(".mytag").attr({"data-default":"Add tags for post,separate each tag using a comma or the enter key."}).css("min-width","410px");
            
        }
    });

    $(".postModal #title").on("input",function(event){
        
        var fit = validateContent(this,50);  

        if(fit == "2"){
            $(".postModal #title").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireTitle").html("50 characters or fewer, please!").show();
            
            return false;
        }else if(fit == "0"){
            $(".postModal #title").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireTitle").html("Required!").show();
            
            return false;
        }else{
            $(".postModal #title").removeClass("warnerror");
            $(".postModal .requireTitle").hide();
        }               
    });
    $(".postModal #desc").on("input",function(event){
        
        var fit = validateContent(this,5000);  

        if(fit == "2"){
            $(".postModal #desc").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireDesc").html("5000 characters or fewer, please!").show();
            
            return false;
        }else if(fit == "0"){
            $(".postModal #desc").removeClass("warnsuccess").addClass("warnerror");
            $(".postModal .requireDesc").html("Required!").show();
            
            return false;
        }else{
            $(".postModal #desc").removeClass("warnerror");
            $(".postModal .requireDesc").hide();
        }               
    });
    $("#description").on("input",function(event){
        
        var fit = validateContent(this,500);  

        if(fit == "2"){
            $("#description").removeClass("warnsuccess").addClass("warnerror");
            $("#editModel .postRequired").html("500 characters or fewer, please!").show();
            
            return false;
        }else if(fit == "0"){
            $("#description").removeClass("warnsuccess").addClass("warnerror");
            $("#editModel .postRequired").html("Required!").show();
            
            return false;
        }else{
            $("#description").removeClass("warnerror");
            $("#editModel .postRequired").hide();
        }               
    });
   function validateContent(elem,total){
        var len = $(elem).val().length;
        if(len == 0){
            return "0";
        }else if(len > 0 && len <= total){
            return "1";
        }else{
            return "2";
        }
    }
    
    function validateType(obj){
        var val = $(obj).val();
        if(!val.match( /.jpg|.jpeg|.gif|.png|.bmp/i) ){     
          imgtype = false;
          return false;    
         
        }else{
           return true;
        }
    }

    /*******************判断上传图片大小不能超过2m*******************************/
    var maxsize = 2*1024*1024;//2M
    var errMsg = "上传的附件文件不能超过2M！！！";
    var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过2M，建议使用IE、FireFox、Chrome浏览器。";
    var  browserCfg = {};
    var ua = window.navigator.userAgent;
    if (ua.indexOf("MSIE")>=1){
        browserCfg.ie = true;
    }else if(ua.indexOf("Firefox")>=1){
        browserCfg.firefox = true;
    }else if(ua.indexOf("Chrome")>=1){
        browserCfg.chrome = true;
    }else if(ua.indexOf("Safari")){
        browserCfg.chrome = true;
    }
    function checkfile(obj){
        try{
            var val = $(obj).val();
            if(!val.match( /.jpg|.jpeg|.gif|.png|.bmp/i ) ){     
              imgtype = false;
              return false;    
            }
            var obj_file = $(obj)[0];
            
            var filesize = 0;
            if(browserCfg.firefox || browserCfg.chrome ){
                filesize = obj_file.files[0].size;
            }else if(browserCfg.ie){
                /*var obj_img = document.getElementById('tempimg');*/
                /*var obj_img = new Image();
                obj_img.dynsrc=obj_file.value;
                filesize = obj_img.fileSize;*/
            }else{
                alert(tipMsg);
                return;
            }
            if(filesize==-1){
                alert(tipMsg);
                return;
            }else if(filesize>maxsize){
                
                return "unfit";
            }else{
                /*alert("文件大小符合要求");*/
                return true;
            }
        }catch(e){
           /* alert(e);*/
        }
    }

/****************搜索输入************************/
$(".findList").keyup(function(){
    /*var hide = $(".searchLists").is(":hidden");
        if(hide){
          $(".searchLists").show();
      }else{
          $(".searchLists").hide();
      }*/
    var val = $(".findList").val();
    if(isEmpty(val)){
        $(".searchLists").hide();
    }
    setTimeout(moreSearch,500);
});

/*****************搜索更多结果*************************/
function moreSearch(){
    var val = $(".findList").val();
    if(!val){
        return;
    }
    var flag = false;
    
    
    $.get("/game/search",{"pageNum":"0","coverUrlCount":"1","pageSize":"3","nameRex":val,"lan":"0"},function(data){
        if(data.statusCode ==1 && data.messageCode == 1){
            $(".searchLists .gameLists").html("");
            if(!isEmpty(data.followingForUsers) && data.followingForUsers.length > 0){
                $(data.followingForUsers).each(function(){
                   var elem = $(".searchLists .game.cloneModel").clone().removeClass("cloneModel");
                   var title;
                   if(this.gameName.length > 32){
                        title = this.gameName.substring(0,32) + "...";
                    }else{
                        title = this.gameName;
                    }
                   elem
                   .find(".typeUrl")
                   .attr("href","/game/" + this.id + "/")
                   .end()
                   .find(".head")
                   .attr("src",this.icon)
                   .end()
                   .find(".name")
                   .attr("title",this.gameName)
                   .html(title)
                   $(".searchLists .gameLists").append(elem);
                });
                flag = true;
                $(".searchLists .games").show();
                $(".allSearch").show();
                $(".searchLists").show();
            }else{
                $(".searchLists .games").hide();
            }
             if(!flag){
                $(".allSearch").hide();
            }else{
                $(".allSearch").show();
            }
        }
    });

    $.get("/post/search",{"pageNum":"0","pageSize":"3","titleRex":val,"lan":"0"},function(data){
        if(data.statusCode ==1 && data.messageCode == 1){
            $(".searchLists .postLists").html("");
            if(!isEmpty(data.posts) && data.posts.length > 0){
                $(data.posts).each(function(){
                   var elem = $(".searchLists .post.cloneModel").clone().removeClass("cloneModel");
                   var title;
                   if(this.title.length > 40){
                        title = this.title.substring(0,40) + "...";
                    }else{
                        title = this.title;
                    }
                   elem
                   .find(".typeUrl")
                   .attr("href","/post/" + this.postId + "/")
                   .end()
                   .find(".name")
                   .attr("title",this.title)
                   .html(title);
                   $(".searchLists .postLists").append(elem);
                });
                $(".searchLists .posts").show();
                flag = true;
                $(".searchLists").show();
            }else{
                $(".searchLists .posts").hide();
            }
            if(!flag){
                $(".allSearch").hide();
            }else{
                $(".allSearch").show();
            }
        }
    });
    $.get("/search/users",{"pageNum":"0","pageSize":"3","coverUrlCount":"1","nameRex":val},function(data){
        if(data.statusCode ==1 && data.messageCode == 1){
            $(".searchLists .userList").html("");
            if(!isEmpty(data.followersForUsers) && data.followersForUsers.length > 0){
                $(data.followersForUsers).each(function(){
                   var elem = $(".searchLists .user.cloneModel").clone().removeClass("cloneModel");
                    this.userName = this.userName + " " + this.lastName;
                   if(this.userName.length > 32){
                        title = this.userName.substring(0,32) + "...";
                    }else{
                        title = this.userName;
                    }
                   elem
                   .find(".typeUrl")
                   .attr("href","/" + this.id + "/")
                   .end()
                   .find(".head")
                   .attr("src",this.userImg)
                   .end()
                   .find(".name")
                   .attr("title",this.userName)
                   .html(title);
                   $(".searchLists .userList").append(elem);
                });
                flag = true;
                $(".searchLists .users").show();
                $(".searchLists").show();
            }else{
                $(".searchLists .users").hide();
            }
            if(!flag){
                $(".allSearch").hide();
            }else{
                $(".allSearch").show();
            }
        }
    });
    
   


}

/***************更多查询点击see all results******************************/
$(".allResults").live("click",function(){
    var val = $(".findList").val();
    window.location.href="/search/" + val + "/";
});
   
$(document).click(function(event){
   event = event || window.event;
   var target = event.target || event.srcElement;
   var c = $(target).attr("class");
   if(!isEmpty(c) && c.indexOf("findList") > -1){
    return;
   }
   var par = $(target).closest(".searchLists");
   if(isEmpty($(par).attr("class"))){
      $(".searchLists").hide();
   }
});
/********************删除帖子******************************/
$(".cancelPost").click(function(){
    var modelId = $("#detailModel .modelId").val();
    var userId = $("#detailModel .userId").val();
    if(isEmpty(modelId)){
        modelId = $(".currentPost").val();

    }
    if(isEmpty(userId)){
        userId = $(".currentUser").val();
    }
    $.get("/post/delete",{postId:modelId,userId:userId},function(data){
        if(data.statusCode ==1 && data.messageCode == 1){
            var par = $(".mybody").attr("class");
            if(par.indexOf("ownPost") > -1){
                window.location.href = "/";
            }else{
                var historyUrl = $("#cancelLink").val();
                window.location.href = historyUrl;
            }
            
        }
    });
});
/***************400,500点击模块跳到相应链接***************************/
$(".part.home").click(function(){
    window.location.href = "/";
});
$(".part.popular").click(function(){
    window.location.href = "/popular";
});
$(".part.video").click(function(){
    window.location.href = "/video";
});
$(".part.game").click(function(){
    window.location.href = "/game/";
});

$(".addDiv").live("click",function(){
    $(".addModal").trigger("click");
});

/*$(".postModal .urls").blur(function(){
    var url = $(this).val();

    if(!isEmpty(url)){
        $.get("video/validate",{url:url},function(data){
            if(!(data.statusCode == 1 && data.messageCode == 1)){
                
                $(".postModal .validate").val("0");
                $(".postModal .urldesc").hide();
                $(".postModal .videoValidate").show();
                
            }else{
                $(".postModal .videoValidate").hide();
                $(".postModal .urldesc").show();
                $(".postModal .validate").val("1");
            }
        });
    }
});*/

/**************修改帖子desc*************************/
$("#editModel .editDesc").click(function(){
       
        var id = $("#detailModel .modelId").val();
        if(isEmpty(id)) id = $(".currentPost").val();
        

        if(editor2.isEmpty()){
            $("#editModel .postRequired").fadeIn(100,function(){
                $(this).fadeOut(3000);
            });
        }else{
            var content = editor2.html();
            $.post("/post/append/add",{postId:id,content:content,originalLanguage:"0"},function(data){
                if(data){
                    
                    $(".userComments .userComment:gt(0)").remove();
                    $(this).attr("disabled",true);
                    var appendCon = data;
                    $(appendCon).each(function(){
                        var obj = this;
                        $(".userModel").find(".userName").html(obj.name + " " + obj.lastName);
                        var elem = $(".userModel")
                        .find(".head")
                        .attr("src",obj.img)
                        .hide()
                        .end()
                        .find(".time")
                        .html(obj.date)
                        .end()
                        .find(".comment")
                        .html(obj.say)
                        .end()
                        .clone()
                        .addClass("aboutUser")
                        .removeClass("userModel")
                        .removeClass("hide");
                        $(".userComments").append(elem);
                    });
                }

                    $("#editModel .close").trigger("click");
            })
           
            
        }
        
       
    });
 