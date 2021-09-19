<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>挂号</title>
</head>
<body>
<form action="insert.do" method="post">
    <table border="" cellspacing="" cellpadding="">
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" value="" /></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input type="radio" name="sex" value="男" checked/>男
                <input type="radio" name="sex" value="女"/>女
            </td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type="text" name="age" value=""/></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="phone" value=""/></td>
        </tr>
        <tr>
            <td>医师类别</td>
            <td>
                <select name="type" id="tp">
                    <option value="不限">不限</option>
                    <option value="普通医师">普通医师</option>
                    <option value="专家医师">专家医师</option>
                    <option value="副主任医师">副主任医师</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>科室</td>
            <td>
                <select name="department" id="dep">
                    <option value="其他科室">其他科室</option>
                    <option value="内科">内科</option>
                    <option value="外科">外科</option>
                    <option value="妇产科">妇产科</option>
                    <option value="男科">男科</option>
                    <option value="五官科">五官科</option>
                    <option value="肿瘤科">肿瘤科</option>
                    <option value="皮肤性病科">皮肤性病科</option>
                    <option value="中医科">中医科</option>
                    <option value="传染科">传染科</option>
                    <option value="精神心理科">精神心理科</option>
                    <option value="中医科">中医科</option>
                </select>
            </td>
        </tr>
        </tr>
        <tr>
            <td>价格</td>
            <td><input type="text" name="price" value=""/></td>
        </tr>
        <tr>
            <td>挂号时间</td>
            <td><input type="datetime-local" name="registerTime" min="2021-09-10 00:00:00" max="2099-01-01 00:00:00"></td>
        </tr>

            <input type="hidden" name="state" value="0">
    </table>
    <input type="submit" value="确定" />
</form>
</body>
</html>
