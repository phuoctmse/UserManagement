<%-- 
    Document   : login
    Created on : Jan 22, 2024, 8:36:08 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="MainController" method="POST">
            UserID: <input type="text" name="userID"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" name="action" value="Login"><br>
            <input type="reset" value="Reset"><br>
        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
    </body>
</html>