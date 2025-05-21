<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    HttpSession s = request.getSession();
    String leaveEmp = (String) s.getAttribute("leaveEmp");
    String message = (String) request.getAttribute("message"); 
    String email = (String) s.getAttribute("email");// The message for status (approved/rejected)
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            padding: 40px;
        }
        .leave-container {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .leave-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .detail {
            margin-bottom: 10px;
            font-size: 16px;
            color: #444;
        }
        .label {
            font-weight: bold;
            color: #222;
        }
        .buttons {
            text-align: center;
            margin-top: 30px;
        }
        .button {
            padding: 10px 25px;
            font-size: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 10px;
        }
        .approve {
            background-color: #4CAF50;
            color: white;
        }
        .approve:hover {
            background-color: #45a049;
        }
        .reject {
            background-color: #f44336;
            color: white;
        }
        .reject:hover {
            background-color: #e53935;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="leave-container">
    <div class="leave-title">Leave Request Details</div>

    <div class="detail"><span class="label">Employee Name:</span> ${leaveEmp}</div>

    <div class="detail"><span class="label">Leave ID:</span> ${leave.id}</div>
    <div class="detail"><span class="label">Start Date:</span> ${leave.startDate}</div>
    <div class="detail"><span class="label">End Date:</span> ${leave.endDate}</div>
    <div class="detail"><span class="label">Reason:</span> ${leave.leaveReason}</div>
    <div class="detail"><span class="label">Status:</span> ${leave.status}</div>

<a href="allRequest?email=${email}">← Back to All Leave Requests</a>

    <div class="buttons">
      
                <form action="approveLeave" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${leave.id}" />
                    <button class="button approve" type="submit" id="approveButton">Approve</button>
                </form>
                
                <form action="rejectLeave" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${leave.id}" />
                    <button class="button reject" type="submit" id="rejectButton">Reject</button>
                </form>
              

    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
</div>

</body>
</html>
