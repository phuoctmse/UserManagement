<%-- 
    Document   : createUser
    Created on : Feb 19, 2024, 7:52:38 AM
    Author     : PC
--%>

<%@page import="sample.sp24.t2s1.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
    </head>
    <body>
        <%
            UserError error = (UserError) request.getAttribute("USER_ERROR");
            if (error == null) {
                error = new UserError();
            }
        %>
        <form action="MainController" method="POST">
            UserID:<input type="text" name="userID" required=""/><%=error.getUserIDError()%><br>
            Full name:<input type="text" name="fullName" required=""/><%=error.getFullNameError()%><br>
            Password:<input type="password" name="password" required=""/><%=error.getPasswordError()%><br>
            Confirm:<input type="password" name="confirm" required=""/><%=error.getConfirmError()%><br>
            Role:<br>
            <select name="roleID">
                <option value="AD">AD</option>
                <option value="US">US</option>
            </select><br>
            <input type="submit" name="action" value="Create"/><br>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
