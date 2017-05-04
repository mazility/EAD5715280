<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : detail
    Created on : May 4, 2017, 9:56:53 PM
    Author     : pncht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Page</title>
    </head>
    <body>
        <table border="0">
            <tbody>
                <tr>
                    Project name : <input type="text" name="pname" value="${param.pname}">
                    Skills: <input type="text" name="pname" value="${param.skill}">
            </tr>             
            </tbody>
        </table>    
        <form action="summary" method="POST">
            <input type="hidden" name="pname" value="${param.pname}">
            <sql:query var="result" dataSource="jdbc/company">
                SELECT EID,NAME,POSITION,SKILL FROM company.skill natural join company.employee natural join company.employee_skill WHERE skill IN (${sessionScope.skills}) ;
            </sql:query>
            ${sessionScope.skills}
            <table border="1">
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
                        <td><input type="checkbox" name="emp" value="${row[0]}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            Total number of hours: <input type="text" name="hours" value="${param.hours}">
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>

    </body>
</html>
