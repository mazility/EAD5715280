<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : summary
    Created on : May 5, 2017, 12:08:16 AM
    Author     : pncht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String pname = request.getParameter("pname");
        String hours = request.getParameter("hours");
    %>
    <body>
        Project Name: <%= pname %>
    <sql:query var="result" dataSource="jdbc/company">
        SELECT NAME,SKILL,RATE,SALARY FROM company.skill natural join company.employee natural join company.employee_skill WHERE EID IN (${sessionScope.emps}) ;
    </sql:query>
   
    <table >
        <!-- column headers -->
        <tr>
        <c:forEach var="columnName" items="${result.columnNames}">
            <th><c:out value="${columnName}"/></th>
        </c:forEach>
    </tr>
    <!-- column data -->
    <c:forEach var="row" items="${result.rowsByIndex}">
        <tr>
        <c:forEach var="column" items="${row}">
            <td><c:out value="${column}"/></td>
        </c:forEach>
        <td>
        </tr>
    </c:forEach>
</table>
        
    Total number of hours: <%= hours%> hrs.
    
</body>
</html>
