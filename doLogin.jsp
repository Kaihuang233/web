<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2022/11/15
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="login.jsp" %>


<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    session.setAttribute("username" , username);
    String password=request.getParameter("password");
    session.setAttribute("password", password);
    String sex = (String) request.getParameter("sex");
    session.setAttribute("sex", sex);

    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Files.newInputStream(Paths.get("E:\\IDEA data\\web\\新建文件夹\\注册信息.txt")),"GBK"));
    String newMsg;
    boolean idFlag = false;
    boolean passwordFlag = false;
    String feedback = "";
    bufferedReader.readLine();//提前读一行以免直接读空
    try {
        while ((newMsg = bufferedReader.readLine()) != null) {
            Map<String, String> map = new HashMap<>();
            String[] a = newMsg.split(",");//用”，“切割，分成用户名，密码，性别
            for (String str : a) {
                String[] b = str.split(":");//用”：“切割,得到用户名：，密码：，性别：
                map.put(b[0], b[1]);
            }
            if (map.get("username").equals(username)) {//检查用户名
                idFlag = true;
                if (map.get("password").equals(password)) {//检查密码
                    passwordFlag = true;
                    break;
                }
            }
        }
    }
    catch (IOException ie){
        System.out.println(ie);
    }
    if (idFlag && passwordFlag)
        feedback = "登录成功!";
    else if(!idFlag)
        feedback = "用户不存在！";
    else if (!passwordFlag)
        feedback = "密码错误！";

    request.setAttribute("feedback", feedback);//设置feedback值
    request.getRequestDispatcher("login.jsp").forward(request, response);//转发请求和刷新
    System.out.println(feedback);
    bufferedReader.close();


%>
