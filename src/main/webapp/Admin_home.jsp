<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession s = request.getSession();
    String email = (String) s.getAttribute("email");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - ELMS</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            color: #333;
        }

        .navbar {
            background-color: #0078d4;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 16px;
            background-color: #005b99;
            border-radius: 5px;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #00487c;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .greeting {
            text-align: center;
            margin-bottom: 30px;
        }

        .greeting h2 {
            font-size: 26px;
            margin-bottom: 10px;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .action-card {
            background-color: #e3f2fd;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        .action-card a {
            text-decoration: none;
            font-size: 18px;
            color: #0078d4;
            font-weight: bold;
        }

        .footer {
            margin-top: 50px;
            text-align: center;
            font-size: 14px;
            color: #888;
        }

        @media (max-width: 600px) {
            .navbar h1 {
                font-size: 18px;
            }

            .container {
                margin: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <h1>Admin Dashboard</h1>
        <a href="logout">Logout</a>
    </div>

    <div class="container">
        <div class="greeting">
            <h2>Welcome, <%= email %>!</h2>
            <p>Manage employee leave requests effectively using the options below.</p>
        </div>

        <div class="actions">
            <div class="action-card">
                <a href="allRequest">📄 View All Requests</a>
            </div>
            <div class="action-card">
                <a href="ApproveLeaves">✅ Approved Requests</a>
            </div>
            <div class="action-card">
                <a href="rejectedLeaves">❌ Rejected Requests</a>
            </div>
        </div>
    </div>

    <div class="footer">
        2025 Employee Leave Management System | Admin Panel
    </div>

</body>
</html>
