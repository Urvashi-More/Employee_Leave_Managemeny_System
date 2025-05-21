<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    HttpSession s = request.getSession();
    String email = (String) s.getAttribute("email");// The message for status (approved/rejected)
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Response</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .message-box {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .message-box:hover {
            transform: scale(1.05);
        }

        .message {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            transition: color 0.3s ease;
        }

        .message-box:hover .message {
            color: #0078d4;
        }

        .action-btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .action-btn:hover {
            background-color: #45a049;
            transform: translateY(-3px);
        }

        @media (max-width: 600px) {
            .message {
                font-size: 18px;
            }

            .action-btn {
                font-size: 14px;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>

<div class="message-box">
    <div class="message">
        <c:out value="${message}" />
    </div>
    <a href="Admin_home.jsp" class="action-btn">Go to Home</a>
</div>

</body>
</html>
