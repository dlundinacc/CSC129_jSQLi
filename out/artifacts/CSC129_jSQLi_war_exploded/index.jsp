<%--

  To run this demo:
    Start Apache Tomcat using command line
    http://localhost:8080/CSC129_jSQLi/

  If a change is made to this project:
    Build | Rebuild
    Build | Build Artifacts | CSC129_jSQLi
    Copy war from
      C:\Users\dougl\IdeaProjects\CSC129_jSQLi\out\artifacts\CSC129_jSQLi
    To
      C:\apache-tomcat-8.5.50\webapps

--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>ACC CSC129 SQL Injection demo using JSP</title>
</head>
<body>
<form method="post" action="login.jsp">
  <table border="2" width="30%" cellpadding="3">
    <thead>
    <tr>
      <th colspan="2">SQL Injection demo using J2EE JSP (Enter "DLUNDIN/PASSWORD" or "DLUNDIN' or '1'='1' --")</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>User Name</td>
      <td><label>
        <input type="text" name="username" value="" />
      </label></td>
    </tr>
    <tr>
      <td>Password</td>
      <td><input type="password" name="password" value="" /></td>
    </tr>
    <tr>
      <td><input type="submit" value="Login" /></td>
      <td><input type="reset" value="Reset" /></td>
    </tr>
    </tbody>
  </table>
</form>
</body>
</html>