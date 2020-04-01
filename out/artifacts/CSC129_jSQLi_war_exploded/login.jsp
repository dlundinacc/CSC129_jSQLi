<%-------------------------------------------------------------------------------------------------------------%>
<%--                                                                                                         --%>
<%-- SQL Injection demo using J2EE JSP                                                                       --%>
<%--                                                                                                         --%>
<%-- 20191022 ddl                                                                                            --%>
<%--      Typical case                                                                                       --%>
<%--           Enter username and password (e.g. DLUNDIN/PASSWORD)                                           --%>
<%--           You will get data as matched by filter                                                        --%>
<%--           Query used is:                                                                                --%>
<%--                SELECT * FROM HR.employee WHERE username='DLUNDIN' and password='PASSWORD'               --%>
<%--      Insecure case                                                                                      --%>
<%--           Enter username as below and leave password blank                                              --%>
<%--                DLUNDIN' or '1'='1' --                                                                   --%>
<%--           You will get ALL data from table                                                              --%>
<%--           Query used is:                                                                                --%>
<%--                SELECT * FROM HR.employee WHERE username='DLUNDIN' or '1'='1' -- and password='PASSWORD' --%>
<%--                                                                                                         --%>
<%--      The class will learn how to (1) Identify vulnerable code and (2) remediate vulnerabilities         --%>
<%--                                                                                                         --%>
<%--      Remediated code                                                                                    --%>
<%--           Enter username as below and leave password blank                                              --%>
<%--                DLUNDIN' or '1'='1' --                                                                   --%>
<%--           Username will be SANITIZED using the Oracle preparedStatement function                        --%>
<%--           Username becomes DLUNDIN and since Password is blank, no data will be returned                --%>
<%--                                                                                                         --%>
<%-------------------------------------------------------------------------------------------------------------%>
<%@ page import="java.sql.*" %>
<%@ page import="static java.sql.DriverManager.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
    Connection con = getConnection("jdbc:oracle:thin:system/lauren1@localhost:1521:ORCL");
    Statement st = con.createStatement();

/***************************************************************************************************************
 ***************************************************************************************************************/
// Following code is susceptible to SQL Injection attacks
    String query = "SELECT * FROM HR.employee WHERE username='" + username + "' and password='" + password + "'";
    System.out.println("Query executed: " + query);
    ResultSet rs = st.executeQuery(query);

/***************************************************************************************************************
// Following code is secure from SQL Injection attacks
    String query = "SELECT * FROM HR.employee WHERE username=? and password=?";
    PreparedStatement stmt = con.prepareStatement(query);
// Bind the value into the prepared statement.
    stmt.setString(1, username);
    stmt.setString(2, password);
// Execute the completed statement.
    ResultSet rs  = stmt.executeQuery();
 ***************************************************************************************************************/


    out.println("Data for: "+username+" follows: ");
    out.println("<br>");
    while (rs.next()) {
        session.setAttribute("username", username);
        out.println(
                rs.getString("first_name") + " " +
                rs.getString("last_name") + " (" +
                "USERNAME:"+rs.getString("username") + "    " +
                "SSN:"+rs.getString("SSN") + "    " +
                "ACTNBR"+rs.getString("ACTNBR") + " " +
                ")\r\n"
        );
        out.println("<br>");
    }
%>