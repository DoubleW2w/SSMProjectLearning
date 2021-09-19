<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
<%--
request.getContextPath获取的是web项目的根地址, 假如Application Context = '/'  那么path就是/
request.getScheme() 获取协议  --> http
request.getServerName() 获取服务器名称 localhost
request.getServerPort() 获取服务器端口  8888
因此 basePath: http://localhost:8888/
--%>
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>XXX系统</title>
</head>
<body>
<%--本jsp作用：当web启动时，会先请求 index.jsp，然后窗口定向到 http://localhost:8888/select.do --%>
<script>
    window.location.href="<%=basePath%>/select.do";
</script>
</body>
</html>
