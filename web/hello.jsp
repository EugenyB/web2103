<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: yevge
  Date: 21.03.2017
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <h1>Hello</h1>
    <c:choose>
        <c:when test="${!empty name}">
        <c:out value="${name}" />
    </c:when>
    <c:otherwise>
        <c:out value="незнакомец!" />
    </c:otherwise>
    </c:choose>
    <jsp:useBean id="list" scope="request" type="java.util.List" />
    <table>
        <c:forEach items="${list}" var="line">
            <tr><td>${line}</td></tr>
        </c:forEach>
    </table>
    <sql:setDataSource var="snapshot" driver="org.apache.derby.jdbc.EmbeddedDriver"
                       url="jdbc:derby:d:/temp/sample"
                       user="APP"  password="APP"/>

    <sql:query dataSource="${snapshot}" var="result">
        SELECT * from PERSON;
    </sql:query>
    <table>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.ID}"/></td>
            <td><c:out value="${row.NAME}"/></td>
            <td><c:out value="${row.AGE}"/></td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>
