<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, in.pentagon.studentapp.dto.Student" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DashBoard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .navbar {
            background-color: #1e1e1e;
            color: white;
        }
        .navbar a, .navbar span {
            color: white;
            margin-right: 15px;
            text-decoration: none;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .logout-btn {
            background-color: red;
            color: white;
        }
        .section-title {
            margin-top: 30px;
            margin-bottom: 20px;
        }
        table {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<!-- Top NavBar -->
<div class="navbar d-flex justify-content-between align-items-center p-3">
    <div>
        <span>Welcome <%= session.getAttribute("name") != null ? session.getAttribute("name") : " " %></span>
    </div>
    <div>
        <a href="viewUsers.jsp">View Users</a>
        <a href="resetPassword.jsp">Reset Password</a>
        <a href="update.jsp">Update Data</a>
        <a href="logout" class="btn logout-btn btn-sm">Logout</a>
    </div>
</div>

<!-- Dashboard Heading -->
<h2 class="text-center mt-4">Dashboard</h2>

<!-- View Your Data Section -->
<h4 class="section-title">View Your Data</h4>
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Mail ID</th>
            <th>Branch</th>
            <th>Location</th>
        </tr>
    </thead>
    <tbody>
        <%
            Student student = (Student) session.getAttribute("Login");
            if (student != null) {
        %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getPhone() %></td>
            <td><%= student.getMail() %></td>
            <td><%= student.getBranch() %></td>
            <td><%= student.getLoc() %></td>
        </tr>
        <% } %>
    </tbody>
</table>

<!-- Search Section -->
<h4 class="section-title">Search user</h4>
<form action="search" method="get" class="mb-3 d-flex align-items-center">
    <label for="name" class="me-2">Enter the name of the student here:</label>
    <input type="text" name="name" id="name" class="form-control me-2" style="width: 200px;">
    <button type="submit" class="btn btn-primary">search</button>
</form>

<!-- Search Results -->
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Branch</th>
            <th>Location</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Student> resultList = (List<Student>) request.getAttribute("searchResults");
            if (resultList != null && !resultList.isEmpty()) {
                for (Student s : resultList) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getBranch() %></td>
            <td><%= s.getLoc() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4" class="text-center">Search for users!</td>
        </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
