<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Leave Requests</title>

<!-- Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #74ebd5, #ACB6E5);
        padding: 20px;
        margin: 0;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .employee-box {
        background-color: white;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        width: 300px;
        text-align: left;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .employee-box:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 18px rgba(0, 0, 0, 0.2);
    }

    .leave-details h3 {
        font-size: 20px;
        margin-bottom: 10px;
    }

    .leave-details p {
        font-size: 14px;
        color: #333;
        margin: 4px 0;
    }

    .buttons {
        display: flex;
        justify-content: space-around;
        margin-top: 15px;
    }

    .button {
        padding: 10px 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 5px;
        transition: background-color 0.3s;
    }

    .button:hover {
        background-color: #45a049;
    }

    .reject-button {
        background-color: #f44336;
    }

    .reject-button:hover {
        background-color: #e53935;
    }

    .material-icons {
        font-size: 18px;
    }

    /* Responsive design */
    @media screen and (max-width: 600px) {
        .employee-box {
            width: 90%;
        }
    }
</style>
</head>
<body>

<h2>Leave Requests</h2>

<div class="container">
    <c:forEach var="leave" items="${list}">
        <div class="employee-box">

            <div class="leave-details">
                <h3><strong>Employee Name:</strong> ${leave.employee.name}</h3>
                <p><strong>Type:</strong> ${leave.leaveType}</p>
                <p><strong>From:</strong> ${leave.startDate}</p>
                <p><strong>To:</strong> ${leave.endDate}</p>
                <p><strong>Reason:</strong> ${leave.leaveReason}</p>
                <p><strong>Status:</strong> ${leave.status}</p>
            </div>

        </div>
    </c:forEach>
</div>

</body>
</html>
