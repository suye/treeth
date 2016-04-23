                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

	var address = "/";




	
	/*****************搜索框focus的时候换背景图片***********************/
	$(".search").focus(function(){
		$(this).css("background","url("+address+"img/search.png) no-repeat right center #fff");

	});
	/*****************搜索框blur的时候换背景图片***********************/
	$(".search").blur(function(){
		$(this).css("background","url("+address+"img/search_gray.png) no-repeat right center #fff");
	});

	/*****************首页帖子图片高度大于800的时候隐藏点击后显示全图*************************/
	$(".thumbnail .showAllImg").live("click",function(){
		var thum = $(this).closest(".thumbnail");
		var startH = $(thum).height();
		$(this).closest(".thumbnail").find(".imgs").css("overflow","visible");
		var moreH = $(thum).find(".seeDetail img").height() - 800;
		$(this).hide();
		changeHeight(this,startH,moreH);
	});
	
	/******************当帖子高度改变影响下面帖子的高度时调整***************************/
	function changeHeight(elem,startH,moreH){
		var thum = $(elem).closest(".thumbnail");
		var columns = $(thum).data("column");
		var counts = $(thum).data("counts");
		var leftDemo = $(thum).position().left;
		var topDemo = $(thum).position().top;
		var parindex = $(".thumbnail").index($(thum));
		var pageNum = columns.substring(0,columns.indexOf(":"));
		//var start = count * (pageNum) - 1;
		
		//var thums = $("#masonry .thumbnail:gt("+start+")");
		var thums = $("#masonry .thumbnail");
		var array = [];
		$(thums).each(function(){
			var left = $(this).position().left;
			var top = $(this).position().top;
			var i = $(".thumbnail").index(this);
			if(left == leftDemo && top > topDemo){
				array.push(this);
			}
			
		});
	
	
		var endH = 0;
		if(moreH == null || moreH == undefined){
			endH = $(thum).height() - startH;
		}else{
			endH = moreH - 0.5;
			$(thum).find(".caption").css("position","relative").animate({top:endH});
		}
		
		
		var flag = false;
		$(remainShow).each(function(){
			if(this.left == leftDemo){
				this.addH += endH;
				flag = true;
				return;
			}
		});
		if(!flag){
			var obj = {
				left:leftDemo,
				addH:addH + endH
			};
			remainShow.push(obj);
		}
		$(array).each(function(){
			var top = $(this).position().top + endH;
			
			$(this).animate({top:top});
		});
		
	}
	/**********************首页点击评论框调整同一个left帖子的高度********************************/
	$(".publish").live("click",function(){
		var loginFlag = checkLogin();
		if(!loginFlag){
			var thum = $(this).closest(".thumbnail");
			var startH = $(thum).height();
			//var startH = $(this).prev().height();
			
			var columns = $(thum).data("column");
			var counts = $(thum).data("counts");
			var leftDemo = $(thum).position().left;
			var topDemo = $(thum).position().top;
			var par = $(this).closest(".thumbnail");
			//var parindex = $(".thumbnail").index($(par));
			var pageNum = columns.substring(0,columns.indexOf(":"));
			//var start = count * (pageNum) - 1;
			
			var thums = $("#masonry .thumbnail");
			//var thums = $("#masonry .thumbnail:gt("+start+")");
			var array = [];
			$(thums).each(function(){
				var left = $(this).position().left;
				var top = $(this).position().top;
				var i = $(".thumbnail").index(this);
				/*if(left == leftDemo && i != parindex && top > topDemo){
					array.push(this);
				}*/
				if(left == leftDemo && top > topDemo){
					array.push(this);
				}
				
			});
		

			
			var endH = $(thum).find(".addOwnComment").height();
			var see = $(thum).data("see");
			
			if(see == undefined){
				see = true;
			}
			if(see){
				$(thum).find(".addOwnComment").find("textarea").val("");
				$(thum).find(".downContent").show();
				$(thum).find(".addOwnComment").show();
				$(thum).find(".addOwnComment").find("textarea").focus();
				$(thum).find(".homeAddComment").attr("disabled",false);
				var endH = $(thum).height() - startH;
				
				$(thum).data("see",false);
				var flag = false;
				$(remainShow).each(function(){
					if(this.left == leftDemo){
						this.addH += endH;
						flag = true;
						
						return;
					}
				});
				if(!flag){
					var obj = {
						left:leftDemo,
						addH:addH + endH
					};
					remainShow.push(obj);
				}
				$(array).each(function(){
					/*alert($(this).position().top);*/
					var top = $(this).position().top + endH;
					
					$(this).animate({top:top},10);

				});
				
			}else{
				$(thum).find(".addOwnComment").hide();
				$(thum).data("see",true);
				var flag = false;
				var endH = startH - $(thum).height();
				$(remainShow).each(function(){
					if(this.left == leftDemo){
						this.addH -= endH;
						flag = true;
						return;
					}
				});
				if(!flag){
					var obj = {
						left:leftDemo,
						addH:addH - endH
					};
					remainShow.push(obj);
				}
				
				$(array).each(function(){
					var top = $(this).position().top - endH;
					$(this).animate({top:top});
				});
				
			}
		}
		
	});
	/*********************首页添加评论向后台发送请求*********************************/
	$(".homeAddComment").live("click",function(){
		var flag = checkLogin();
		if(!flag){
			$(this).attr("disabled",true);
			var t = this;
			var val = $(this).prev().val();
			var thum = $(this).closest(".thumbnail");
			var id = $(thum).find(".modelId").val();
			var userId = $(thum).find(".userId").val();
			var len = $(thum).find(".commodel").length;
			if(val != "" && val != undefined){
				var textarea = $(this).prev();
				var fit = validateContent($(textarea),500);
				if(fit == "2"){
					$("#errorModel .warnContent").html("500 characters or fewer, please!");
					$(".errorBtn").trigger("click");
					return false;
				}
				
				$.post("/post/comment/add",{puserId:userId,postId:id,originalLanguage:"0",description:val},function(data){
					//var startH = $(thum).find(".imgContents").height();
					var startH = $(thum).height();
					if(data){
							var comments = data;
							var imgComments = $('<div class="imgComments"></div>');
							var length = comments.length;
							if(length == 0){
								$(thum).find("hr").hide();
							}else{
								$(thum).find("hr").show();
							}

							var remain = "";
								
							if(length > 0){
								$(comments).each(function(index){
									
									var c = $('<div class="comment commodel" style="padding-bottom:10px"><div class="row"><div class="col-xs-3"><img src="'+this.img+'"><br>'+
											'</div><div class="col-xs-4 contents"><h5 class="name">'+this.name + " " + this.lastName+'</h5>'+
											'<span class="mycontent">'+this.say+'</span></div></div></div>');
										
													
									$(imgComments).append(c);

								});

							}
							$(thum).find(".commentNum").html(length);
							$(thum).find(".thumComments").html("");
							$(thum).find(".imgContents:first").append(imgComments);
							if(length > 5){
								var show = $(thum).data("show");
								if(show != "1"){
									$(thum).find(".comment:gt(4)").css("display","none");
								}
								$(thum).find(".remain").css("display","block");
								
							
							}
							var columns = $(thum).data("column");
							var counts = $(thum).data("counts");
							var leftDemo = $(thum).position().left;
							var topDemo = $(thum).position().top;
							var par = $(t).closest(".thumbnail");
							//var parindex = $(".thumbnail").index($(par));
							var pageNum = columns.substring(0,columns.indexOf(":"));
							//var start = count * (pageNum) - 1;
							var thums = $("#masonry .thumbnail");
							//var thums = $("#masonry .thumbnail:gt("+start+")");
							var array = [];
							$(thums).each(function(index){
								var left = $(this).position().left;
								var top = $(this).position().top;
								var i = $(".thumbnail").index(this);
								if(left == leftDemo && top > topDemo){
									array.push(this);
								}
								
							});
							
							var endH = $(thum).height() - startH;
							
							var flag = false;
							$(remainShow).each(function(){
								if(this.left == leftDemo){
									this.addH += endH;
									flag = true;
									return;
								}
							});
							if(!flag){
								var obj = {
									left:leftDemo,
									addH:addH + endH
								};
								remainShow.push(obj);
							}
							$(array).each(function(){
								var top = $(this).position().top + endH;
								
								$(this).animate({top:top});
							});
							$(t).attr("disabled",false);
							$(t).prev().val("").focus();

						
					}
				})
			}else{
				$(t).prev().removeClass("warnsuccess").addClass("warnerror");
				$("#errorModel .warnContent").html("'text' cannot be blank.");
				$(".errorBtn").trigger("click");
				$(t).attr("disabled",false);
			}
		}
	});
	var currentIndex = 0;
	var masNode = $('#masonry');
	
	var imagesLoading = false;

	var remainShow = [];
	var addH = 0;
	var imgListSmall=[];

	
	/*$(".remain").live("click",function(){
		var t = this;
		$(this).toggle(
			function(){
				
				$(t).val("Hide Comments");
				$(t).closest(".thumbnail").data("show","1")
				var startH = $(t).prev().height();
				
				var columns = $(t).closest(".thumbnail").data("column");
				var counts = $(t).closest(".thumbnail").data("counts");
				var leftDemo = $(t).closest(".thumbnail").position().left;
				var topDemo = $(t).closest(".thumbnail").position().top;
				var par = $(t).closest(".thumbnail");
				var parindex = $(".thumbnail").index($(par));
				var pageNum = columns.substring(0,columns.indexOf(":"));
				//var start = count * (pageNum) - 1;
				
				var thums = $("#masonry .thumbnail");
				//var thums = $("#masonry .thumbnail:gt("+start+")");
				var array = [];
				$(thums).each(function(){
					var left = $(this).position().left;
					var top = $(this).position().top;
					var i = $(".thumbnail").index(this);
					if(left == leftDemo && top > topDemo){
						array.push(this);
					}
					
				});
			
			

				$(t).prev().find(".comment:gt(4)").css("display","block");
				var endH = $(t).prev().height() - startH;
				
				var flag = false;
				$(remainShow).each(function(){
					if(this.left == leftDemo){
						this.addH += endH;
						flag = true;
						return;
					}
				});
				if(!flag){
					var obj = {
						left:leftDemo,
						addH:addH + endH
					};
					remainShow.push(obj);
				}
				$(array).each(function(){
					var top = $(this).position().top + endH;
					
					$(this).animate({top:top});
				});
			},
			function(){
				$(t).val("All Comments");
				$(t).closest(".thumbnail").data("show","1")
				var startH = $(t).prev().height();
				
				var columns = $(t).closest(".thumbnail").data("column");
				var counts = $(t).closest(".thumbnail").data("counts");
				var leftDemo = $(t).closest(".thumbnail").position().left;
				var topDemo = $(t).closest(".thumbnail").position().top;
				var par = $(t).closest(".thumbnail");
				var parindex = $(".thumbnail").index($(par));
				var pageNum = columns.substring(0,columns.indexOf(":"));
				//var start = count * (pageNum) - 1;
				
				var thums = $("#masonry .thumbnail");
				//var thums = $("#masonry .thumbnail:gt("+start+")");
				var array = [];
				$(thums).each(function(){
					var left = $(this).position().left;
					var top = $(this).position().top;
					var i = $(".thumbnail").index(this);
					if(left == leftDemo && top > topDemo){
						array.push(this);
					}
					
				});
			
			

				$(t).prev().find(".comment:gt(4)").css("display","none");
				var endH = $(t).prev().height() - startH;
				
				var flag = false;
				$(remainShow).each(function(){
					if(this.left == leftDemo){
						this.addH += endH;
						flag = true;
						return;
					}
				});
				if(!flag){
					var obj = {
						left:leftDemo,
						addH:addH + endH
					};
					remainShow.push(obj);
				}
				$(array).each(function(){
					var top = $(this).position().top + endH;
					
					$(this).animate({top:top});
				});
				console.log($(window).scrollTop());
				$(window).scrollTop($(window).scrollTop() + endH);
			}
		).trigger('click');
	});*/


	/*******************首页返回请求的时候向模板添加数据*****************************/
	function getNewItems(imgs) {
	
		var newItemContainer = $('<div/>');
		$(imgs).each(function(index){
			var comments ="";
			var length =0;
			if( this.comments !=null){
				comments = this.comments;
				 length = comments.length;
			}
			
			var imgComments = $('<div class="imgComments"></div>');
			
			var remain = "";
		
			if(length > 0){

				$(comments).each(function(index){
				
					/*var regexp = /@\w+\s+/gi;
					var s = this.say;
					var r = "<span style='color:red'>" + s.match(regexp) + "</span>";
					this.say = s.replace(regexp,r);*/
					var c = $('<div class="comment commodel"><div class="row"><div class="col-xs-3"><a href="/'+this.userId+'/" class="personUrl"><img src="'+this.img+'"></a><br>'+
							'</div><div class="col-xs-4 contents"><h5 class="name" title="'+this.name +" "+ this.lastName+'"><a href="/'+this.userId+'/" >'+this.name +" "+ this.lastName+'</a></h5>'+
							'<p class="mycontent">'+this.say+'</p></div></div></div>');
					


					$(imgComments).append(c);

				});
			}
		
			var elem = "";
			/*alert(this.like);*/
			if(this.isLikeByCurrentUser == "0"){
				$(".mymode")
				.find(".likeImg")
				.attr("src",address + "img/like02.png");
				
			}else{
				$(".mymode")
				.find(".likeImg")
				.attr("src",address + "img/like.png");
				$(".mymode")
				.find(".like").data("likeFlag","0");
			}

			var type = this.type;
			if(type == "1"){
				$(".mymode").find(".plays").css("display","inline");
			}else{
				$(".mymode").find(".plays").css("display","none");
			}
			var column = pageNum + ":" + (index + 1);
			if(this.content.length > 92){
                this.content = this.content.substring(0,92) + "...";
            }
           /* $(".testHtml").html(this.content);
            var contentHtml = $(".testHtml p");*/
            $(".testHtml").html(this.content);
			var contents = $(".testHtml p");
			
			var str = "";
			var myContent = "";
			if(contents.length == 0){
				if(this.content.length > 92){
	                this.content = this.content.substring(0,92) + "...";
	            }
			}else{
				$(contents).each(function(){
					var span = $(this).find("span");
					if(span.length > 0){
						str = str + $(span).html();
					}else{
						str = str + $(this).html();
					}
					if(str.length >92){
						return false;
					}else{
						myContent = myContent + $(this).html();
					}

				});
				myContent = "<p>" + "</p>";
			}
			$(".mymode")
				.find(".commentNum")
				.html(this.commentNum);
			if(length == 0){
				$(".mymode").find("hr").hide();
			}else{
				$(".mymode").find("hr").show();
			}

			if(length <= 5){
				
				elem = $(".mymode")
						.find(".modelId")
						.val(this.postId)
						.end()
						.find(".userId")
						.val(this.userId)
						.end()
						.find(".personUrl")
						.attr("href","/" + this.userId + "/")
						.end()
						.find(".user")
						.attr("src",this.userImg)
						.end()
						.find(".userName")
						.attr("title",this.userName + " " + this.lastName)
						.html(this.userName + " " + this.lastName)
						.end()
						.find(".showimg")
						.val(this.imgsrc)
						.end()
						.find(".myauthor")
						.html(this.owner)
						.end()
						.find(".title")
						.html(this.title)
						.end()
						.find(".content")
						.html(this.content)
						.end()
						.find(".likeNum")
						.html(this.likeNum)
						.end()
						.find(".imgContents")
						.html("")
						.append(imgComments)
						.end()
						.find(".remain")
						.css("display","none")
						.end()
						.addClass("imgModal")
						.clone()
						.data("column",column)
						.removeClass("mymode");
			}else{
				elem = $(".mymode")
						.find(".modelId")
						.val(this.postId)
						.end()
						.find(".userId")
						.val(this.userId)
						.end()
						.find(".personUrl")
						.attr("href","/" + this.userId + "/")
						.end()
						.find(".user")
						.attr("src",this.userImg)
						.end()
						.find(".userName")
						.attr("title",this.userName + " " + this.lastName)
						.html(this.userName + " " + this.lastName)
						.end()
						.find(".showimg")
						.val(this.imgsrc)
						.end()
						.find(".myauthor")
						.html(this.owner)
						.end()
						.find(".title")
						.html(this.title)
						.end()
						.find(".content")
						.html(this.content)
						.end()
						.find(".likeNum")
						.html(this.likeNum)
						.end()
						.find(".imgContents")
						.html("")
						.append(imgComments)
						.end()
						.find(".remain")
						.css("display","block")
						.data("remain","111")
						.end()
						.addClass("imgModal")
						.clone()
						.data("column",column)
						.data("counts",length - 5)
						.removeClass("mymode");
			}
			elem.find(".personsName").val(this.userName + " " + this.lastName);
			if(!isEmpty(this.width)){
				elem.find(".width").val(this.width);
			}else{
				elem.find(".width").val(0);
			}
			if(!isEmpty(this.height)){
				elem.find(".height").val(this.height);
			}else{
				elem.find(".height").val(0);
			}
			
			var loginName = $(".loginName").val();
			var loginImg = $(".loginImg").val();
			if(loginName != "" && loginName != undefined){
				$(elem).find(".addOwnComment .userName").html(loginName);
			}
			if(loginImg != "" && loginImg != undefined){
				$(elem).find(".addOwnComment .user").attr("src",loginImg);
			}

			if(length > 0){
				$(elem).find(".downContent").show();
			}

			newItemContainer.append(elem);
			
		});

		
		
		return newItemContainer.find('.thumbnail');
	}

	$(".thumbnail .likeImg").live("mouseenter",function(){
		var src = $(this).attr("src");
		if(src != address + "img/like02.png"){
			changePic(this,address + "img/like03.png");
		}
		
	});
	$(".thumbnail .likeImg").live("mouseleave",function(){
		var src = $(this).attr("src");
		if(src != address + "img/like02.png"){
			changePic(this,address + "img/like.png");
		}
		
	});
	$(".thumbnail .commentImg").live("mouseenter",function(){
		changePic(this,address + "img/comments02.png");
	});
	$(".thumbnail .commentImg").live("mouseleave",function(){
		changePic(this,address + "img/comments01.png");
	});
	$(".thumbnail .twiterImg").live("mouseenter",function(){
		changePic(this,address + "img/twitter02.png");
	});
	$(".thumbnail .twiterImg").live("mouseleave",function(){
		changePic(this,address + "img/twitter.png");
	});
	$(".thumbnail .faceImg").live("mouseenter",function(){
		changePic(this,address + "img/facebook02.png");
	});
	$(".thumbnail .faceImg").live("mouseleave",function(){
		changePic(this,address + "img/facebook.png");
	});

	/********************帖子首页like,comment,share,facebook鼠标放上去离开改变图片****************************/
	function changePic(obj,src){
		$(obj).attr("src",src);
	}
	var preImgs = [];
	/**************************向帖子模板的hidden图片变成img*************************************/
	function processNewItems(items) {
		items.each(function() {

			var $this = $(this);
			var imgsNode = $this.find('.imgs');
			var title = $this.find('.title').text();
			var author = $this.find('.author').text();
			title += '&nbsp;&nbsp;(' + author + ')';
			var lightboxName = 'lightbox_'; // + imgNames[0];
			var width = $this.find(".width").val();
			var height = $this.find(".height").val();
			var imgNames = imgsNode.find('input[type=hidden]').val().split(',');

			$.each(imgNames, function(index, item) {

				if(item.indexOf(".png") > -1){
					if(height != 0){
                    	var src = address + "img/pre" + Math.floor(Math.random()*10) + ".png";
                    	imgsNode.append('<a href="#detailModel" data-toggle="modal" class="seeDetail" style=""><img src="'+src+'" class="itemImg" width="'+width+'" height="'+height+'" style="background-color: #efefef;"/></a>');
                    }else{
                    	imgsNode.append('<a href="#detailModel" data-toggle="modal" class="seeDetail"><img src="'+ item +'" style="background-color: #efefef;"/></a>');
                    }
					
				}else{
					
                    if(height != 0){
                    	var src = address + "img/pre" + Math.floor(Math.random()*10) + ".png";
                    	imgsNode.append('<a href="#detailModel" data-toggle="modal" class="seeDetail" style=""><img src="'+src+'" class="itemImg" width="'+width+'" height="'+height+'"/></a>');
                    }else{
                    	imgsNode.append('<a href="#detailModel" data-toggle="modal" class="seeDetail" style="background-color:#d4dcda"><img src="'+ item +'" /></a>');
                    }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
					

				}
				

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
				
			});                 
		});
	}

	var pageNum = 1;
	var totalWidth = 0;
	var count = 0;
	var init = false;
	var column1 = 0;
	var column2 = 0;
	var column3 = 0;
	var column4 = 0;
	var column5 = 0;
	var column6 = 0;
	var column7 = 0;
	var thumLengthFlag = false;
	var thumLikeLengthFlag = false;
	
	var thumLengthGameFlag = false;
	var userId = window.location.href.split("/")[3];
	/*=====================================================================================================
									 初始化请求参数
	======================================================================================================*/

	function initMasonry(RequestUrl, para) {
		
		$(".initload").show();
		var imgs = [];
		init = true;
		var time = new Date();
		var requestPara = $.extend({"pageNum":pageNum,"pageSize":"12","lan":"0",time:time},para);
		imagesLoading = true;
		 $.ajax({
		     url:RequestUrl,
		     dataType:'json',
		     data:requestPara,
		     cache:false, 
		     ifModified :true, 
		   
		     success:function(data){
		    
		     	if(data.hasOwnProperty("posts")){

		     		if(data.posts==null){
		     			return;
		     		}

		     		if(RequestUrl.indexOf("post/search") > -1){
		     			if(data.posts.length == 0){
		     				$(".noContentDiv").html('<div class="pageImg"><img src="'+address+'img/Find-Posts.png"></div><div style="text-align:center;width:100%;"><p class="pageDescribe">'+"'"+para.titleRex+"'"+' has no matching posts.</P></div>');
		     			}
		     		}
		     		imgs = data.posts;

		     	}else{

		      	 	imgs = data;
		     }

				if(imgs.length < 12){
					if(!isEmpty(para) && !isEmpty(para.thumFlag) && para.thumFlag == "like"){
						thumLikeLengthFlag = true;
					}else{
						thumLengthFlag = true;
					}
				}
			var items = getNewItems(imgs).css('opacity', 0);
			processNewItems(items);
			masNode.append(items);
			
			pageNum = 4;
			
			

			items.imagesLoaded(function(){
			
				
				
				items.css('opacity', 1);
				var leftArray = [0,240,480,720,9601,1200,1440];
				masNode.masonry({
					itemSelector: '.thumbnail',
					isFitWidth: true,
					leftArray:leftArray
				});
				totalWidth = $("#masonry").innerWidth();
				count = Math.floor(totalWidth / 236);
				init = false;
				$(".initload").hide();
				imagesLoading = false;	

				var thumsFirst = $(".thumbnail:lt(7)");
					

					$(thumsFirst).each(function(index){
						if(index == 0){
							column1 = $(this).position().left;
						}else if(index == 1){
							column2 = $(this).position().left;
						}else if(index == 2){
							column3 = $(this).position().left;
						}else if(index == 3){
							column4 = $(this).position().left;
						}else if(index == 4){
							column5 = $(this).position().left;
						}else if(index == 5){
							column6 = $(this).position().left;
						}else if(index == 6){
							column7 = $(this).position().left;
						}
					});
				if(!isEmpty(para)){
					if(para.initFlag == "1"){
						var post = $(".thumbnail:eq(1)");
						
						var top = $(post).find(".like").offset().top;
						var left = $(post).find(".like").offset().left;
						$(".module4 .modal-dialog").css({"left":left - 105,"top":top - 290});
						$(".module4 .chose").css({"position":"absolute","top":top - 90,"left":left - 10});
						$(".guideBtn4").trigger("click");

					}
				}
				$(items).each(function(){
					var $this = $(this);
					var imgsNode = $this.find('.imgs');
					var imgNames = imgsNode.find('input[type=hidden]').val().split(',');
					var preImg = imgsNode.find(".itemImg");
					
					if(!isEmpty(preImg) && !isEmpty(preImg.attr("class")) && preImg.attr("class").indexOf("itemImg") > -1){
						$.imgpreload(imgNames,
					    {
					        each: function () {
					            
					            var status = $(this).data('loaded') ? 'success' : 'error';
					            if (status == "success") { 
					                imgsNode.find(".itemImg").attr({"src":imgNames});                
					            }
					        }
					        
					    });
					}
					
				});
				if(!isEmpty(RequestUrl) && RequestUrl.indexOf("post/list") > -1 && RequestUrl.indexOf("game/post/list") <= -1){
	     			appendToMasonry("/post/list",{num:1});
					appendToMasonry("/post/list",{num:1});
					appendToMasonry("/post/list",{num:1});
					appendToMasonry("/post/list",{num:1});
	     		}
				
				
					
					
					
				
				
			});
			
			
			
			$(".thumbnail").each(function(){
				$(this).find(".comment:gt(4)").css("display","none");
			});
		     },
		     async:false
		     
		  });

 		

		
		
	}
		
	/************下拉的时候加载新的数据*************/
	function appendToMasonry(requestUrl,para) {
		var imgs = [];
		pageNum++;

		imagesLoading = true;
		$(".loadFoot").show();
		/*if(!isEmpty(para) && para.num == 1){
			para.pageSize = "3";
		}*/
		var requestPara;
		if(!isEmpty(para) && !isEmpty(para.pageToNum)){
			requestPara = $.extend({"pageNum":pageNum,"pageSize":"3","lan":"0"},para);
		}else{
			requestPara = $.extend({"pageNum":pageNum,"pageSize":"3","lan":"0"},para);
		}
		
		$.get(requestUrl,requestPara,function(data){
				if(data.posts == null)
					imgs = data;
				else
					imgs = data.posts;
			if(imgs !=null && imgs.length < 3){
				if(!isEmpty(para) && !isEmpty(para.thumFlag) && para.thumFlag == "like"){
					thumLikeLengthFlag = true;
				}else{
					thumLengthFlag = true;
				}
			}
			if(!isEmpty(imgs) && imgs.length == 0){
				$(".footgif").hide();
				$(".footpng").show();
				$(".footFont").show();
				return;
			}
			var items = getNewItems(imgs).css('opacity', 0);

			processNewItems(items);
			masNode.append(items);
			
			

			items.imagesLoaded(function(){
				
				items.css('opacity', 1);
				var leftArray = [];
				
				//var start = count * (pageNum - 1) - 1;
				var thums = $("#masonry .thumbnail");
				//var thums = $("#masonry .thumbnail:gt("+start+")");
				
				$(items).each(function(index){

					$(this).find(".comment:gt(4)").css("display","none");
					
				});
				leftArray.push(column1,column2,column3,column4,column5,column6,column7);
				
				masNode.masonry('appended',  items,leftArray,remainShow);
				imagesLoading = false;
				$(".loadFoot").hide();
				$(items).each(function(){
					var $this = $(this);
					var imgsNode = $this.find('.imgs');
					var imgNames = imgsNode.find('input[type=hidden]').val().split(',');
					var preImg = imgsNode.find(".itemImg");

					if(!isEmpty(preImg) && !isEmpty(preImg.attr("class")) && preImg.attr("class").indexOf("itemImg") > -1){
						$.imgpreload(imgNames,
					    {
					        each: function () {
					            
					            var status = $(this).data('loaded') ? 'success' : 'error';
					            if (status == "success") { 
					                imgsNode.find(".itemImg").attr({"src":imgNames});                
					            }
					        }
					        
					    });
					}
					
				});
				
			});
			
			
			
			
		});
		
	}



	
	
	var resizeW = $(window).width();



	var resizeL = (resizeW - 1000) / 2;
	//alert(resizeL);
	
	/*$(window).resize(function(){
		var w = $(this).width();
		var  r = (w - 1010) / 4;
		alert(r);
		$(".mycontainer").animate({"left":r});
		
		
		
	});*/




	function randomColor() {
		var rand = Math.floor(Math.random() * 0xFFFFFF).toString(16);
		for (; rand.length < 6;) {
			rand = '0' + rand;
		}
		return '#' + rand;
	}
	
		



	 

		


	/***************进入帖子详情模块****************/
	var blockIndex = 0;
	var pageIndex = 2;
	$(".thumbnail .play").live("click",function(){
		$(this).closest(".thumbnail").find(".seeDetail").trigger("click");
	});
	/*******************帖子首页点击图片进入详情页***************************/
	$(".seeDetail").live("click",function(){
		
		
		historyUrl = window.location.href;
		$("#cancelLink").val(historyUrl);
		var modelId = $(this).parents(".imgModal").find(".modelId").val();

		
		if(modelId == null || modelId == undefined || modelId == ""){
			modelId = $(this).closest(".gameImg").find(".postId").val();
			
		}
		
		var userId = $(this).closest(".imgModal").find(".userId").val();

		
		if(userId == null || userId == undefined || userId == ""){
			userId = $(this).closest(".gameImg").find(".postUserId").val();
			
		}
		
		pageIndex = 2;
		blockIndex = 0;
		$("#detailModel .modelId").val(modelId);
		$("#detailModel .userId").val(userId);
		
		$(this).closest(".thumbnail").addClass("insee");
		
		 var url = "http://" + window.location.host + "/post"+'/'+modelId + '/';
	     var state = {content:"aaa",url:"http://" + window.location.host + "/post"};
	     if(window.history.pushState){
			window.history.pushState(state,"0",url);
		 }else{
			window.location.href = url;
		 }
	     $(".moreImgs #one").html("");
		 $(".moreImgs #two").html("");
		 $(".moreImgs #three").html("");
		 $(".wall .detailImg").attr("src","");
		 $(".wall .smallPic").each(function(){
			
			$(this).attr("src","");
		 });
		 /*****************详情页请求数据*************************/
		$.get("/post/detail",{userId:userId,id:modelId,lan:0},function(data){
			$("#detailModel").scrollTop(0);
			$("#detailModel .modal-contents").scrollTop(0);
			$(".smallPicBox").css("display","none");
			var obj = data;
			obj = $(obj)[0];
			var id = obj.id;
			$("#detailModel .tophead .head").attr("src",obj.userImg);

			$("#detailModel .tophead .userName").html(obj.userName + " " + obj.lastName);
			

			$("title").html("Post by "+obj.userName+" from "+obj.gameInfo.gameName+"| Treeth");
			var loginId = $(".userInfo").val();

			var loginName = $(".loginName").val();
			var loginImg = $(".loginImg").val();
			if(loginName != "" && loginName != undefined){
				$(".moreComment .loginInfo").show();
				$("#detailModel .moreComment .comment").css("marginTop","8px");
				$(".moreComment .userName").html(loginName);
			}else{
				$(".moreComment .loginInfo").hide();
				$("#detailModel .moreComment .comment").css("marginTop","0px");
			}
			if(loginImg != "" && loginImg != undefined){
				$(".moreComment .head").attr("src",loginImg);
			}


			$("#detailModel .postTitle").html(obj.title);
			var like = obj.isOrNotLikeByCurrentUser;
			
			$("#detailModel .likeon").val(like);
			if(like == "0"){
				$("#detailModel .glyphicon-heart,.detailTop .glyphicon-heart").css("color","red");
			}else{
				$("#detailModel .glyphicon-heart,.detailTop .glyphicon-heart").css("color","#878787");
			}
			
			$(".likeNumbtn").html(obj.likeNum);
			var imgList = obj.imgList;
			imgListSmall = imgList;
			var compressImgList = obj.compressImgList;
			var type = obj.type;
			$("#detailModel .personUrl").attr("href","/" + obj.userId + "/");
			
			if(type == "1"){
				$(".wall .showPic").find("iframe").remove();
				var elem = $("<iframe width='660' height='335' src='"+imgList+"' frameborder='0' allowfullscreen></iframe>");

				$(".wall .showPic").find("img").hide();
				$(".wall .smallPics").hide();
				$(".wall .showPic").append(elem);
			}else{
				$(".wall .showPic").find("img").show();
				$(".wall .smallPics").show();
				$(".wall .showPic").find("iframe").remove();
			}
			
			var compressImgList = obj.compressImgList;

		
			var share_url = "https://www.facebook.com/dialog/feed?app_id=335300939983221";
				share_url +="&u="+window.location.href;
				share_url += "&link="+window.location.href;
				if(compressImgList ==null || compressImgList == "" || compressImgList == undefined){
					share_url += "&picture="+imgList[0];
				}else{
					share_url += "&picture="+compressImgList[0];
				}
				share_url += "&caption="+obj.userName;
				share_url += "&name="+obj.title;
				share_url += "&description="+obj.content;
				share_url += "&redirect_uri=http://www.facebook.com/";

				$("#shareToFacebook").live("click",function(){
					$.post(
						"/share",
						{postId:id},
						function(message){
							if(message.statusCode == 1 && message.messageCode == 1){
								
							}
						}
						);
					window.open(share_url, 'newWindow', 'width=800, height=500','center');
					
				});
			var twitter_url = "https://twitter.com/intent/tweet?";
				twitter_url +="text="+"See what "+obj.username+" "+ obj.lastName+" has discovered on Treeth.\n"+window.location.href+" @treeth_sevenga";
				
				
				$("#shareToTwitter").live("click",function(){
					
					console.log("click");
					$.post(
						"/share",
						{postId:id},
						function(message){
							if(message.statusCode == 1 && message.messageCode == 1){
								
							}
						});
					window.open(twitter_url, "myWindow","status = 1, height = 300, width = 600, resizable = 0");
				
				});

				if(compressImgList == "" || compressImgList == null || compressImgList == undefined){
					 getImageSize({
			        	img:imgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":imgList[0],"width":objWidth,"height":objHeight});
			        	}
			        }); 
					

					$(imgList).each(function(index){
						if(imgList.length>1)
						 getImageSize({
			                img:imgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                  indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":imgList[index],"width":objWidth,"height":objHeight});
			              	   indexImg.VMiddleImg();
								if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									indexImg.parent().css("display","inline-block");
								}
								indexImg = null;
			                }
			            });
						
					});
				}else{
						
					  getImageSize({
			        	img:compressImgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":compressImgList[0],"width":objWidth,"height":objHeight});
			        	}
			        	}); 
					/*$.imgpreload(imgList[0],function(){
	                
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:imgList[0],
					        	oncomplete:function(){
					        		  var objWidth = this.width;
					                  var objHeight = this.height;
					        		$(".wall .detailImg").attr({"src":imgList[0],"width":objWidth,"height":objHeight});
					        	}
				        	});
		                    
		                }
	           		});*/
	           		var r;
	           		if(imgList[0].indexOf("/compress/") > -1){
						r = imgList[0].replace("/compress/","/original/");
					}else if(imgList[0].indexOf("/show/") > -1){
						r = imgList[0].replace("/show/","/original/");
					}else{
						r = imgList[0];
					}
	           		
	           		$.imgpreload(r,function(){
	                
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:r,
					        	oncomplete:function(){
					        		  var objWidth = this.width;
					                  var objHeight = this.height;
					                  $(".wall .detailImg").attr({"width":"","height":""});
					                  if(objWidth <= 665){
					                  	$(".wall .detailImg").attr({"src":r,"width":objWidth,"height":objHeight});
					                  }else{
					                  	$(".wall .detailImg").attr({"src":r});
					                  }
					        		
					        	}
				        	});
		                    
		                }
	           		});
					$(compressImgList).each(function(index){
						if(compressImgList.length>1)
						 getImageSize({
			                img:compressImgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                   indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":compressImgList[index],"width":objWidth,"height":objHeight});
			             	   indexImg.VMiddleImg();


			                if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									
									indexImg.parent().css("display","inline-block");

							  }

							   indexImg = null;
			                   
			                }
			            });
					});
					
				}

			$(".wall .smallPic:eq(0)").css({"opacity":"1"});
			$(".wall .smallPicBox:eq(0)").css({"border":"1px solid #66afe9"});
			
			$(".userComments").html("");
			var desc = obj.content;
			$(".detailComments .postHead img").attr("src",obj.userImg);

			$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
				var elem = $(".userModel")
				.find(".time")
				.html(obj.date)
				.end()
				.find(".comment")
				.html(obj.content)
				.end()
				.clone()
				.addClass("aboutUser")
				.removeClass("userModel")
				.removeClass("hide");
				$(".userComments").append(elem);

			
			
			var appendCon = obj.appends;
			$(appendCon).each(function(){
				$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
				var elem = $(".userModel")
				.find(".time")
				.html(this.date)
				.end()
				.find(".comment")
				.html(this.content)
				.end()
				.clone()
				.addClass("aboutUser")
				.removeClass("userModel")
				.removeClass("hide");
				$(".userComments").append(elem);
			});
			$("#detailModel .aboutUser:gt(0)").find(".head").hide();

			var otherComments = obj.comments;

			$("#detailModel .otherLength").val(otherComments.length);
			if(otherComments.length == 0){
				$("#detailModel .otherCommets").css("border","none");
			}
			$("#detailModel .otherCommets").html("");
			$(otherComments).each(function(){
				
				$(".otherModel").find(".userName").html(this.name + " " + this.lastName);
				var elem = $(".otherModel")
				.find(".head")
				.attr("src",this.img)
				.end()
				.find(".commentId")
				.val(this.id)
				.end()
				.find(".time")
				.html(this.date)
				.end()
				.find(".comment")
				.html(this.say)
				.end()
				.clone()
				.removeClass("otherModel")
				.removeClass("hide");
				
				$(elem).find(".commentUser").attr("href","/" + this.userId + "/");
				//var address = "http://" + window.location.host + "/treeth";
				if(this.userId == loginId){
					elem.find(".operate").attr({"src":address +"img/delComment.png","title":"delete","data-toggle":"modal","data-target":"#cancelModel"}).addClass("cancelComment").removeClass("operate");
				}else{
					elem.find(".operate").attr({"src":address + "img/reply.png","title":"reply"});
				}

				/*var regexp = /@\w+\s+/gi;
				var s = elem.find(".comment").html();
				var r = "<span style='color:red'>" + s.match(regexp) + "</span>";
				elem.find(".comment").html(s.replace(regexp,r));*/

				$(".otherCommets").append(elem);
			});
			$(".myComment:gt(5)").addClass("hide");
			
			if(otherComments.length > 5){
				var btn = $('<div class="seeAll"><button class="remains btn btn-default btn-sm ">See All Comments</button></div>')
				$(".otherCommets").append(btn);	
			}					
			
			$(".seeAll").toggle(
				function(){
					$(".otherCommets .myComment").removeClass("hide");
					$(this).find("button").html("Hide More");
				},
				function(){
					$(".otherCommets .myComment:gt(4)").addClass("hide");
					$(this).find("button").html("See All Comments");
				}
			);	
			$(".detailTags").html("");						
			$(obj.labels).each(function(){
				var tag = $('<div class="detailTag">'+this+'</div>');
				$(".detailTags").append(tag);
			});							
			
			$("#detailModel .gameId").val(obj.gameInfo.id);
			
			$("#detailModel .gameUrl").attr("href","/game/" + obj.gameInfo.id +"/");
			$("#detailModel .detailFoot").find(".head").attr("src",obj.userImg).end().find(".userName").attr("title",obj.userName + " " + obj.lastName).html(obj.userName + " " + obj.lastName);
			$("#detailModel .gameFrom").find(".gamePic").attr("src",obj.gameInfo.icon).end().find(".userName").attr("title",obj.gameInfo.gameName).html(obj.gameInfo.gameName);			
			var loginId = $(".userInfo").val();
			if(obj.userId == loginId){
				$(".editDescription").show();
				$("#detailModel .detailFoot").find(".loginFollow").html("That's you!").attr("disabled",true);

			}else{
				$(".editDescription").hide();
				if(obj.isOrNotFollowUserByCurrenUser == "0"){
					$("#detailModel .detailFoot").find(".loginFollow").html("Unfollow").removeAttr("disabled");
				}else{
					$("#detailModel .detailFoot").find(".loginFollow").html("Follow").removeAttr("disabled");
				}
				
			}
			if(obj.isOrNotFollowGameByCurrenUser == "0"){
				$("#detailModel .gameFrom").find(".btn").html("Unfollow");
			}else{
				$("#detailModel .gameFrom").find(".btn").html("Follow");
			}


			var imgs = obj.coverImgs;
			
			
			
			
			
			$(imgs).each(function(){
				var id = this.id;
				var src = this.coverImg;
				var cover;
				if(this.type == 1){
					cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
				}else{
					cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
				}
				
				
				$(".moreImgs .number:eq("+blockIndex+")").append(cover);
				if(blockIndex < 2){
					blockIndex++;
				}else{
					blockIndex = 0;
				}
			});
	

			
			if(window.history.replaceState){
				window.history.replaceState(state,"0",url);
			}
			 
			window.onpopstate = function(){
			 	
			 	window.history.replaceState(state,"0",historyUrl);

	           $("#detailModel .detailClose").trigger("click");
	           $("title").html("Treeth");
	           $(".detailTop").hide();
	           $("#detailModel .top").show();
	           $("#detailModel .modal-header").show();
			   $(".detailHeader").hide();
	           $("#detailModel .wall").css("margin-top","0px");
	           $(".detailTop").css({"top":"5%"});
				$(".wall .showPic").find("iframe").remove();
			   $("#detailModel .rightContent").css("margin-top","0px");
			   $("#detailModel .leftContent").css("margin-top","0px");
	        }					
			
		})
		
			
	});
	
		/********************首页点击all comments调整同一个left的高度****************************************/
	$(".remain").live("click",function(){
			
			setTimeout(function(){

				$("#detailModel .modal-contents").scrollTop(10000);

			}, 1500);
	/*	$(this).attr("disabled",true);
		$(this).closest(".thumbnail").data("show","1")
		var startH = $(this).prev().height();
		
		var columns = $(this).closest(".thumbnail").data("column");
		var counts = $(this).closest(".thumbnail").data("counts");
		var leftDemo = $(this).closest(".thumbnail").position().left;
		var topDemo = $(this).closest(".thumbnail").position().top;
		var par = $(this).closest(".thumbnail");
		var parindex = $(".thumbnail").index($(par));
		var pageNum = columns.substring(0,columns.indexOf(":"));
		//var start = count * (pageNum) - 1;
		
		var thums = $("#masonry .thumbnail");
		//var thums = $("#masonry .thumbnail:gt("+start+")");
		var array = [];
		$(thums).each(function(){
			var left = $(this).position().left;
			var top = $(this).position().top;
			var i = $(".thumbnail").index(this);
			if(left == leftDemo && top > topDemo){
				array.push(this);
			}
			
		});
	
	

		$(this).prev().find(".comment:gt(4)").css("display","block");
		var endH = $(this).prev().height() - startH;
		
		var flag = false;
		$(remainShow).each(function(){
			if(this.left == leftDemo){
				this.addH += endH;
				flag = true;
				return;
			}
		});
		if(!flag){
			var obj = {
				left:leftDemo,
				addH:addH + endH
			};
			remainShow.push(obj);
		}
		$(array).each(function(){
			var top = $(this).position().top + endH;
			
			$(this).animate({top:top});
		});*/
		
	});
   $(".moreImgs").scroll(function(){
	  	  var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
	      var nScrollTop = 0;   //滚动到的当前位置
	      var nDivHight = $(".moreImgs").height();
          nScrollHight = $(this)[0].scrollHeight;
          nScrollTop = $(this)[0].scrollTop;
          var modelId = $("#detailModel .modelId").val();
          var userId = $("#detailModel .userId").val();
          if(nScrollTop + nDivHight >= nScrollHight){
           	if(true) {
			
				$.get("/post/cover/list",{postId:modelId,userId:userId,pageNum:pageIndex,pageSize:20},function(data){
					
					var obj = data;
					$(obj).each(function(){
						var id = this.id;
						var src = this.coverImg;
						
						var cover;
						if(this.type == 1){
							cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
						}else{
							cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
						}
						$(".moreImgs .number:eq("+blockIndex+")").append(cover);
						if(blockIndex < 2){
							blockIndex++;
						}else{
							blockIndex = 0;
						}
					});
					pageIndex++;
				})
				 
			}
          }
      });
 
 var historyUrl = "";

	$(".cover").live("click",function(){
		var modelId = $(this).find(".modelId").val();
		var userId = $(this).find(".userId").val();
		$(".moreImgs #one").html("");
		$(".moreImgs #two").html("");
		$(".moreImgs #three").html("");
		$("#detailModel .modelId").val(modelId);
		 var url = history.state.url+'/'+modelId + '/';
		pageIndex = 0;

	     var state = {content:"aaa",url:history.state.url};
		
		$.get("/post/detail",{userId:userId,id:modelId,lan:0},function(data){
			$(".smallPicBox").css("display","none");
			var loginName = $(".loginName").val();
			var loginImg = $(".loginImg").val();
			if(loginName != ""){
				$(".moreComment .userName").html(loginName);
			}
			if(loginImg != ""){
				$(".moreComment .head").attr("src",loginImg);
			}
			var obj = data;
			obj = $(obj)[0];
			var id = obj.id;

			$("title").html("Post by "+obj.userName+" from "+obj.gameInfo.gameName+"| Treeth");

			$("#detailModel .postTitle").html(obj.title);
			var like = obj.isOrNotLikeByCurrentUser;
			
			$("#detailModel .likeon").val(like);
			if(like == "0"){
				$("#detailModel .glyphicon-heart").css("color","red");
			}else{
				$("#detailModel .glyphicon-heart").css("color","#878787");
			}
			$("#detailModel .personUrl").attr("href","/" + obj.userId + "/");
			$(".likeNumbtn").html(obj.likeNum);
			var imgList = obj.imgList;
			var type = obj.type;
			
			$(".wall .smallPic").each(function(){
				$(this).show();
				$(this).attr("src","");
			});
			if(type == "1"){
				$(".wall .showPic").find("iframe").remove();
				var elem = $("<iframe width='660' height='335' src='"+imgList+"' frameborder='0' allowfullscreen></iframe>");
				$(".wall .showPic").find("img").hide();
				$(".wall .smallPics").hide();
				$(".wall .showPic").append(elem);
			}else{
				$(".wall .showPic").find("img").show();
				$(".wall .smallPics").show();
				$(".wall .showPic").find("iframe").remove();
			}
			
			$(".wall .detailImg").attr("src",imgList[0]);
			$(".wall .smallPic:eq(0)").css({"opacity":"1"});
			$(".wall .smallPicBox:eq(0)").css({"border":"1px solid #66afe9"});
			var compressImgList  = obj.compressImgList;
			if(compressImgList == "" || compressImgList == null || compressImgList == undefined){
						getImageSize({
			        	img:imgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":imgList[0]});
			        	}
			        }); 

					$(imgList).each(function(index){
						if(imgList.length>1)
						 getImageSize({
			                img:imgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                  indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":imgList[index],"width":objWidth,"height":objHeight});
			              	   indexImg.VMiddleImg();
								if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									indexImg.parent().css("display","inline-block");
								}
								indexImg = null;
			                }
			            });

					});
				}else{

					 getImageSize({
			        	img:compressImgList[0],
			        	oncomplete:function(){
			        		  var objWidth = this.width;
			                  var objHeight = this.height;
			        		$(".wall .detailImg").attr({"src":compressImgList[0],"width":objWidth,"height":objHeight});
			        	}
			        	}); 
					/*$.imgpreload(imgList[0],function(){
	                
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:imgList[0],
					        	oncomplete:function(){
					        		  var objWidth = this.width;
					                  var objHeight = this.height;
					        		$(".wall .detailImg").attr({"src":imgList[0],"width":objWidth,"height":objHeight});
					        	}
				        	});
		                    
		                }
	           		});*/
	           		var r = imgList[0].replace("/show/","/original/");
	           		$.imgpreload(r,function(){
	                
		                if($(this).data('loaded')){
		                	
		                	getImageSize({
					        	img:r,
					        	oncomplete:function(){
					        	   var objWidth = this.width;
					               var objHeight = this.height;
					               $(".wall .detailImg").attr({"width":"","height":""});
				                    if(objWidth <= 665){
				                  		$(".wall .detailImg").attr({"src":r,"width":objWidth,"height":objHeight});
				                   }else{
				                  		$(".wall .detailImg").attr({"src":r});
				                   	}
					        	}
				        	});
		                    
		                }
	           		});
					$(compressImgList).each(function(index){
						if(compressImgList.length>1)
						 getImageSize({
			                img:compressImgList[index],
			                oncomplete:function(){
			                  var indexImg = null;
			                  var objWidth = this.width;
			                  var objHeight = this.height;
			                   indexImg = $(".wall .smallPic:eq("+index+")");
			                   indexImg.attr({"src":compressImgList[index],"width":objWidth,"height":objHeight});
			             	   indexImg.VMiddleImg();


			                if(indexImg.attr("src") != ""&& indexImg.attr("src") != null && indexImg.attr("src") != undefined){
									
									indexImg.parent().css("display","inline-block");

							  }

							   indexImg = null;
			                   
			                }
			            });
					});
				}
			$(".userComments").html("");
			$(".detailComments .postHead img").attr("src",obj.userImg);
			var desc = obj.content;
			$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
				var elem = $(".userModel")
				.find(".time")
				.html(obj.date)
				.end()
				.find(".comment")
				.html(obj.content)
				.end()
				.clone()
				.addClass("aboutUser")
				.removeClass("userModel")
				.removeClass("hide");
				$(".userComments").append(elem);

			
			
			var appendCon = obj.appends;
			$(appendCon).each(function(){
				$(".userModel").find(".userName").html(obj.userName + " " + obj.lastName);
				var elem = $(".userModel")
				.find(".time")
				.html(this.date)
				.end()
				.find(".comment")
				.html(this.content)
				.end()
				.clone()
				.addClass("aboutUser")
				.removeClass("userModel")
				.removeClass("hide");
				$(".userComments").append(elem);
			});
			var otherComments = obj.comments;

			$("#detailModel .otherLength").val(otherComments.length);
			if(otherComments.length == 0){
				$("#detailModel .otherCommets").css("border","none");
			}
			$("#detailModel .otherCommets").html("");
			$(otherComments).each(function(){
				
				$(".otherModel").find(".userName").html(this.name + " " + this.lastName);
				var elem = $(".otherModel")
				.find(".head")
				.attr("src",this.img)
				.end()
				.find(".commentId")
				.val(this.id)
				.end()
				.find(".time")
				.html(this.date)
				.end()
				.find(".comment")
				.html(this.say)
				.end()
				.clone()
				.removeClass("otherModel")
				.removeClass("hide");
				$(elem).find(".commentUser").attr("href","/" + this.userId + "/");
				var loginId = $(".userInfo").val();
				if(this.userId == loginId){
					elem.find(".operate").attr({"src":address +"img/delComment.png","title":"delete","data-toggle":"modal","data-target":"#cancelModel"}).addClass("cancelComment").removeClass("operate");
				}else{
					elem.find(".operate").attr({"src":address + "img/reply.png","title":"reply"});
				}
				/*var regexp = /@\w+\s+/gi;
				var s = elem.find(".comment").html();
				var r = "<span style='color:red'>" + s.match(regexp) + "</span>";
				elem.find(".comment").html(s.replace(regexp,r));*/
				$(".otherCommets").append(elem);
			});
			$(".myComment:gt(5)").addClass("hide");
			
			if(otherComments.length > 5){
				var btn = $('<div class="seeAll"><button class="remains btn btn-default btn-sm ">See All Comments</button></div>')
				$(".otherCommets").append(btn);	
			}					
			
			$(".seeAll").toggle(
				function(){
					$(".otherCommets .myComment").removeClass("hide");
					$(this).find("button").html("Hide More");
				},
				function(){
					$(".otherCommets .myComment:gt(4)").addClass("hide");
					$(this).find("button").html("See All Comments");
				}
			);	
			$(".detailTags").html("");						
			$(obj.labels).each(function(){
				var tag = $('<div class="detailTag">'+this+'</div>');
				$(".detailTags").append(tag);
			});							
			$("#detailModel .gameId").val(obj.gameInfo.id);
			$("#detailModel .gameUrl").attr("href","/game/" + obj.gameInfo.id +"/");

			$("#detailModel .detailFoot").find(".head").attr("src",obj.userImg).end().find(".userName").attr("title",obj.userName + " " + obj.lastName).html(obj.userName + " " + obj.lastName);
			$("#detailModel .gameFrom").find(".gamePic").attr("src",obj.gameInfo.icon).end().find(".userName").attr("title",obj.gameInfo.gameName).html(obj.gameInfo.gameName);			
			
			if(obj.isOrNotFollowGameByCurrenUser == "0"){
				$("#detailModel .gameFrom").find(".btn").html("Unfollow");
			}else{
				$("#detailModel .gameFrom").find(".btn").html("Follow");
			}
			var loginId = $(".userInfo").val();
			if(obj.userId == loginId){
				$("#detailModel .detailFoot").find(".loginFollow").html("That's you!");
			}else{
				if(obj.isOrNotFollowUserByCurrenUser == "0"){
					$("#detailModel .detailFoot").find(".loginFollow").html("Unfollow");
				}else{
					$("#detailModel .detailFoot").find(".loginFollow").html("Follow");
				}
				
			}
			var imgs = obj.coverImgs;
			
			$("#detailModel .tophead .head").attr("src",obj.userImg);
			$("#detailModel .tophead .userName").html(obj.userName + " " + obj.lastName);
			var curIndex = 0;
			var pageIndex = 1;
			$(".moreImgs #one").html("");
			$(".moreImgs #two").html("");
			$(".moreImgs #three").html("");
			
			$(imgs).each(function(){
				var id = this.id;
				var src = this.coverImg;
				var cover;
				if(this.type == 1){
					cover = $('<div class="cover"><img src="'+address+'img/play.png" class="plays"/><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
				}else{
					cover = $('<div class="cover"><img src="'+src+'" class="coverImg"/><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+this.id+'" class="modelId"></div>');
				}
				
				
				$(".moreImgs .number:eq("+curIndex+")").append(cover);
				if(curIndex < 2){
					curIndex++;
				}else{
					curIndex = 0;
				}
			});
			/*var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
	        var nScrollTop = 0;   //滚动到的当前位置
	        var nDivHight = $(".moreImgs").height();
	       $(".moreImgs").scroll(function(){
	    	  
		          nScrollHight = $(this)[0].scrollHeight;
		          nScrollTop = $(this)[0].scrollTop;
		          if(nScrollTop + nDivHight >= nScrollHight){
		           	if(true) {
						
						$.get("/treeth/postCoverList",{postId:modelId,userId:userId,pageNum:pageIndex,pageSize:13},function(data){
							
							var obj = data;
							$(obj).each(function(){
								var id = this.id;
								var src = this.coverImg;
								
								var cover = $('<div class="cover"><img src="'+src+'" /><input type="hidden" value="'+this.userId+'" class="userId"><input type="hidden" value="'+id+'" class="modelId"></div>');
								$(".moreImgs .number:eq("+curIndex+")").append(cover);
								if(curIndex < 2){
									curIndex++;
								}else{
									curIndex = 0;
								}
							});
							pageIndex++;
						})
						 
					}
		          }
	          })*/

	         if(window.history.replaceState){
	         	 window.history.replaceState(state,"0",url);
	         }
			
									
			
		})
		
	});
	$(".smallPic").hover(function(){
		var i = $(".smallPic").index(this);
		$(".smallPic").each(function(index){
			if(index != i){
						
				$(this).css({"opacity":"0.4"});
				$(this).closest(".smallPicBox").css({"border":"none"});
			}else{
				$(this).css({"opacity":"1"});
				$(this).closest(".smallPicBox").css({"border":"1px solid #66afe9"});
			}
		});
				var url=this.src;
				var urlCompress = url.split("/");
				var r;
				if(url.indexOf("/compress/") > -1){
					r = url.replace("/compress/","/original/");
				}else if(url.indexOf("/show/") > -1){
					r = url.replace("/show/","/original/");
				}else{
					r = url;
				}
				
				if(url.indexOf("/compress/") > -1){
					urlCompress[3] = "show";
					var showUrl = urlCompress.join("/");
					$(".wall .detailImg").attr("src",url);


					
					$.imgpreload(r,function(){
		                if($(this).data('loaded')){
		                	getImageSize({
					        	img:r,
					        	oncomplete:function(){
					        		var objWidth = this.width;
					                var objHeight = this.height;
					                $(".wall .detailImg").attr({"width":"","height":""});
				                    if(objWidth <= 665){
				                  		$(".wall .detailImg").attr({"src":r,"width":objWidth,"height":objHeight});
				                   	}else{
				                  		$(".wall .detailImg").attr({"src":r});
				                   	}
					        		
					        	}
				        	});
		                   
		                }
	           		});

				}else{
					$(".wall .detailImg").attr("src",url);
				}
	});

	$(".smallPic").each(function(){
		/*alert(this);*/
	});
	

	$(".addLike").mouseenter(function(){
		var color = $(this).find(".glyphicon-heart").css("color");
		if(color != "red" && color != "rgb(255, 0, 0)"){
			$(this).find(".glyphicon-heart").css("color","#101010");
		}
		
	});
	$(".addLike").mouseleave(function(){
		var color = $(this).find(".glyphicon-heart").css("color");
		if(color != "red" && color != "rgb(255, 0, 0)"){
			$(this).find(".glyphicon-heart").css("color","#878787");
		}
		
	});
	$(".addLike").click(function(){
		$(this).attr("disabled",true);
		var modelId = $("#detailModel .modelId").val();
		var likeon = $("#detailModel .likeon").val();
		var userId = $("#detailModel .userId").val();
		var t = this;
		$("#loginModel .postId").val(modelId);
		$("#loginModel .postUserId").val(userId);
		var flag = checkLogin();
		if(!flag){
			var loginId = $(".loginId").val();
			if(loginId != userId){
				
				if(likeon == "1"){
					$.get("/post/like/add",{userId:userId,postId:modelId},function(){
						$(t).find(".glyphicon-heart").css("color","red");
						var num = Number($(".likeNumbtn").html());
						$(".likeNumbtn").html(num + 1);
						$(".insee")
						.find(".likeImg")
						.attr("src",address + "img/like02.png")
						.end()
						.find(".likeNum")
						.html(num + 1);
						$("#detailModel .likeon").val("0");
						$(t).attr("disabled",false);
					});
					
				}else{
					$.get("/post/like/delete",{postId:modelId},function(){
						$(t).find(".glyphicon-heart").css("color","#878787");
						var num = Number($(".likeNumbtn").html());
						$(".likeNumbtn").html(num - 1);
						$(".insee")
						.find(".likeImg")
						.attr("src",address + "img/like.png")
						.end()
						.find(".likeNum")
						.html(num - 1);
						$("#detailModel .likeon").val("1");
						$(t).attr("disabled",false);
					});
					
				}
			}else{
				
				$(".oops_layer").show()
                $("#describe").html("You can't operate your own post!");
			
			}
			
		}
		
		
	
	});
	
	$(".detailHeader .close").click(function(){
		$("title").html("Treeth");
		if(navigator.userAgent.indexOf("Firefox")>0){
			$("#detailModel .modal-contents").scrollTop(0);
		}
		$(".moreImgs #one").html("");
		$(".moreImgs #two").html("");
		$(".moreImgs #three").html("");
		$(".insee").removeClass("insee");
		$("#detailModel .top").show();
		$(".detailTop").hide();
		$("#detailModel .modal-header").show();
		$(".detailHeader").hide();

		$("#detailModel .wall").css("margin-top","0px");
		$(".detailTop").css({"top":"5%"});
		$(".wall .showPic").find("iframe").remove();
		$("#detailModel .rightContent").css("margin-top","0px");
		$("#detailModel .leftContent").css("margin-top","0px");
		if(window.history.replaceState){
			window.history.replaceState({},"0",historyUrl);
		}
		$('#detailModel').modal('hide');
		 $("title").html("Treeth");
	});
	$(".detailClose").click(function(){

		
		if(navigator.userAgent.indexOf("Firefox")>0){
			$("#detailModel .modal-contents").scrollTop(0);
		}
		

		$("title").html("Treeth");
		
		$(".moreImgs #one").html("");

		$(".moreImgs #two").html("");
		$(".moreImgs #three").html("");
		$(".insee").removeClass("insee");
		$("#detailModel .top").show();
		$(".detailTop").hide();
		$("#detailModel .modal-header").show();
		$(".detailHeader").hide();

		$("#detailModel .wall").css("margin-top","0px");
		$(".detailTop").css({"top":"5%"});
		
		$("#detailModel .rightContent").css("margin-top","0px");
		$("#detailModel .leftContent").css("margin-top","0px");
		if(window.history.replaceState){
			window.history.replaceState({},"0",historyUrl);
		}

		/*window.addEventListener('popstate', function(e){
		if (history.state){
			var state = e.state;
			alert(state.url);
		    //do something(state.url, state.title);
		  }
		}, false);*/
	});
	$(".commentBtn").click(function(){

		$(".moreComment textarea").focus();
	});
	/********************详情页添加评论******************************/
	$(".addComment").click(function(){
		var val = $(".moreComment textarea").val();
		var id = $("#detailModel .modelId").val();
		var replyId = $(".moreComment .replyId").val();
		var replyName = $(".moreComment .replyName").val();
		var userId = $("#detailModel .userId").val();
		var flag = checkLogin();
		if(!flag){
			if(val){
			var textarea = $(".moreComment textarea");
			var fit = validateContent($(textarea),500);
			if(fit == "2"){
				$("#errorModel .warnContent").html("500 characters or fewer, please!");
				$(".errorBtn").trigger("click");
				return false;
			}
			var link = $(".moreComment .link").val();
			var regexp = /@\S+\s\S+\s/gi;
			
			var s = val;
			var r = "<a href='"+link+"' class='userLink'>" + s.match(regexp) + "</a>";
			
			val = s.replace(regexp,r)
			
			$.post("/post/comment/add",{puserId:userId,postId:id,originalLanguage:"0",description:val},function(data){
				
				if(data){
						$("#detailModel .otherCommets").html("");
						/*对评论重新排序*/
						var otherComments = data;

						$("#detailModel .otherLength").val(otherComments.length);
						$(".insee").find(".commentNum").html(otherComments.length);
						$(otherComments).each(function(){
							
							$(".otherModel").find(".userName").html(this.name + " " + this.lastName);
							var elem = $(".otherModel")
							.find(".head")
							.attr("src",this.img)
							.end()
							.find(".commentId")
							.val(this.id)
							.end()
							.find(".time")
							.html(this.date)
							.end()
							.find(".comment")
							.html(this.say)
							.end()
							.clone()
							.removeClass("otherModel")
							.removeClass("hide");
							//var address = "http://" + window.location.host + "/treeth";
							var loginId = $(".userInfo").val();
							if(this.userId == loginId){
								elem.find(".operate").attr({"src":address + "img/delComment.png","title":"delete","data-toggle":"modal","data-target":"#cancelModel"}).addClass("cancelComment").removeClass("operate");
							}else{
								elem.find(".operate").attr({"src":address + "img/reply.png","title":"reply"});
							}
							
							$(".otherCommets").append(elem);
						});
						$(".myComment:gt(5)").addClass("hide");
						
						if(otherComments.length > 5){
							var btn = $('<div class="seeAll"><button class="remains btn btn-default btn-sm ">See All Comments</button></div>')
							$(".otherCommets").append(btn);	
						}					
						$("#detailModel .otherCommets").css("border-bottom","1px solid #ccc");
						$(".seeAll").toggle(
							function(){
								$(".otherCommets .myComment").removeClass("hide");
								$(this).find("button").html("Hide More");
							},
							function(){
								$(".otherCommets .myComment:gt(4)").addClass("hide");
								$(this).find("button").html("See All Comments");
							}
						);
						$(".moreComment textarea").val("");

					
					}
				})
			}else{
				$(".moreComment textarea").removeClass("warnsuccess").addClass("warnerror");
				$("#errorModel .warnContent").html("'text' cannot be blank.");
				$(".errorBtn").trigger("click");
			}
		}
		
		
		
	});
	$(".operate").live("click",function(){
		var userName = $(this).parent().find(".userName").html();
		var id = $(this).parent().find(".commentId").val();
		var link = $(this).closest(".userComment").find(".commentUser").attr("href");
		$(".moreComment .link").val(link);
		$(".moreComment .replyId").val(id);
		$(".moreComment .replyId").val("@"+userName + " ");
		$(".moreComment textarea").val("@"+userName + " ");
		moveEnd($(".moreComment .postComment")[0]);
	});
	$(".cancelComment").live("click",function(){
		
		var par = $(this).parent();
		var commentId = par.find(".commentId").val();
		var modelId = $("#detailModel .modelId").val();
		$("#cancelModel .commentId").val(commentId);

	});
	$("#cancelModel .delComment").click(function(){
			var modelId = $("#detailModel .modelId").val();
			var commentId = $("#cancelModel .commentId").val();
			$("#cancelModel .close").trigger("click");
			$.get("/post/comment/delete",{postId:modelId,postCommentId:commentId,lan:"0"},function(data){
				if(data == "0"){
					$(".otherCommets .userComment").each(function(){
						var id = $(this).find(".commentId").val();
						if(id == commentId){
							$(this).remove();
							return;
						}
					});
					$("#cancelModel .close").trigger("click");
					if($(".otherCommets .userComment").length <= 0){
						$(".seeAll").remove();
						$("#detailModel .otherCommets").css("border","none");

					}
				}
			});
		});
	$(".editBtn").click(function(){
		var flag = checkLogin();
		if(!flag){
			/*$("#editModel textarea").val("");*/
			editor2.html("");
			$("#editModel .editDesc").attr("disabled",false);
		}
		
	});
	
	
	var windowH = $(window).width();
	
	$("#detailModel .modal-contents").scroll(function(){

		$("#detailModel .top").hide();
		$("#detailModel .modal-header").hide();
		$(".detailTop").show();
		$(".detailHeader").show();
		var height = $("#detailModel .wall").height();
		var barH = $("#detailModel .top").height();
		
		
		var windowH = $(this).height();
		var scrollh = $(this).scrollTop();
		var fold = windowH + scrollh;
		
		var left = $("#detailModel .leftContent")[0].offsetLeft + 2;
		$(".detailTop").css({"top":"0px","width":"736px","left":left});
		 
		if(scrollh  > height + barH){
			
			$(".detailTop").hide();
		}else{
			
			$(".detailTop").show();
			
			
			if(scrollh == 0){
				var top = $(".rightContent").scrollTop;
				$(".detailTop").css({"position":"fixed","top":"45px","width":"736px","left":left});
				$("#detailModel .wall").css("margin-top","54px");
				$("#detailModel .rightContent").css("margin-top","27px");
				$("#detailModel .leftContent").css("margin-top","33px");

			}
		}
	});
	$(".like").live("click",function(){
		var modelId = $(this).closest(".thumbnail").find(".modelId").val();
		var userId = $(this).closest(".thumbnail").find(".userId").val();
		var thum = $(this).closest(".thumbnail");
		$("#loginModel .postId").val(modelId);
		$("#loginModel .postUserId").val(userId);
		var flag = checkLogin();
		$(this).removeClass("like");

		if(!flag){
			
			var loginId = $(".loginId").val();
			if(loginId != userId){
				var src = $(this).find(".likeImg").attr("src");
				var t = this;
				
				if(src != address + "img/like02.png" ){
					$.get("/post/like/add",{userId:userId,postId:modelId},function(){
						
						$(t).find(".likeImg").attr("src",address + "img/like02.png");
						var val = $(thum).find(".likeNum").html();
						$(thum).find(".likeNum").html(Number(val) + 1);
						
						$(t).addClass("like");
					});
					
				}else{
					$.get("/post/like/delete",{postId:modelId},function(){
						
						$(t).find(".likeImg").attr("src",address + "img/like.png");
						var val = $(thum).find(".likeNum").html();
						$(thum).find(".likeNum").html(Number(val) - 1);
						$(t).addClass("like");
					});
					
				}
			}else{
				alert("You can't operate your own post!");
			}
			
		}else{
			$("#loginModel .postId").val(modelId);
			$("#loginModel .postUserId").val(userId);
		}
	
		
	});
	$(".followOpe").live("click",function(){
		var flag = checkLogin();
		if(!flag){
			var gameId = $("#detailModel .gameId").val();
			if(gameId == null || gameId == undefined || gameId == ""){
				gameId = $(this).closest(".thumbnail").find(".gameId").val();
			}
			var thum = $(".insee");
			var val = $(this).html();
			var t = this;
			$(this).attr("disabled",true);
			if(val == "Unfollow"){
				$.get("/game/follow/delete",{gameId:gameId},function(data){
					if(data){
						$(t).html("Follow");
						$(thum).find(".followGame").html("Follow");
						$(t).attr("disabled",false);

					}
				})
			}else{
				$.get("/game/follow/add",{gameId:gameId},function(data){
					if(data == "0"){
						$(t).html("Unfollow");
						$(thum).find(".followGame").html("Unfollow");
						$(t).attr("disabled",false);
					}
				})
			}
		}
		
	});
	
	
	
	
	
	
	$(".postComment").on("input",function(){
		var fit = validateContent(this,500);  
		if(fit == "2"){
			$(".postComment").addClass("warnerror");
			$("#errorModel .warnContent").html("500 characters or fewer, please!");
			$(".errorBtn").trigger("click");
			return false;
		}else if(fit == "1"){
			$(".postComment").addClass("warnsuccess");
		}           
	});
	$(".postComment").live("focus",function(){
		var flag = checkLogin();
	});

	/****************操作用户关注发帖用户**********************/
	$(".loginFollow").live("click",function(){

		var flag = checkLogin();
		if(!flag){
			var userId = $("#detailModel .userId").val();

			if(userId == null || userId == "" || userId == undefined){
				userId = $(this).closest(".messageInfo").find(".userId").val();
			}

				if(userId == null || userId == "" || userId == undefined){
					userId = $(this).parents(".imgModal").find(".gameId").val();
				}
				if(userId == null || userId == "" || userId == undefined){

					userId = window.location.href.split("/")[3];
					
				}

			var val = $(this).html();
			var t = this;
			$(this).attr("disabled",true);
			if(val == "Unfollow"){
			 
				$.post("/user/unfollow/",{"friendId":userId},function(data){
					if(data.statusCode ==1 && data.messageCode == 1){
						$(t).html("Follow");
						$(t).attr("disabled",false);
					}
				},"json");
			}else{
			
				$.post("/user/follow/",{"friendId":userId},function(data){
					if(data.statusCode ==1 && data.messageCode == 1){
						$(t).html("Unfollow");
						$(t).attr("disabled",false);
					}
				},"json");
			}
		}
	});

	/*******************二级详情页使用esc键top模块消失*******************************/
	$(".detailModels").keyup(function(event){
		if(event.keyCode == 27){
			/*event = event || window.event;
			var tar = event.target || event.srcElement;
			var className = $(tar).attr("class");
		    if(className != null && className.indexOf("postComment") > -1){
		      var content = $(".");
		      if(!isEmpty(content)){
		      	return;
		      }
		    }*/
			$(".detailTop").hide();
			$(".detailHeader").hide();
			$("title").html("Treeth");
			if(window.history.replaceState){
				window.history.replaceState({},"0",historyUrl);
			}
		}
	});
	
	/***************判断是否登陆*************************/
	function checkLogin(){
		
		var userId = $(".userInfo").val();
		if(userId == null || userId == undefined){

			$("#loginModel").show();

			return true;
			
		}
	}
	
	/*****************点击game名称跳转到game详情页****************************/
	$(".gameFrom .userName").click(function(){
		$(".detailModels .gameUrl")[0].click();
	});
   
     /****************非空函数*********************/
    function isEmpty(obj){
        if(obj == null || obj == "" || obj == undefined){
            return true;
        }else{
            return false;
        }
    }

    /*****************点击game名称跳转到game详情页****************************/
	$(".gameFrom .userName").click(function(){
		$("#detailModel .gameUrl")[0].click();
	});

	$(".detailFoot .toUser").live("click",function(){
    	$(this).closest(".detailFoot").find(".personUrl")[0].click();
    });
	
	$(".thumbnail .postUser").live("click",function(){
		$(this).closest(".thumbnail").find(".personUrl")[0].click();
	});
	
	$(".thumbnail .toGame").live("click",function(){
		$(this).closest(".thumbnail").find(".gameUrl")[0].click();
	});

	$(".linkUser").live("click",function(){
		$(this).closest(".userComment").find(".commentUser")[0].click();
	});
	$(".userComment .postUser").live("click",function(){
		$(".postHead .personUrl")[0].click();
	});

/******************图片裁剪**********************************/
//VMiddleImg()参数是一个{"width": , "height": }。是实际裁剪完毕输出大小
function getImageSize(cfg){
		        var img=document.createElement('img'),
		            callback=cfg.oncomplete;
		            img.src = typeof cfg.img == 'string'?cfg.img:cfg.img.src;
		            img.setAttribute('style','position:absolute;visibility:hidden;');
		            document.body.appendChild(img);
		            img.onload=img.onerror=img.onreadystatechange=function(){
		            if(img&&img.readyState&&img.readyState!='loaded'&&img.readyState!='complete')
		                return;
		            img.onload = img.onreadystatechange = img.onerror = null;
		            callback.call({"width":img.width,"height":img.height},null);
		            img.parentNode.removeChild(img);
		            img=null;
		        };
        }

$(".thumbnail .title,.thumbnail .content").live("click",function(){
	$(this).closest(".thumbnail").find(".seeDetail")[0].click();
});
$(".thumbnail .plays").live("click",function(){
	$(this).closest(".thumbnail").find(".seeDetail")[0].click();
});
$(".postComment").blur(function(){
	$(".postComment").removeClass("warnsuccess");
});



$(".faceImg").live("click",function(){
	var thum = $(this).closest(".thumbnail");
	var postId = thum.find(".modelId").val();
	var share_url = "https://www.facebook.com/dialog/feed?app_id=335300939983221";
	share_url +="&u="+window.location.href + "post/" + postId + "/";
	share_url += "&link="+window.location.href + "post/" + postId + "/";
	var showimg = thum.find(".showimg").val();
	share_url += "&picture="+showimg;
	var userName = thum.find(".myauthor .postUser").html();
	if(userName == null || userName == undefined || userName == ""){
		userName = thum.find(".personsName").val();
	}
	var title = thum.find(".upContent .title").html();
	var content = thum.find(".upContent .content").html();
	share_url += "&caption="+userName;
	share_url += "&name="+title;
	share_url += "&description="+content;
	share_url += "&redirect_uri=http://www.facebook.com/";
	$.post(
		"/share",
		{postId:postId},
		function(message){
			if(message.statusCode == 1 && message.messageCode == 1){
				
			}
		}
		);
	window.open(share_url, 'newWindow', 'width=800, height=500','center');
	
});



$(".twiterImg").live("click",function(){
	
	var thum = $(this).closest(".thumbnail");
	var postId = thum.find(".modelId").val();
	var userName = thum.find(".myauthor .postUser").html();
	if(userName == null || userName == undefined || userName == ""){
		userName = thum.find(".personsName").val();
	}
	var twitter_url = "https://twitter.com/intent/tweet?";
	twitter_url +="text="+"See what "+userName+" has discovered on Treeth.\n"+window.location.href + "post/" + postId + "/" +" @treeth_sevenga";
	$.post(
		"/share",
		{postId:postId},
		function(message){
			if(message.statusCode == 1 && message.messageCode == 1){
				
			}
		});
	window.open(twitter_url, "myWindow","status = 1, height = 300, width = 600, resizable = 0");

});