<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>医院就诊挂号系统</title>
    <style type="text/css">
        form{
            padding: 20px;
        }
        #warp{
            margin:0 auto;
            width: 60%
        }
    </style>
</head>
<body>
<h1 align="center">医院就诊挂号系统</h1>
<div id="warp">
    <form action="list.do">
        患者姓名：<input type="text" name="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        医师类别：
        <select name="type">
            <option value="" >=不限=</option>
            <option value="专家医师" >专家医师</option>
            <option value="普通医师" >普通医师</option>
            <option value="副主任医师" >副主任医师</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        科室：<input type="text" name="dep">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="查询">&nbsp;&nbsp;&nbsp;
        <input type="button" value="挂号" onclick="add()">
    </form>
    <table style="margin-bottom: 30px;" width="100%" border="1px" cellpadding="11" cellspacing="0">
        <tr>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话</th>
            <th>科室</th>
            <th>医师类别</th>
            <th>价格</th>
            <th>挂号时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach var="list" items="${selectAll }">
            <tr>
                <td>${list.id }</td>
                <td>${list.name }</td>
                <td>${list.sex }</td>
                <td>${list.age }</td>
                <td>${list.phone }</td>
                <td>${list.department }</td>
                <td>${list.type }</td>
                <td>${list.price }</td>
                <td><fmt:formatDate value="${list.registerTime }" pattern="yyyy-MM-dd"/></td>
                <td>
                    <c:if test="${list.state==0}">
                        未就诊
                    </c:if>
                    <c:if test="${list.state==1}">
                        已就诊
                    </c:if>
                </td>
                <td>
<%--                    如果未就诊，则会出现核销链接，如果已就诊，就不会出现--%>
                    <c:if test="${list.state==0}">
                        <a href="javascript:if(confirm('确实要核销该挂号信息吗?')) location='upd.do?id=${list.id}'">核销</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script type="text/javascript">
    function add() {
        location.href="adds.do";
    }
</script>
</body>
</html>
