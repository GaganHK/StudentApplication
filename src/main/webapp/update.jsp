<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="in.pentagon.studentapp.dto.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pentagon Space - Update Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6ff;
            text-align: center;
        }

        h1 {
            color: #2a4d99;
            margin-top: 40px;
        }

        h3 {
            color: #666;
            margin-bottom: 30px;
        }

        input[type="text"], input[type="email"], input[type="tel"] {
            width: 300px;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .update-btn {
            background-color: #4CAF50;
            color: white;
        }

        .back-btn {
            background-color: #4169E1;
            color: white;
        }
    </style>
</head>
<body>

<%
    if(session.getAttribute("student") != null) {
        Student s = (Student) session.getAttribute("student");
%>
    <h1>Pentagon Space</h1>
    <h3>Update your account</h3>

    <form action="update" method="post">
        <input type="text" name="name" value="<%=s.getName()%>" placeholder="Enter your Name" required><br>
        <input type="tel" name="phone" value="<%=s.getPhone()%>" placeholder="Enter the Phone number" required><br>
        <input type="email" name="email" value="<%=s.getMail()%>" placeholder="Enter the Mail ID" required><br>
        <input type="text" name="branch" value="<%=s.getBranch()%>" placeholder="Enter the Branch" required><br>
        <input type="text" name="loc" value="<%=s.getLoc()%>" placeholder="Enter the Location" required><br>

        <button type="submit" class="update-btn">Update Account</button>
        <button type="button" class="back-btn" onclick="history.back()">Back</button>
    </form>
<%
    } else {
%>
    <h3>Session expired or user not logged in.</h3>
    <a href="Login.jsp">Go to Login</a>
<%
    }
%>

</body>
</html>
