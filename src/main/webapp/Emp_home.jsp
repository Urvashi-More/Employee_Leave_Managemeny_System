<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession s = request.getSession();
    String name = (String) s.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard - ELMS</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #e1f5fe;
            color: #333;
        }

        .navbar {
            background-color: #0288d1;
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
            background-color: #0277bd;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .navbar a:hover {
            background-color: #01579b;
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
            background-color: #b3e5fc;
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
            color: #0288d1;
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
                padding: 20px;
            }

            .greeting h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

    <!-- Top Navigation Bar -->
    <div class="navbar">
        <h1>Employee Dashboard</h1>
        <a href="logout"> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="greeting">
            <h2>Welcome, <%= name %>!</h2>
            <p>Manage your leaves efficiently with the options below.</p>
        </div>

        <div class="actions">
            <div class="action-card">
                <a href="leave.jsp">📝 Apply for Leave</a>
            </div>
            <div class="action-card">
                <a href="AllLeaves">📄 View My Leave Status</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        Employee Leave Management System | Employee Panel
    </div>

</body>
</html>
