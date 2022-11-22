
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2022/11/15
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>注册</title>
  <script>

    function checkAll() {//检查用户输入格式是否正确
      var username = document.getElementById("username");
      var password = document.getElementById("password");
      var reg_username = /^\w{2,20}$/;//正则表达式检查格式
      var reg_password = /^\w{8,20}$/;//正则表达式检查格式
      var flag_username = reg_username.test(username.value);
      var flag_password = reg_password.test(password.value);
      if (flag_username == false){
        alert("用户名请在2-20位之间");
        return false;
      }else if(flag_password == false){
        alert("密码用户名请在8-20位之间");
        return false;
      }
      return true;
    }
  </script>
</head>
<%
  String g = (String)request.getAttribute("feedback");         // 获取错误属性
  if(g != null) {
%>
<script type="text/javascript" language="javascript">
  alert("<%=g%>");                                            // 弹出错误信息
</script>
<%
  }
%>
<body>
<div class="outer">
  <div class="register">
    <div class="title">注册界面</div>
    <form class="infoList" id="registerForm" action="doRegister.jsp" method="post" onsubmit="return checkAll()">
      <table>
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
        <tr>
          <td class="td_left">
            <label for="sex">性别:</label>
          </td>
          <td class="td_right gender">
            <select  id="sex" name="sex" >
              <option value="male">男</option>
              <option value="female">女</option>
            </select>
          </td>
        </tr>
      </table>
      <input type="submit" class="submit" value="注册">
      <button class="submit"><a href="login.jsp">前往登录</a></button>
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
    align-items: center;
  }
  .register{
    display: flex;
    margin-top: 300px;
    height: 170px;
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
    align-content: center;
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
    margin-left: 10px;
    border: 1px solid rgb(104,124,148);
    border-radius: 2px;
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
