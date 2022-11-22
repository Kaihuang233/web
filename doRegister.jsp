<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2022/11/15
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="register.jsp" %>
<%

    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    session.setAttribute("username" , username);
    String password=request.getParameter("password");
    session.setAttribute("password", password);
    String sex = (String) request.getParameter("sex");
    session.setAttribute("sex", sex);
    String msg = "username:" + username + ",password:"  + password +",sex:" + sex;

    String newMsg;
    boolean idFlag = false;
    boolean passwordFlag = false;
    boolean have = false;
    String feedback = "";
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Files.newInputStream(Paths.get("E:\\IDEA data\\web\\新建文件夹\\注册信息.txt")),"GBK"));
    BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("E:\\IDEA data\\web\\新建文件夹\\注册信息.txt",true),"GBK"));
    bufferedReader.readLine();//提前读一行以免直接读空
    while ((newMsg = bufferedReader.readLine()) != null) {//检查是否注册过
            Map<String, String> map = new HashMap<>();
            String[] a = newMsg.split(",");//用”，“切割，分成用户名，密码，性别
            for (String str : a) {
                String[] b = str.split(":");//用“：”切割,得到用户名：
                map.put(b[0], b[1]);
                break;
            }
            if (map.get("username").equals(username)) {//有同样的用户名
                feedback = "用户之前已注册";
                request.setAttribute("feedback", feedback);//设置feedback
                request.getRequestDispatcher("login.jsp").forward(request, response);//转发请求和刷新并跳转至登录界面
                System.out.println(feedback);
                have = true;
                break;
            }
    }
    if(!have){//若未注册过则保存
        bufferedWriter.write(msg+'\n');
        feedback="注册成功！";
        request.setAttribute("feedback", feedback);//设置feedback
        request.getRequestDispatcher("login.jsp").forward(request, response);//转发请求和刷新并跳转至登录界面
    }
    bufferedWriter.close();
%>

