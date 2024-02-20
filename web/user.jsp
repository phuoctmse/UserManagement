<%-- 
    Document   : user
    Created on : Jan 22, 2024, 8:35:51 AM
    Author     : PC
--%>

<%@page import="sample.sp24.t2s1.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>User Page</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
        %>
        UserID: <%= loginUser.getUserID()%><br>
        FullName: <%= loginUser.getFullName()%><br>
        RoleID: <%= loginUser.getRoleID()%><br>
        Password: <%= loginUser.getPassword()%><br>
    </body>
</html>
