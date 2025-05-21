<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank You</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .thankyou-box {
            background-color: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .thankyou-box h2 {
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .thankyou-box p {
            color: #555;
            font-size: 16px;
        }

        .btn-back {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-back:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="thankyou-box">
        <h2>Thank You!</h2>
        <p>Your leave request has been submitted successfully and is currently pending approval.</p>
        <a href="homePage" class="btn-back">Back to Home</a>
    </div>

</body>
</html>
