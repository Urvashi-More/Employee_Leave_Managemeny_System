<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    HttpSession s = request.getSession();
    String name = (String) s.getAttribute("name");
    String email=(String) s.getAttribute("email");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Leave Requests</title>

    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);  /* Sky blue to medium blue */

            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 30px;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .employee-box {
            background-color: #fff;
            border-radius: 12px;
            padding: 20px;
            width: 280px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .employee-box:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .employee-name {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 12px;
            color: #333;
        }

        .leave-details {
            font-size: 14px;
            color: #444;
            margin-bottom: 16px;
            line-height: 1.6;
        }

        .buttons {
            text-align: center;
        }

        .button {
            padding: 10px 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .material-icons {
            font-size: 18px;
        }

        /* Responsive for smaller screens */
        @media (max-width: 600px) {
            .employee-box {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<h2>All Leave Requests</h2>

<div class="container">
    <c:forEach var="leave" items="${list}">
        <div class="employee-box">
            <div class="employee-name">${leave.employee.name}</div>

            <div class="leave-details">
                <strong>Type:</strong> ${leave.leaveType} <br/>
                <strong>Status:</strong> ${leave.status}
            </div>

            <div class="buttons">
                <a href="viewLeaves?id=${leave.id}" title="Click to view full leave details">
                    <button class="button">
                        <span class="material-icons">visibility</span> View Detail
                    </button>
                </a>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
