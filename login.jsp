<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2022/11/15
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录</title>
</head>

<%
    String msg = (String)request.getAttribute("feedback");         // 获取错误属性
    if(msg != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=msg%>");                                            // 弹出错误信息
</script>
<%
    }
%>

<body>
<div class="outer">
    <div class="login">
        <div class="title">登录界面</div>
        <form class="infoList" id="loginForm" action="doLogin.jsp" method="post">
            <table style="width: 100%">
                <tr>
                    <td class="td_left">
                        <label for="username">用户名:</label>
                    </td>
                    <td class="td_right">
                        <input type="text" id="username" name="username" placeholder="请输入账号">
                    </td>
                </tr>
                <tr>
                    <td class="td_left">
                        <label for="password">密码:</label>
                    </td>
                    <td class="td_right">
                        <input type="password" id="password" name="password" placeholder="请输入密码">
                    </td>
                </tr>
            </table>
            <input type="submit" class="submit" value="登录">
            <button class="submit"><a href="register.jsp">返回注册</a></button>
        </form>
    </div>
</div>

</body>
<style>
    .outer{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-content: center;
    }
    .login{
        margin-top: 370px ;
        display: flex;
        height: 150px;
        width: 300px;
        border: 1px solid rgb(104,124,148);
        border-radius: 10px;
        background-color: rgb(255,255,255);
        flex-wrap: wrap;
        justify-content: center;
    }
    .title{
        width: 100%;
        height: 35px;
        border-top-right-radius: 10px;
        border-top-left-radius: 10px;
        background-color: rgb(104,124,148);
        color: white;
        font-size: 17px;
        display: flex;
        align-items: center;
        padding-left: 8px;
    }
    .infoList{
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }
    .td_left{
        width: 30%;
        height: 25px;
        align-items: center;
        text-align: right;
    }
    .td_right{
        width: 70%;
        height: 25px;
    }
    input{
        background:none;
        outline:none;
        border:none;
        border-bottom: 1px solid rgb(104,124,148) ;
    }
    input:focus{
        border: none;
        border-bottom: 1px solid rgb(104,124,148) ;
    }
    .submit{
        height: 30px;
        width: 80px;
        border: 1px solid rgb(104,124,148);
        border-radius: 2px;
        margin-left: 10px;
        margin-bottom: 10px;
    }

    a {
        text-decoration: none;
        color: #000;
    }
    a:link {
        text-decoration: none;
    }
    a:visited {
        text-decoration: none;
    }
    a:hover {
        text-decoration: none;
    }
    a:active {
        text-decoration: none;
    }
</style>
</html>
