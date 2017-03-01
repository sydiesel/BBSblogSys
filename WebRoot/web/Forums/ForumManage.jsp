<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Post management</title>
<meta http-equiv="x-ua-compatible" content="ie=8" />

<link type="text/css" href="<%=basePath%>css/Forums1/manage/forumManage.css" rel="stylesheet" />
<link type="text/css" href="<%=basePath%>css/Forums1/manage/style.css" rel="stylesheet" />

<link href="<%=basePath%>css/headfoot.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath%>css/index_default.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/Index/index.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/qiantai/login.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index/language.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Forum/home.js"></script>
<script type="text/javascript" src="<%=basePath%>js/login_all.js"></script>

<script>
  function confirmDel()
  {
     if(confirm("Determine the implementation of the operation"))
       return true;
       else
       return false;
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

<!--mainbox beginning-->
<div class="mainbox" id="mainbox">

<div class="floor1" style="background:#fff;">
     <div class="sidebar">
          <ul id="nav">
           
            <li><a href="toForumManage_${masterBoardId}?record=1#mainbox">Deal with Posts</a></li>
             <li><a href="setVerify_${masterBoardId}?record=1#mainbox">Post approval</a></li>
            <li><a href="listWellorTop_${masterBoardId}?type=well&record=1#mainbox">highlighted</a></li>
            <li><a href="listWellorTop_${masterBoardId}?type=top&record=1#mainbox">Check Sticky Posts</a></li>
            <li><a href="listWellorTop_${masterBoardId}?type=lock&record=1#mainbox">Check Locked Posts</a></li>
             <li><a href="listNotSay_${masterBoardId}?record=1#mainbox">Banned List</a></li> 
 
            
          </ul>
     </div>
     <div class="manageForum">
         
          
          <div class="widget">
              <table class="table table-striped table-bordered table-hover">
              <tr ><td>Title</td>
              <td>Posted by</td>
              <td>Nature</td>
              <td>Post Time</td>
              <td>Reply/Click</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
              <c:forEach end="${listForum.size()}" begin="1" var="size" step="1">
              <tr>
              <td style="text-align:left;">
              <a href="toTopics?post_id=${listForum.get(size-1).id}">${listForum.get(size-1).subject}</a></td>
              <td><a href="<%=basePath%>web/Blog/${listForum.get(size-1).userInfo.nickName}">
              ${listForum.get(size-1).userInfo.nickName}</a></td>
              
              <td>
                    <c:if test="${listForum.get(size-1).isTop==1}">Sticky Posts</c:if>
                    <c:if test="${listForum.get(size-1).isWell==1}">Highlighted Posts</c:if>
                    <c:if test="${listForum.get(size-1).postStatus.id==5}">Locked Posts</c:if>
              </td>
              <td>${listForum.get(size-1).postDate}</td>
              <td>${listForum.get(size-1).replyCount}/${listForum.get(size-1).postCount}</td>
              <td><a href="setTop?post_id=${listForum.get(size-1).id}&record=${record}#mainbox">
              Stick</a></td>
              <td><a href="setWell?post_id=${listForum.get(size-1).id}&record=${record}#mainbox">
              Highlight</a></td>
              <td><a href="toLockForum?post_id=${listForum.get(size-1).id}&record=${record}#mainbox"
               onclick="return confirmDel()">Lock</a></td>
              </tr>
              </c:forEach>
              
             </table>
             
             
              <div class="fenye">
          	    <!-- 此处设置分页 -->
          	    
                         <c:if test="${record>1}">
						
						 <a href="toForumManage_${masterBoardId}?record=${record-1}">
						 Page up</a> 
						</c:if>
						
					    <c:if test="${allPage<=10}">
						<c:forEach begin="1" end="${allPage}" step="1" var="i">
						      &nbsp; 
   
						     
						      <a href="toForumManage_${masterBoardId}?&record=${i}">
						     
						      <c:if test="${record==i}"> <b style="color:#3399CC;">${i}</b> </c:if> 
						      <c:if test="${record!=i}"> <b style="color:#999;">${i}</b> </c:if>
						      </a>&nbsp; 
	    
						</c:forEach>
						</c:if>
	
						<c:if test="${allPage>10}">
						<c:forEach begin="${record-5}" end="${record+4}" step="1" var="i">
						      &nbsp;<a href="toForumManage_${masterBoardId}?&record=${i}"> 
						      <c:if test="${record==i}"> <b style="color:#3399CC;">${i}</b> </c:if> 
						      <c:if test="${record!=i}"> <b style="color:#999;">${i}</b> </c:if>
						      </a>&nbsp;
						</c:forEach>
						</c:if>
					
						
						 <c:if test="${record<allPage}">
						
						 <a href="toForumManage_${masterBoardId}?record=${record+1}">Page down</a>
                         </c:if>
						
						 
						 </div>
          </div>
     
     </div>
</div>

</div>
<!--mainbox end-->


<!--footer-->

	<div class="footer">
		<h3>Copyright © 2014 JIE & C DEV(HK)CO L.&nbsp;&nbsp;All Rights
			Reserved.</h3>
	</div>
	<!--footer end-->
</body>
</html>