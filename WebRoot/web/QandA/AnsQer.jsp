
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>detail</title>
<meta http-equiv="x-ua-compatible" content="ie=8" />

<link type="text/css" href="<%=basePath%>css/button.css"
	rel="stylesheet" />
<link type="text/css" href="<%=basePath%>css/QandA/AnsQer.css"
	rel="stylesheet" />

<link href="<%=basePath%>css/headfoot.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/index_default.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Index/index.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/Forums1/style_11_common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/Forums1/style_11_forum_viewthread.css" />
<link rel="stylesheet" id="css_extstyle" type="text/css"
	href="<%=basePath%>css/Forums1/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/Forums1/praiseButton.css" />
<link href="<%=basePath%>css/Forums1/share_popup.css" rel="stylesheet" />
<link href="<%=basePath%>css/Forums1/select_share.css" rel="stylesheet" />

<link href="<%=basePath%>css/headfoot.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Forums1/newHome.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Forums1/post/board.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/QandA/QandA.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/qiantai/login.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index/language.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Forum/home.js"></script>

<script type="text/javascript" src="<%=basePath%>js/Forum/board.js"></script>

<script charset="utf-8" src="<%=basePath%>kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=basePath%>kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="<%=basePath%>js/login_all.js"></script>

<script type="text/javascript">
var editorReA;
function reAnswer(str){
	editorReA = KindEditor.create('textarea[id="'+ str +'"]', {
		cssPath : '<%=basePath%>kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=basePath%>kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=basePath%>kindeditor/jsp/file_manager_json.jsp',
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : true,
		afterChange: function() {
			this.sync();
			},
	    afterBlur: function() {
	        this.sync();
	        },
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link']
	});
}
	$(function() {
		var basePath = $("#basePath").val();
		$("input[name='LookAnswer']").click(
				function() {
				
					var value = $("#value").val();
					var baochou = $("#baochou").val();
					var answerId = $("#answerId").val();
					if (baochou == 'accept') {
						var type = "";
						var typeName = "";
						var moneyType = $(".valueType").text();
						if (moneyType == "brick") {
							type = "jinzhuan";
							typeName = "brick";
						} else {
							type = "lingdan";
							typeName = "panacea";
						}

						if (confirm("it is to minus " + value + typeName)) {
							value = parseInt(value);
							var url = basePath + "web/QandA/jugde/" + value
									+ "/" + type + "/" + answerId;
							$.getJSON(url, function(data) {
								//只能做一个提醒耳朵作用
								alert("please recharge");
								return false;
							});
						} else {
							return false;
						}

					}
				});

		$("input[type='radio']").change(
				function() {
					var basePath = $("#basePath").val();
					var aId = $(this).attr("value");
					var uId = $("#loginer").val();
					var qId = $("#questionId").val();
					var Strclass = "";
					var radios = $("input[name='" + aId + "']");
					if (radios[0].checked == true) {

						Strclass = "upQ";
					} else if (radios[1].checked == true) {
						Strclass = "normalQ";
					} else if (radios[2].checked == true) {
						Strclass = "downQ";
					}
					var type = "Questioner";
					var url = basePath + "web/QandA/common/" + aId + "/" + qId
							+ "/" + uId + "/" + Strclass + "/" + type;

					$.getJSON(url, function(data) {
						alert("commented");
						var rads = $("input[name='" + aId + "']");
						for (var i = 0; i < rads.length; i++) {
							if (rads[i].checked == false)
								rads[i].disabled = true;
						}

					});
				});

		$("input[name='conmitRe']").click(function() {
			 if(editorReA.html()==""){
	    	alert("Fill the answer！");
	        return false;
	    } else {
	    alert("submitted");
	    	return true;   
	    }
		});

	});

	function show(id) {
		reAnswer('zhuiQuestion'+id);
		var display = document.getElementById("reAsk" + id).style.display;
		if (display == "none") {
			document.getElementById("reAsk" + id).style.display = "block";
		} else {
			document.getElementById("reAsk" + id).style.display = "none";
		}

	}

	function YMorSH(type, role, receiver_id, count) {

		var basePath = $("#basePath").val();
		if (confirm("It is to minus a brick. Sure?"))
			$.ajax({
				type : "post",
				url : basePath + "YMorSH.do?type=" + type + "&receiver_id="
						+ receiver_id,
				error : function() {
					alert("connection error！");

				},
				success : function(msg) {
					if (msg == "error") {
						alert("recharge to enough panacea");
					} else {
						if (type == "yangmu") {
							var c = document.getElementsByClassName("yangmu"
									+ receiver_id);

							for (var i = 0; i < c.length; i++) {
								c[i].innerHTML = msg;
							}

						}
						if (type == "songhua") {

							var c = document.getElementsByClassName("xianhua"
									+ receiver_id);
							for (var i = 0; i < c.length; i++) {
								c[i].innerHTML = msg;
							}
						}

					}
				}
			});
	}
</script>

</head>

<body style="font-family:Arial,verdana,tahoma;">
<!---------------------------login_begin  ------------------------->
	<div id="main_login" class="main_login"></div>
	<div class="login_div" id="login_div">
		<div class="login_head">
			<h1>Login</h1>
			<span class="login_head_right"> <span
				class="login_head_right_none">No Account</span>&nbsp;&nbsp;&nbsp;<a
				href="<%=basePath%>isAgree.do">Register</a> </span>
		</div>
		<div class="login_form">
			<form action="<%=basePath%>login.do" method="post">
				<input type="hidden" value="" id="login_href" name="login_href">
				<table>
					<tr>
						<td><input type="text" name="userName" placeholder="User Name"
							class="login_td"></td>
					</tr>
					<tr>
						<td><input type="password" name="password" placeholder="Cipher"
							class="login_td"></td>
					</tr>
					<tr>
						<td><input class="login_but" accesskey="l" value="Login"
							tabindex="5" type="submit"> <!-- <span class="login_span"><input type="checkbox" name="">保持登录</span> -->
							<span class="login_span"><a
								href="<%=basePath%>ToGetBackPwd.do">Forget Cipher？</a>
						</span></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- <div class="login_other">
			<p>login other way</p>
			<div style="width:380px;height:80px;padding-top:20px;">
				<button class="login_sina"></button>
				<button class="login_qq"></button>
			</div>
		</div> -->
	</div>
	<!---------------------------login_end  ------------------------->
	<!--head begin-->
	<div ID="head" class="head">
		<!--top-->
		<div id="top" class="top">
			<div class="top-btn-left">
				<a href="javascript:AddFavorite(window.location,document.title)">Save Us</a>
				<!-- <a href="javascript:void(0)">联系我们</a> -->
			</div>

			<div class="top-btn-right">

				<!-- <div class="language">
					<a href="javascript:changeLocale('locale=zh_CN')">简</a> 
					<a href="javascript:changeLocale('locale=zh_TW')">繁</a>
					<a href="javascript:changeLocale('locale=en_US')">EN</a>
				</div>  -->
				<c:if test="${!empty userInfo }">
					<div class="user-btn">
						<ul>
							<span class="ban">&nbsp;</span>
							<li id="personPic"><a><img
									src="<%=basePath%>${userInfo.headImg}" width="20" height="20" />
							</a>
								<div class="personInfo" id="personInfo">
									<div class="personInfoPart1">
										<a href="<%=basePath%>web/Blog/${userInfo.nickName}"> <img
											src="<%=basePath%>${userInfo.headImg}" width="90" height="90" />
										</a>
										<div class="personInfoDetail">
											<p>
											<h3>${userInfo.nickName}</h3>
											</p>
											<p>

												<span>Level：</span>

												<c:forEach begin="1" end="${userInfo.userLevel}" step="1">
													<img src="<%=basePath%>images/Forums/star.png" width="10px"
														height="10px" />
												</c:forEach>
												<c:forEach begin="${userInfo.userLevel+1}" end="7" step="1">
													<img src="<%=basePath%>images/Forums/0star.png"
														width="10px" height="10px" />
												</c:forEach>

											</p>
											<br /> <a class="pConfig"
												href="<%=basePath%>u/detail/${userInfo.id}.html"><span
												class="icon-pConfig"></span>Edit</a>
										</div>
									</div>
									<div class="personInfoPart2">
										<div class="config">
											<a href="<%=basePath%>u/setting/password"><span
												class="icon-cog"></span>Setting</a>

										</div>
										<div class="logout">
											<a href="<%=basePath%>logout.do" title="Exit"><span
												class="icon-logout"></span> </a>
										</div>

									</div>

								</div></li>


							<span class="ban">&nbsp;</span>
							<li style="height: 30px;"><div class="config">
									<a href="<%=basePath%>/web/PrivateMsg/RecBox"><span
										class="icon-msg"></span><em>${newMsgCount }</em> </a>

								</div></li>
							<span class="ban">&nbsp;</span>
						</ul>



					</div>
				</c:if>




				<div class="charge">
					<c:if test="${empty userInfo }">
						<span class="ban">&nbsp;</span>
						<a href="javascript:void(0)" id="login_all">Log in</a>
						<span class="ban">&nbsp;</span>
						<a href="<%=basePath%>isAgree.do">Register</a>
					</c:if>
					<span class="ban">&nbsp;</span> <a
						href="<%=basePath%>ToGetBackPwd.do">Find Cipher</a> <span class="ban">&nbsp;</span>
					<a href="javascript:void(0)">Voucher Center</a> <span class="ban">&nbsp;</span>
				</div>
			</div>
			<!---top-btn-right  end-->
		</div>
		<!--top end-->
		<!--logo-->
		<div class="logo">
			<div class="yszs">
				<a href="#"><img src="<%=basePath%>img/Index-logo.png" /> </a>
			</div>
			<div class="searchBanner">
				<FORM name="search_form_1" id="search_form_1"
					action="<%=basePath%>search.do">
					<DIV class="search-text-con2">
						<INPUT name="search" class="search-text2" id="q1" type="text"
							value="" autocomplete="off" path="q" placeholder="  input keyword">
						<input type="hidden" id="txtSear" value="0" name="searchMethod" />
					</DIV>
					<DIV class="search-btn-con2">
						<INPUT class="search-btn2" type="submit" value="Search">
					</DIV>
				</FORM>
			</div>
			<div class="app">
				<a href="javascript:void(0)"></a>
				<h3 style="font-size:14px;">App Download</h3>
			</div>

		</div>
		<!--logo end-->
		<!--nav-->
		<div class="nav">
			<ul>
				<li><a href="<%=basePath%>toIndexHome">Frontpage</a></li>
				<li><a href="<%=basePath%>web/Blog/index.html">Blog</a></li>
				<li><a href="<%=basePath%>listPostByBoard">Forum</a></li>
				<li><a href="<%=basePath%>web/QandA/Home.html">Q & A</a></li>
				<li><c:if test="${userInfo.role.id!=1 }">
						<a href="<%=basePath%>contact.do">Service Center</a>
						</c:if>
						<c:if test="${userInfo.role.id==1 }">
						<a href="<%=basePath%>toManagement">Supervision</a>
						</c:if></li>
				<li><a href="<%=basePath%>faq.do">Regulation</a></li>
			</ul>
		</div>
		<!--nav end-->
		<!--pic-->
		<div class="Logo_pic"></div>
		<!--pic end-->



	</div>
	<!--head end-->

	<div class="mainBox" style="width:1050px;" id="mainBox">


		<ul class="BoardIndex">
		  <div class="boardSubject" >
		         <span class="font">unions</span>
		  </div>
		  <c:forEach end="${board.size()}" begin="1" step="1" var="i">
              
              <c:if test="${ board.get(i-1).id!=question.board.id}">
		      <li class="boardBg" id="one" onmouseover="over('${i}')" onmouseout="out('${i}')">
		       <a href="<%=basePath%>web/QandA/Home/${board.get(i-1).getId() }/1">	
		      <div id="boardName" >	
		             
		       <span class="board_title_font">
		       <img src="<%=basePath%>images/Forums/new/${board.get(i-1).boardLogo}.png" 
		       class="board_index" id="noSelectIndex${i}">
		       <img src="<%=basePath%>images/Forums/new/${board.get(i-1).boardLogo}_1.png" 
		       class="board_index" id="selectIndex${i}" style="display:none;">
		       ${board.get(i-1).boardName}</span>		       
		       
		       <div style="background:url(images/Forums/new/go.png);display:none;" class="go" id="go${i }"></div>		       
		      </div>
		       </a>
				<div class="labelIndex">
		         <c:forEach end="${listAllLabel.get(i-1).size()}" begin="1" var="j" step="1">
		            <div class="everyLabel"><a href="<%=basePath%>search.do?search=${listAllLabel.get(i-1).get(j-1).labelName}&searchMethod=0&lab=1&sub=1&con=1">${listAllLabel.get(i-1).get(j-1).labelName}</a></div>
		         </c:forEach>
		      </div>
		      </li>
		      
		      </c:if> 
		      
		      
		      
		      <c:if test="${board.get(i-1).id==question.board.id}">
		      <li class="boardBg" id="one" style="background:#087ec4;">
		       <a href="<%=basePath%>web/QandA/Home/${board.get(i-1).getId() }/1"
		         style="color:#fff;">	
		      <div id="boardName" >	
		             
		       <span class="board_title_font">
		       
		       <img src="<%=basePath%>images/Forums/new/${board.get(i-1).boardLogo}_1.png" 
		       class="board_index" id="selectIndex${i}">
		       ${board.get(i-1).boardName}</span>		       
		       
		       <div style="background:url(images/Forums/new/go.png);" class="go" id="go${i }"></div>		       
		      </div>
		       </a>
		      <div class="labelIndex">
		         <c:forEach end="${listAllLabel.get(i-1).size()}" begin="1" var="j" step="1">
		            <div class="everyLabel">
		            <a href="<%=basePath%>search.do?search=${listAllLabel.get(i-1).get(j-1).labelName}&searchMethod=0&lab=1&sub=1&con=1">
		            ${listAllLabel.get(i-1).get(j-1).labelName}
		            </a></div>
		         </c:forEach>
		      </div>
		      </li>
		      
		      </c:if> 
		      
		      
		    
		  </c:forEach>
		
		
		</ul>


		<div class="rightContent">
				
				<!-- 隐藏框，保存用户信息和问题信息 -->
				<input id="questionId" type="hidden" value="${requestScope.question.getId() }" /> 
				<input id="loginer" type="hidden" value="${loginer.getId() }" />
				<input id="value" type="hidden" value="${requestScope.question.getValue() }"/>
				<div style="display: none;">
				<span id="value" >${requestScope.question.getValue() }</span>
 				<c:if test="${requestScope.question.getMoneyType()=='lingdan'}"><span class="valueType">panacea </span></c:if>
 					<c:if test="${requestScope.question.getMoneyType()=='jinzhuan'}"><span class="valueType">brick</span> </c:if>
 					</div>

			<div class="showQuestion">
				<div
					style="height: 30px; text-align: left;font-size:22px;color:black">
					&nbsp;&nbsp;<span class="title2" style="margin-top:5px;">Q & A page</span>
					<span> <a href="<%=basePath%>web/QandA/AskQ" title="ask"
						class="submitButton"
						style="display: inline-block; margin-left: 520px;font-size:14px">issue new question
					</a>
					</span>
				</div>
				<div style="margin-left:15px;width:790px">
				<div style="margin-top:20px"></div>
				<div class="showQuestionTitle">${requestScope.question.getQSubject() }</div>
				<div style="margin-top:5px"></div>
				<div class="questioner">
					<span style="font-family:SimSun">asker:</span> <span style="font-family:SimSun"> <c:if
							test="${requestScope.question.getHiddenUser() =='show'}">
							<a style="color:rgb(8,126,196)"
								href="<%=basePath%>web/Blog/${requestScope.question.getUserInfo().getNickName()}">${requestScope.question.getUserInfo().getNickName() }
							</a>
						</c:if> <c:if test="${requestScope.question.getHiddenUser() =='hidden'}">
							<a style="color:rgb(8,126,196);font-family:SimSun" >anynomous</a>
						</c:if>
					</span>
					
					<br/>
					<span style="font-family:SimSun">reward:</span> <span style="font-family:SimSun">${question.value}
					   <c:if test="${question.moneyType.equals('jinzhuan')}">brick</c:if>
					   <c:if test="${question.moneyType.equals('lingdan')}">panacea</c:if>
					</span>
				</div>
				<div style="margin-top:5px"></div>
				
				<div style="margin-top:20px"></div>
				<div class="answerContent">
					<table style="margin-left: 15px;margin-top: 20px;margin-bottom: 20px">
						<tr valign="top">
							<td width="55px">content:</td>
							<td width="675px"><label font-size="18px">${requestScope.question.getQContent() }</label></td>
						</tr>
					</table>
				</div>
				<div style="margin-top:20px"></div>
				
				<c:if test="${bestanswer.size()!=0}">
				<div class="bestanswerArea">
					<div class="bestanswer1">
					<span class="bestAer">best answerer:</span>
					
					<c:forEach end="${bestanswer.size()}" begin="1" step="1" var="a">
						<!-- 情况二: 如果答案之间被点开过-->
							<a style="color:rgb(8,126,196);font-size:14px;font-weight:normal;" href="<%=basePath%>web/Blog/${bestanswer.get(a-1).userInfo.nickName}" target="_blank" class="xw1" id="nickName${bestanswer.get(a-1).id}">
							${bestanswer.get(a-1).userInfo.nickName}
						</a>
						<span class="questioner"  style="font-family:SimSun;margin-left:450px">  ${bestanswer.get(a-1).getATime()}</span>
						<div class="bestanswer">
							<span style="font-family:SimSun">
							      <c:if test="${bestanswer.get(a-1).getIsReAsk()==0}">
							<!-- <div class="pct" style="text-align:left;"> -->
							${bestanswer.get(a-1).getAContent()}
							<!-- </div> -->
							</c:if>
							</span>
							
							<div style="margin-top: 10px"></div>
							
							
							<div>
    <c:if test="${bestanswerzhui.size()!=0}">
    <ul id="reAskAnswer">
  			<c:forEach items="${bestanswerzhui }" var="baz" begin="0" step="1">
  				<li><%-- <a  href="<%=basePath %>web/Blog/${baz.getUserInfo().nickName}" target="_blank">
          
            <font style="font-family:SimSun;font-size:16px"> ${baz.getUserInfo().nickName}</font> --%>
            <c:if test="${requestScope.question.getHiddenUser() !='hidden'||baz.getUserInfo().id!=requestScope.question.getUserInfo().id}">
							<a style="color:rgb(8,126,196)"
								href="<%=basePath%>web/Blog/${baz.getUserInfo().nickName}">${baz.getUserInfo().nickName}
							</a>
						</c:if> <c:if test="${requestScope.question.getHiddenUser() =='hidden'&&baz.getUserInfo().id==requestScope.question.getUserInfo().id}">
							<a style="color:rgb(8,126,196);font-family:SimSun" >anynomous</a>
						</c:if>
						&nbsp;: &nbsp;
              </a><span style="font-family:SimSun;font-size:16px"> ${baz.getAContent()}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <font style="font-size:8px;">[ ${baz.aTime}]</font></li>
  			</c:forEach>
 </ul>
</c:if> 
   </div>
							
						<div class="pingjia" style="text-align:right">
							<c:if test="${bestanswer.get(a-1).getReCount()<3&&bestanswer.get(a-1).getIsReAsk()==0}">
							
								<a  style="font-family:SimSun;color:rgb(8,126,196);font-size:16px;" href="javascript:void(0);" onclick="show('${bestanswer.get(a-1).getId() }')">ask&nbsp;&nbsp;</a>
							</c:if>
							</div>
							<div style="margin-top: 10px"></div>
						<div  style="display:none"  id="reAsk${bestanswer.get(a-1).getId() }" class="reAsk">
           <form style="margin-botto:10px;" action="<%=basePath%>web/QandA/submitReAsk" method="post">
           <input type="hidden" name="questionId" value="${requestScope.question.getId() }"/>
           <input type="hidden" name="answerId" value="${bestanswer.get(a-1).getId() }"/>
           <input type="hidden" name="zhuiwenId" value="${bestanswer.get(a-1).getId() }" />
           <input type="hidden" name="basePath" id="basePath" value="<%=basePath%>"/>
            <input type="hidden" name="userType" value="Asker" />
             <textarea name="zhuiQuestion"  id="zhuiQuestion${bestanswer.get(a-1).getId() }" style="width:500px;height:50px;margin-top:30px;margin-left:auto;" ></textarea>
             <input type="submit" name="conmitRe" value="confirm to submit" id="submitButton" style="margin-top:10px;margin-right:10px;"/>
             </form>
             </div>
					</c:forEach>
					
					</div>
					</div>
					</div>
				</c:if>
				<c:if test="${bestanswer.size()==0}">
					no best answer
				</c:if>

				
				<div style="margin-top:20px"></div>
				<c:if test="${answerList.size()!=0}">
				
							<c:forEach end="${answerList.size()}" begin="1" step="1" var="a">
				<div class="answerContent">
						<a style="color:rgb(8,126,196);font-size:14px;font-weight:normal;" href="<%=basePath%>web/Blog/${answerList.get(a-1).userInfo.nickName}" target="_blank" class="xw1" id="nickName${answerList.get(a-1).id}">
							${answerList.get(a-1).userInfo.nickName}
						</a>
						
						<span class="questioner"  style="font-family:SimSun">  ${answerList.get(a-1).getATime()}</span><br/>
						<span class="questioner"  style="font-family:SimSun">comment of the asker good:${answerList.get(a-1).getUserInfo().getQuizzerUp() }&nbsp;soso:${answerList.get(a-1).getUserInfo().getQuizzerNormal() }&nbsp;sorry:${answerList.get(a-1).getUserInfo().getQuizzerDown() }</span><br/>
						<span class="questioner"  style="font-family:SimSun">comment of general members &nbsp;good:${answerList.get(a-1).getUserInfo().getUpNum() }&nbsp;soso:${answerList.get(a-1).getUserInfo().getNormalNum() }&nbsp;sorry:${answerList.get(a-1).getUserInfo().getDownNum() }</span>

						<div style="margin-top: 10px">
						</div>
						<div>
						
														 <!--情况一: 如果该答案之前没有被点开过则        --> 
							       <c:if test="${answerList.get(a-1).getIsReAsk()==-1 }">
							      <div class="pct" style="text-align:left;" >
							      <%
							      	String record = (String)request.getParameter("record");
							      	String result=(String)request.getParameter("result");
							       %>
							       
							          <form action="<%=basePath %>web/QandA/isLookAnswer" method="post" style="float:left;width:250px;height:40px;">
							          
							          <input type="hidden" name="moneyType" value="${requestScope.question.getMoneyType()}"/>
							          <input type="hidden" name="moneyValue" value="${requestScope.question.getValue()}"/>
							          <input type="hidden" name="userId" value="${requestScope.question.getUserInfo().getId()}"/>
							          <input type="hidden" name="questionId" value="${requestScope.question.getId()}"/>
							          <input type="hidden" name="answerId" id="answerId" value="${answerList.get(a-1).getId()}"/>
							          <input type="hidden" id="baochou" value="${answerList.get(a-1).baochou }"/>
							          <input type="hidden" id="record" name="record" value="${record}"/>
							          <span>
							          <input type="submit" name="LookAnswer" value="review the answer"  class="lookAnswerBt"  id="submitButton" style="margin-top:0px;margin-right:120px;"/>
							          </span>
							          <span style="margin-top: 10px;margin-left: 70px">
							          <c:if test="${answerList.get(a-1).baochou=='noAccept'}"><p style="margin-left: 67px;font-size:14px">(free)</p></c:if>
							          <c:if test="${answerList.get(a-1).baochou=='accept'}"><p style="color: #F44;margin-left: 60px;font-size:14px">(need pay)</p></c:if>
							          <c:if test="${result=='low balance'}">
							          		<!-- <script type="text/javascript">
							          			alert("low balance");
											</script> -->
											low balance
							          </c:if>
							          </span>
							          </form>
							       </div>  

							       </div> 
							        </c:if>
							
							
							<!-- 情况二: 如果答案之间被点开过-->
							<span style="font-family:SimSun">
							      <c:if test="${answerList.get(a-1).getIsReAsk()==0}">
							<!-- <div class="pct" style="text-align:left;"> -->
							${answerList.get(a-1).getAContent()}
							<!-- </div> -->
							</c:if>
							</span>
							<span >
							<c:if test="${answerList.get(a-1).getReCount()<3&&answerList.get(a-1).getIsReAsk()==0}">
							&nbsp;&nbsp;
								<a  style="font-family:SimSun;color:rgb(8,126,196)" href="javascript:void(0);" onclick="show('${answerList.get(a-1).getId() }')">ask</a>
							</c:if>
							</span>
							<div style="margin-top: 10px"></div>
							
							
							<div>
    <c:if test="${requestScope.zhuiwen.size()!=0}">
    <ul id="reAskAnswer">
   <c:forEach items="${requestScope.zhuiwen }" var="z">
     <c:forEach items="${z.value }" var="zw" varStatus="t" >
         <c:if test="${zw.getRelated()==answerList.get(a-1).getId() }">
          <li><a  href="<%=basePath %>web/Blog/${question.userInfo.nickName}" target="_blank">
          
            <font style="font-family:SimSun"> ${question.userInfo.nickName}</font>: 
              </a><span style="font-family:SimSun;font-size:16px"> ${zw.getAContent()}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <font style="font-size:8px;">[ ${zw.aTime}]</font></li>
               <c:if test="${requestScope.zhuida.size()!=0 }">
                  <c:forEach items="${requestScope.zhuida}" var="d">
                     <c:forEach items="${d.value }" var="dd" varStatus="s" >
                        <c:if test="${dd.getIsReAsk()==zw.getId() }">                         
            <li><a href="<%=basePath %>web/Blog/${answerList.get(a-1).userInfo.nickName}" target="_blank">
             
            <font style="font-family:SimSun"> ${answerList.get(a-1).userInfo.nickName}</font></a>: ${dd.getAContent() } 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <font style="font-size:8px;">[ ${dd.aTime}]</font></li>
                        </c:if> 
                     </c:forEach>
                   </c:forEach>
               </c:if> 
           </c:if>
     </c:forEach>
 </c:forEach>
 </ul>
</c:if> 
   </div>
							
						
						<div  style="display:none"  id="reAsk${answerList.get(a-1).getId() }" class="reAsk">
           <form action="<%=basePath%>web/QandA/submitReAsk" method="post">
           <input type="hidden" name="questionId" value="${requestScope.question.getId() }"/>
           <input type="hidden" name="answerId" value="${answerList.get(a-1).getId() }"/>
           <input type="hidden" name="zhuiwenId" value="${answerList.get(a-1).getId() }" />
           <input type="hidden" name="basePath" id="basePath" value="<%=basePath%>"/>
            <input type="hidden" name="userType" value="Asker" />
             <textarea name="zhuiQuestion" id="zhuiQuestion${answerList.get(a-1).getId() }" style="width:500px;height:50px;margin-top:30px;margin-left:auto;"></textarea>
             <input type="submit" name="conmitRe" value="confirm to submit" id="submitButton" style="margin-top:10px;margin-right:10px;"/>
             </form>
             </div>
             
             
             			             <div class="uo" style="font-size:14px;text-align:right">

<c:if test="${answerList.get(a-1).getIsReAsk()==0}">
you think it is:
<c:if test="${answerList.get(a-1).getqComment()==NULL||answerList.get(a-1).getqComment()==''}"> 

     <input type="radio"      name="${answerList.get(a-1).getId() }"  value="${answerList.get(a-1).getId() }" />
     <img src="<%=basePath %>images/Forums/good.gif" />good
     <input type="radio"      name="${answerList.get(a-1).getId() }" value="${answerList.get(a-1).getId() }" />
     <img src="<%=basePath %>images/Forums/notgood.gif"/>soso　　
     <input type="radio"      name="${answerList.get(a-1).getId() }"   value="${answerList.get(a-1).getId() }"/>
     <img src="<%=basePath %>images/Forums/bad.gif" />sorry              
              <br/> 
              <c:if test="${answerList.get(a-1).baochou=='accept'}">
              <p style="color:red;">*Once commented, your reward will transfer to answerer account, and he may not further answer.*</p>
              </c:if>
     </c:if>
     <font style="color:blue;">
     <c:if test="${answerList.get(a-1).getqComment()=='soso'}">
     <img src="<%=basePath %>images/Forums/notgood.gif"/>soso </c:if>
     <c:if test="${answerList.get(a-1).getqComment()=='sorry'}">
     <img src="<%=basePath %>images/Forums/bad.gif" />sorry</c:if>
     <c:if test="${answerList.get(a-1).getqComment()=='good'}">
     <img src="<%=basePath %>images/Forums/good.gif" />good</c:if>
     </font>
     <c:if test="${bestanswer.size()==0}">
     <form action="<%=basePath%>web/QandA/ChooseBestAnswer">
     <input type="hidden" name="answerId" value="${answerList.get(a-1).getId()}"/>
	 <input type="hidden" name="qId" value="${requestScope.question.getId()}"/>
	 <input type="submit" name="best" value="select as best"  class="submitButton"  id="submitBest" style="margin-top:10px;margin-right:0px;"/>
	 </c:if>
</c:if>
</div>
						
						</div>
				</div>
				</c:forEach>

				</c:if>
			
<div style="margin-top: 20px"></div>
					<div class="pg" >
                        <c:if test="${record>1}">
						<a href="<%=basePath %>web/QandA/QuestionFind/${question.id}?record=${record-1}">
						<fmt:message key="last page"></fmt:message></a>
						</c:if>
						
						<c:if test="${allPage<=10}"> 
						<c:forEach begin="1" end="${allPage}" step="1" var="i">
						      &nbsp; 
						      <a href="<%=basePath %>web/QandA/QuestionFind/${question.id}?record=${i}">	
						      <c:if test="${record==i}"> <b style="color:blue;">${i}</b></c:if>					       
						      <c:if test="${record!=i}"> ${i}</c:if>
						      </a>&nbsp;
						</c:forEach>
						</c:if>
						
						<c:if test="${allPage>10}">
						<c:forEach begin="${record-5}" end="${record+4}" step="1" var="i">
						      &nbsp;
						      
						      <a href="<%=basePath %>web/QandA/QuestionFind/${question.id}?record=${i}">	
						      <c:if test="${record==i}"> <b style="color:blue;">${i}</b></c:if>					       
						      <c:if test="${record!=i}"> ${i}</c:if>
						      </a>&nbsp;
						</c:forEach>
						</c:if>
						
						 <c:if test="${record<allPage}">
						<a href="<%=basePath %>web/QandA/QuestionFind/${question.id}?record=${record+1}">
						<fmt:message key="next page"></fmt:message>
						</a>
                         </c:if>
</div>
</div>
			</div>
			<!-- right end -->
			
			
			
		</div>
		<!-- main end -->
		<div id="visitedforums_menu" class="p_pop blk cl"
			style="display: none;">
			<table cellpadding="0" cellspacing="0">
			</table>
		</div>

		


	</div>

	<div id="visitedforums_menu" class="p_pop blk cl"
		style="display: none;">
		<table cellpadding="0" cellspacing="0">
		</table>
	</div>

	<!--footer-->

	<div class="footer">
		<h3>Copyright © 2014 JIE & C DEV(HK)CO L.All Rights Reserved.</h3>
	</div>
	<!--footer end-->
</body>
</html>
