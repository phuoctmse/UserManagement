<%-- 
    Document   : admin
    Created on : Jan 22, 2024, 8:36:01 AM
    Author     : PC
--%>

<%@page import="java.util.List"%>
<%@page import="sample.sp24.t2s1.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h1>Admin Page</h1>
        <%
            String searchContent = request.getParameter("search");
            if (searchContent == null) {
                searchContent = "";
            }
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }

        %>
        Welcome <h2><%= loginUser.getFullName()%></h2>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>

        </form>
        <a href="MainController?action=Create_User_Page">Create User</a>
        <form action="MainController">
            Search: <input type="text" name="search" value="<%=searchContent%>">
            <input type="submit" name="action" value="Search">
        </form>
        <%
            if (listUser != null && listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController">
                <tr>
                    <td><%=count++%></td>
                    <td>
                        <input type="text" name="userID" value="<%=user.getUserID()%>" readonly="" />
                    </td>
                    <td><input type="text" name="fullName" value="<%=user.getFullName()%>" required="" /></td>
                    <td><input type="text" name="roleID" value="<%=user.getRoleID()%>" required="" /></td>
                    <td><%=user.getPassword()%></td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%=searchContent%>"/>
                    </td>
                    <!-- Delete-->
                    <td>
                        <a href="MainController?action=Delete&userID=<%=user.getUserID()%>&search=<%=searchContent%>">Delete</a>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        }
    %>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }

    %>
    <%= error%>
</body>
</html>
