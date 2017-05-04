<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : May 4, 2017, 9:52:45 PM
    Author     : pncht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
    </head>
    <body>
        <sql:query var="result" dataSource="jdbc/company">
            SELECT SKILL from skill;
        </sql:query>
        <h1>Index</h1>
        <form action="detail" method='POST'>
            Project Name: <input type="text" name="pname" value="" /><br><br>
            <%--  <table border="1">
                  <!-- column headers -->
                  
                  <!-- column data -->
                  <c:forEach var="row" items="${result.rowsByIndex}">
                      <tr>
                          <c:forEach var="column" items="${row}">
                              <td>
                                  <input type="checkbox" name="skill" value="${rowsByIndex.SID}">
                                  <c:out value="${column}"/>
                              </td>
                          </c:forEach> 
                      </tr>
                  </c:forEach>
              </table><br>
            --%>
            <table border="">
                <tbody>
                    <tr><input type="checkbox" name="skill" value="Java" /> Java<br>
                </tr>
                <tr><input type="checkbox" name="skill" value="PHP" /> PHP<br>
                </tr>
                <tr><input type="checkbox" name="skill" value="JavaScript" /> JavaScript<br>
                </tr>
                <tr><input type="checkbox" name="skill" value="Python" /> Python<br>
                </tr>
                <tr><input type="checkbox" name="skill" value="HTML" /> HTML<br>
                </tr>
                </tbody>
            </table>

            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="sumbit" />
        </form>
    </body>
</html>
