<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Forum Talk</title>

<meta http-equiv="x-ua-compatible" content="ie=8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index/language.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Forum/home.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Forum/board.js"></script>
<script type="text/javascript" src="<%=basePath%>js/login_all.js"></script>

<script type="text/javascript">
     
      function changeManage(id)
     {
         var manage=document.getElementById("manage"+id).value;
          var record=document.getElementById("record").value;
         window.location.href="manageInForums.html?message="+manage+"&postId="+id+"&record="+record+"#mainBox";   
     }   
    
     
</script>
</head>
<link type="image/x-icon" href="<%=basePath%>img/bitbug_favicon.ico"
	rel="shortcut icon" />

<link href="<%=basePath%>css/headfoot.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Forums1/newHome.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Forums1/post/board.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Forums1/post/listForum.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/index_default.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Index/index.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/button.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/qiantai/login.css" rel="stylesheet" type="text/css" />	
	


<body style="font-family:Arial,verdana,tahoma;">
<input type="hidden" id="record" value="${record}">
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
		         <span class="font">Union Category</span>
		  </div>
		 
		  <c:forEach end="${listboard.size()}" begin="1" step="1" var="i">
              
              <c:if test="${listboard.get(i-1).id!=board_id}">
		      <li class="boardBg" id="one" onmouseover="over('${i}')" onmouseout="out('${i}')">
		       <a href="listPostByLabel?board_id=${listboard.get(i-1).id}&record=1#mainBox">	
		      <div id="boardName" >	
		             
		       <span class="board_title_font">
		       <img src="<%=basePath%>images/Forums/new/${listboard.get(i-1).boardLogo}.png" 
		       class="board_index" id="noSelectIndex${i}">
		       <img src="<%=basePath%>images/Forums/new/${listboard.get(i-1).boardLogo}_1.png" 
		       class="board_index" id="selectIndex${i}" style="display:none;">
		       ${listboard.get(i-1).boardName}</span>		       
		       
		       <div style="background:url(images/Forums/new/go.png);display:none;" class="go" id="go${i }"></div>		       
		      </div>
		       </a>
		      <div class="labelIndex">
		         <c:forEach end="${listAllLabel.get(i-1).size()}" begin="1" var="j" step="1">
		            <div class="everyLabel">
		            <a href="<%=basePath%>search.do?search=${listAllLabel.get(i-1).get(j-1).labelName}&searchMethod=0&lab=1&sub=1&con=1">
		            ${listAllLabel.get(i-1).get(j-1).labelName}
		            </a>
		            </div>
		         </c:forEach>
		      </div>
		      </li>
		      
		      </c:if> 
		      
		      
		      
		      <c:if test="${listboard.get(i-1).id==board_id}">
		      <li class="boardBg" id="one" style="background:#087ec4;">
		       <a href="listPostByLabel?board_id=${listboard.get(i-1).id}&record=1#mainBox"
		         style="color:#fff;">	
		      <div id="boardName" >	
		             
		       <span class="board_title_font">
		       
		       <img src="<%=basePath%>images/Forums/new/${listboard.get(i-1).boardLogo}_1.png" 
		       class="board_index" id="selectIndex${i}">
		       ${listboard.get(i-1).boardName}</span>		       
		       
		       <div style="background:url(images/Forums/new/go.png);" class="go" id="go${i }"></div>		       
		      </div>
		       </a>
		      <div class="labelIndex">
		         <c:forEach end="${listAllLabel.get(i-1).size()}" begin="1" var="j" step="1">
		            <div class="everyLabel">
		            <a href="<%=basePath%>search.do?search=${listAllLabel.get(i-1).get(j-1).labelName}&searchMethod=0&lab=1&sub=1&con=1">
		            ${listAllLabel.get(i-1).get(j-1).labelName}
		            </a>
		            </div>
		         </c:forEach>
		      </div>
		      </li>
		      
		      </c:if> 
		      
		      
		    
		  </c:forEach>
		
		
		</ul>
		<div class="right_listForum" id="right_listForum">
		  <div class="listForum_title">
		     <div id="listForum_well" 
		     <c:if test="${forumType=='well'}">style="background:#0d88d2;"</c:if>>
		         <a href="listPostByLabel?board_id=${board.id}&record=1&forumType=well#right_listForum"
		         <c:if test="${forumType=='well'}">style="color:#fff;"</c:if>>Highlight</a>
		     </div>
		     <div id="listForum_hot"
		     <c:if test="${forumType=='hot'}">style="background:#0d88d2;"</c:if>>
		        <a href="listPostByLabel?board_id=${board.id}&record=1&forumType=hot#right_listForum"
		        <c:if test="${forumType=='hot'}">style="color:#fff;"</c:if>> Hit</a>                           
		     </div>
		     <div id="listForum_discuss"
		     <c:if test="${forumType=='discuss'}">style="background:#0d88d2;"</c:if>>
		     <a href="listPostByLabel?board_id=${board.id}&record=1&forumType=discuss#right_listForum"
		     <c:if test="${forumType=='discuss'}">style="color:#fff;"</c:if>> From Blog</a>
		     </div>
		     <div id="listForum_origin"
		     <c:if test="${forumType=='origin'}">style="background:#0d88d2;"</c:if>>
		      <a href="listPostByLabel?board_id=${board.id}&record=1&forumType=origin#right_listForum"
		      <c:if test="${forumType=='origin'}">style="color:#fff;"</c:if>> New Topic</a>
		     </div>
		     
		     <a class="submitButton" style="background:#0c86ce;float:right;margin-top:7px;"
		     href="addPost?board_id=${board.id}">New Topic</a>
		     <c:if test="${userInfo!=null}">
		     <a class="submitButton" style="background:#0c86ce;float:right;margin-top:7px;"
		     href="addMasterApply">Be Moderator</a>
		     <c:if test="${userInfo!=null&&trueMaster==true}">
		     <a class="submitButton" style="background:#0c86ce;float:right;margin-top:7px;"
		     href="toForumManage_${board.id}?record=1">Manage</a>
		     </c:if>
		     </c:if>
		  </div>
		  
<div  class="right_mainBox">
		  <table class="forum_list">
		  
		  <!-- 置顶帖 -->
		     <c:if test="${listPostTop.size()>0&&forumType=='all'&&record==1}">
		        <c:forEach begin="1" end="${listPostTop.size()}"  step="1" var="a">
		        <tr class="forum_detail">
		          <td class="forum_subject">
		          <img src="<%=basePath%>images/Forums/new/top.png" width="16px" height="16px">
		           <a href="<%=basePath%>toTopics?post_id=${listPostTop.get(a-1).id}">
		          ${listPostTop.get(a-1).subject}</a>
		          </td> 
		          <td class="forum_poster">
		          <a href="<%=basePath%>web/Blog/${listPostTop.get(a-1).userInfo.nickName}">
		          ${listPostTop.get(a-1).userInfo.nickName}</a>
		          </td>
		          <td class="forum_read_reply">
		         Read(${listPostTop.get(a-1).postCount}) &nbsp;&nbsp;Comments(${listPostTop.get(a-1).replyCount})
		          </td>
		           <td class="forum_time">
		         ${listPostTop.get(a-1).postDate}
		          </td>
		          <td class="forum_label">
		          
		          <c:if test="${listTopLable.get(a-1).size()>0}">		                  
		                  <a href="<%=basePath%>search.do?search=${listTopLable.get(a-1).get(0).label.labelName}&searchMethod=0&lab=1&sub=1&con=1">
		                  ${listTopLable.get(a-1).get(0).label.labelName}</a>
		               
		          </c:if>
		          
		          </td>
		          
		          <c:if test="${trueMaster==true}"> 
		          <td class="forum_manage">
		           
                    <select id="manage${listPostTop.get(a-1).id}"  class="manage_select"
                    onchange="changeManage('${listPostTop.get(a-1).id }')">
                    <option value="0" selected="selected">Operation</option>
                    <option value="well"><c:if test="${listPostTop.get(a-1).isWell==1}">Canceling</c:if>Highlight</option>
                    <option value="top"><c:if test="${listPostTop.get(a-1).isTop==1}">Canceling</c:if>Sticky</option>

                    <c:if test="${listPostTop.get(a-1).postStatus.id==4}"><option value="lock">Locked</option></c:if>
                    <c:if test="${listPostTop.get(a-1).postStatus.id==5}"><option value="unlock">Unlocked</option></c:if>

                    <option value="delete">Delete</option>
                  
                      </select>
                   
		        </td>
		         </c:if>
		          
		        
		        </tr>
		        </c:forEach>
		        
		        
		     </c:if>
		     
		 <!-- 非置顶帖 -->    
		     <c:if test="${postByBoard.size()>0}">
		        <c:forEach begin="1" end="${postByBoard.size()}"  step="1" var="a">
		        <tr class="forum_detail">
		          <td class="forum_subject">
		          
		          <a href="<%=basePath%>toTopics?post_id=${postByBoard.get(a-1).id}">
		          ${postByBoard.get(a-1).subject}</a>
		          </td> 
		          <td class="forum_poster">
		          <a href="<%=basePath%>web/Blog/${postByBoard.get(a-1).userInfo.nickName}">
		          ${postByBoard.get(a-1).userInfo.nickName}</a>
		          </td>
		          <td class="forum_read_reply">
		          Read(${postByBoard.get(a-1).postCount}) &nbsp;&nbsp;Comments(${postByBoard.get(a-1).replyCount})
		          </td>
		           <td class="forum_time">
		         ${postByBoard.get(a-1).postDate}
		          </td>
		          <td class="forum_label">
		               
		               <c:if test="${listOtherLable.get(a-1).size()>0}">
		                          
		                   <a href="<%=basePath%>search.do?search=${listOtherLable.get(a-1).get(0).label.labelName}&searchMethod=0&lab=1&sub=1&con=1">
		                   ${listOtherLable.get(a-1).get(0).label.labelName}</a>
		               
		                </c:if>
		          
		          
		          </td>
		          
		          <c:if test="${trueMaster==true}">
		          <td class="forum_manage">
		            
                    <select id="manage${postByBoard.get(a-1).id}"  class="manage_select"
                    onchange="changeManage('${postByBoard.get(a-1).id }')">
                    <option value="0" selected="selected">Operation</option>
                    <option value="well"><c:if test="${postByBoard.get(a-1).isWell==1}">Canceling</c:if>Highlight</option>
                    <option value="top"><c:if test="${postByBoard.get(a-1).isTop==1}">Canceling</c:if>Sticky</option>

                    <c:if test="${postByBoard.get(a-1).postStatus.id==4}"><option value="lock">Locked</option></c:if>
                    <c:if test="${postByBoard.get(a-1).postStatus.id==5}"><option value="unlock">Unlocked</option></c:if>

                    <option value="delete">Delete</option>
                  
                      </select>
                    
		        </td>
		        </c:if>
		          
		        
		        </tr>
		        </c:forEach>
		     </c:if>
		  </table>
	</div>	  
		  
		  <div class="fenYe">
		  
		               <a href="listPostByLabel?record=1&board_id=${board_id}&forumType=${forumType}">
						Homepage</a>
		  
		               <c:if test="${record>1}">
						<a href="listPostByLabel?record=${record-1}&board_id=${board_id}&forumType=${forumType}">
						Page up</a>
						</c:if>
						
						<c:if test="${allPage<=5}"> 
						<c:forEach begin="1" end="${allPage}" step="1" var="i">
						      &nbsp;  
						      <c:if test="${record==i}"> 
						      <a  href="listPostByLabel?record=${i}&board_id=${board_id}&forumType=${forumType}"
						      style="color:#fff;background:#0d88d2;">${i}</a></c:if>					       
						      <c:if test="${record!=i}"> 
						      <a href="listPostByLabel?record=${i}&board_id=${board_id}&forumType=${forumType}">	
						      ${i}</a></c:if>
						      &nbsp;
						</c:forEach>
						</c:if>
						
						<c:if test="${allPage>5}">
						<c:forEach begin="${record-5}" end="${record+4}" step="1" var="i">
						      &nbsp;  
						      <c:if test="${record==i}"> 
						      <a  href="listPostByLabel?record=${i}&board_id=${board_id}&forumType=${forumType}"
						      style="color:#fff;background:#0d88d2;">${i}</a></c:if>					       
						      <c:if test="${record!=i}"> 
						      <a href="listPostByLabel?record=${i}&board_id=${board_id}&forumType=${forumType}">	
						      ${i}</a></c:if>
						      &nbsp;
						</c:forEach>
						</c:if>
						
						
						 <c:if test="${record<allPage}">
						<a href="listPostByLabel?record=${record+1}&board_id=${board_id}&forumType=${forumType}">
						Page down
						</a>
                         </c:if>
                         
                         <a href="listPostByLabel?record=${allPage}&board_id=${board_id}&forumType=${forumType}">
						Last page</a>
		  
		  </div>
		  
		  

		</div>





	</div>

<!--footer-->
<!--footer-->

	<div class="footer">
		<h3>Copyright © 2014 JIE & C DEV(HK)CO L.&nbsp;&nbsp;All Rights
			Reserved.</h3>
	</div>
	<!--footer end-->
</body>
</html>
