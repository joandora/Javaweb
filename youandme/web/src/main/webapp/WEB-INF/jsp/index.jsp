<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jstl标签库 -->
<%@include file="common/tag.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>index</title>
    <link href="<%=basePath%>resources/css/index.css" rel="stylesheet">
    <script src="<%=basePath%>resources/js/jquery-2.0.0.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/js/index.js" type="text/javascript" charset="GB2312"></script>
</head>
<body>

<div class="outerContainer">

    <!--导航栏 -->
    <div style="position:fixed;width:1366px;z-index:100;">
        <div class="navContainer">
            <div class="nav">
                <a href="#">主页</a>
                <a href="#">关于</a>
                <span>YouAndMe</span>
                <!-- //TODO 搜索 -->
                <input type="text" class="navSearch" placeholder="Search dynamics" />
                <span>语言：简体中文</span>
            </div>
        </div>
    </div>

    <!-- 用户部分信息 -->
    <div class="aboutUser">
        <div><img src="http://139.129.47.176/J2ee fileUpload/Social dynamics/${userModel.headImg}"></div>

        <a href="${userModel.userId}/userDetail">${userModel.username}
            <h6><img src="<%=basePath%>resources/src/location.png"> ${userModel.address}</h6>
        </a>

        <a href="#">Dynamics
            <span>${userModel.dynamicsNum}</span>
        </a>
        <a href="#">Following
            <span>${userModel.followingNum}</span>
        </a>
        <a href="#">Followers
            <span>${userModel.followersNum}</span>
        </a>
    </div>


    <!-- 中间动态部分 -->
    <div class="DynamicsContainer">

        <!-- 发表动态div -->
        <div class="postDynamicsDiv">
            <!--用户头像 -->
            <img src="http://139.129.47.176/J2ee fileUpload/Social dynamics/${userModel.headImg}">
            <!--发表动态表单 -->
            <form id= "postDynamicsForm">

            <textarea placeholder="What's in your mind now ?" name="dynamicsText"></textarea>
            <span></span>
            <span>Share your life with others.</span>
            <a>
                <input type="file" name="dynamicsFile" />
            </a>
           <!-- <button id="dynamicsButton">Post</button>-->  <!--form表单内用button标签默认get方式！地址栏会改变 -->
            <input type="button" value="Post" class="postButton" id="dynamicsButton"/>

            </form>

        </div>


        <!-- 用户动态 -->
        <div id="dynamicsContainerFade"></div>
        <c:forEach var="dynamics" items="${dynamicsModel}">
            <c:set var="dynamicsFileType" value="${dynamics.dynamicsFile}"></c:set>
            <c:set var="dynamicsFileTypeFinal" value="${fn:substringAfter(dynamicsFileType,'.')}"></c:set>
            <!--动态为文字+图片 -->
            <c:if test="${dynamicsFileTypeFinal =='jpg'}">
                <div class="DynamicsDiv" id="${dynamics.dynamicsId}">
                    <!--用户头像 -->
                    <img src="http://139.129.47.176/J2ee fileUpload/Social dynamics/${dynamics.user.headImg}">
                    <span>${dynamics.user.username}</span><!--发表动态的用户名字-->
                    <span><fmt:formatDate value="${dynamics.createTime}" pattern="yyyy/MM/dd HH:mm:ss"></fmt:formatDate></span>
                    <span></span>
                    <span>浏览(187)</span>
                    <span>${dynamics.dynamicsText}</span>
                    <img src="http://139.129.47.176/J2ee fileUpload/Social dynamics/${dynamics.dynamicsFile}">
                    <span><h4>16</h4></span>
                    <span onclick="likeIt(this)" id='${dynamics.dynamicsId}like'><h4 id='${dynamics.dynamicsId}likeh4'>${dynamics.likeNum}</h4></span>
                    <span onclick="commentIt(this)"><h4>13</h4></span>
                </div>
            </c:if>
            <!--动态为文字+视频 -->
            <c:if test="${dynamicsFileTypeFinal=='mp4'}">
                <div class="DynamicsDiv" id="${dynamics.dynamicsId}">
                    <img src="http://139.129.47.176/J2ee fileUpload/Social dynamics/${dynamics.user.headImg}">
                    <span>${dynamics.user.username}</span>
                    <span><fmt:formatDate value="${dynamics.createTime}" pattern="yyyy/MM/dd HH:mm:ss"></fmt:formatDate></span>
                    <span></span>
                    <span>浏览(187)</span>
                    <span>${dynamics.dynamicsText}</span>
                    <video
                            controls width="640" height="360">
                        <source src="http://139.129.47.176/J2ee fileUpload/Social dynamics/${dynamics.dynamicsFile}" type='video/mp4' />
                    </video>
                    <span><h4>16</h4></span>
                    <span onclick="likeIt(this)" id='${dynamics.dynamicsId}like'><h4 id='${dynamics.dynamicsId}likeh4'>${dynamics.likeNum}</h4></span>
                    <span onclick="commentIt(this)"><h4>13</h4></span>
                </div>
            </c:if>

        </c:forEach>

    </div>

</div>

<div class="dynamisDetailOuter"></div>
<div class="dynamisDetailContainer">
    <!--
    <button>
        <img src="src/attention.png">
        <span>关注</span>
    </button>
    -->
</div>

</body>
</html>