<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Leave Management System</title>
    <style>
        :root {
            --primary-color: #0078d4;
            --hover-color: #005b99;
            --bg-color: #f5f5f5;
            --form-bg: #fff;
            --text-color: #333;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: var(--form-bg);
            width: 100%;
            max-width: 450px;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .title {
            text-align: center;
            font-size: 28px;
            color: var(--primary-color);
            margin-bottom: 20px;
            position: relative;
        }

        .title::after {
            content: "";
            display: block;
            height: 4px;
            width: 60px;
            background-color: var(--primary-color);
            margin: 10px auto 0;
            border-radius: 4px;
        }

        .btn-container {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-bottom: 25px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border-radius: 25px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color var(--transition-speed);
        }

        .btn:hover {
            background-color: var(--hover-color);
        }

        .form-section {
            display: none;
            animation: fadeIn 0.5s;
        }

        .form-section.active {
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: var(--text-color);
            margin-bottom: 6px;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 14px;
            border-radius: 25px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: border-color var(--transition-speed);
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            border-radius: 25px;
            background-color: var(--primary-color);
            border: none;
            font-size: 16px;
            color: white;
            cursor: pointer;
            transition: background-color var(--transition-speed);
        }

        .form-group button:hover {
            background-color: var(--hover-color);
        }

        .footer-links {
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }

        .footer-links a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .btn-container {
                flex-direction: column;
            }
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="title">Employee Leave Management</h1>

    <div class="btn-container">
        <button id="loginBtn" class="btn">Login</button>
        <button id="registerBtn" class="btn">Register</button>
    </div>

    <!-- Login Form -->
    <form id="loginForm" class="form-section active" action="login" method="POST">
        <div class="form-group">
            <label for="loginEmail">Email:</label>
            <input type="email" id="loginEmail" name="email" placeholder="youremail@email.com" required>
        </div>
        <div class="form-group">
            <label for="loginPassword">Password:</label>
            <input type="password" id="loginPassword" name="password" placeholder="Enter your password" required>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
        <div class="footer-links">
            <p>Don't have an account? <a href="#" id="toRegisterPage">Register here</a></p>
        </div>
    </form>

    <!-- Register Form -->
    <form id="registerForm" class="form-section" action="register" method="POST">
        <div class="form-group">
            <label for="registerName">Full Name:</label>
            <input type="text" id="registerName" name="name" placeholder="Enter your full name" required>
        </div>
        <div class="form-group">
            <label for="registerEmail">Email:</label>
            <input type="email" id="registerEmail" name="email" placeholder="youremail@email.com" required>
        </div>
        <div class="form-group">
            <label for="registerPassword">Password:</label>
            <input type="password" id="registerPassword" name="password" placeholder="Create a password" required>
        </div>
        <div class="form-group">
            <label for="registerRole">Select Role:</label>
            <select id="registerRole" name="role" required>
                <option value="employee">Employee</option>
                <option value="hr">Admin</option>
            </select>
        </div>
        <div class="form-group">
            <button type="submit">Register</button>
        </div>
        <div class="footer-links">
            <p>Already have an account? <a href="#" id="toLoginPage">Login here</a></p>
        </div>
    </form>
</div>

<script>
    const loginBtn = document.getElementById("loginBtn");
    const registerBtn = document.getElementById("registerBtn");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const toRegisterPage = document.getElementById("toRegisterPage");
    const toLoginPage = document.getElementById("toLoginPage");

    function showLogin() {
        loginForm.classList.add("active");
        registerForm.classList.remove("active");
    }

    function showRegister() {
        registerForm.classList.add("active");
        loginForm.classList.remove("active");
    }

    loginBtn.addEventListener("click", showLogin);
    registerBtn.addEventListener("click", showRegister);
    toRegisterPage.addEventListener("click", (e) => { e.preventDefault(); showRegister(); });
    toLoginPage.addEventListener("click", (e) => { e.preventDefault(); showLogin(); });
</script>
</body>
</html>