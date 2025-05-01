<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShelfSense</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&display=swap');
        
        body {
            background-color: #1a1a1a;
            color: #e0e0e0;
            font-family: 'Libre Baskerville', Georgia, serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        h1 {
            color: #d4aa70;
            margin-top: 0;
            margin-bottom: 30px;
            text-align: center;
            font-size: 26px;
            font-weight: normal;
            letter-spacing: 1px;
            border-bottom: 1px solid #333;
            padding-bottom: 15px;
        }
        
        form {
            background-color: #242424;
            border-radius: 5px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
            padding: 35px;
            width: 100%;
            max-width: 550px;
            border-left: 1px solid #3a3a3a;
            border-top: 1px solid #3a3a3a;
        }
        
        form br {
            display: none;
        }
        
        form > * {
            margin-bottom: 24px;
            display: block;
        }
        
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #3a3a3a;
            border-radius: 3px;
            background-color: #2a2a2a;
            color: #e0e0e0;
            box-sizing: border-box;
            font-size: 15px;
            transition: all 0.2s ease;
            font-family: 'Libre Baskerville', Georgia, serif;
            margin-top: 8px;
        }
        
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #d4aa70;
        }
        
        input[type="submit"] {
            background-color: #8a6d3b;
            color: #f5f5f5;
            border: none;
            border-radius: 3px;
            padding: 12px 24px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            font-weight: 400;
            transition: all 0.2s ease;
            margin-top: 15px;
            font-family: 'Libre Baskerville', Georgia, serif;
        }
        
        input[type="submit"]:hover {
            background-color: #a88c5a;
        }
        
        p {
            text-align: center;
            margin-top: 20px;
        }
        
        p[style="color:red"] {
            color: #ff6b6b !important;
            background-color: rgba(255, 107, 107, 0.1);
            border-left: 3px solid #ff6b6b;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 3px;
        }
        
        p[style="color:green"] {
            color: #6bff6b !important;
            background-color: rgba(107, 255, 107, 0.1);
            border-left: 3px solid #6bff6b;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 3px;
        }
        
        a {
            color: #d4aa70;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        
        a:hover {
            color: #a88c5a;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Login</h1>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color:red"><%= request.getAttribute("errorMessage") %></p>
    <% } %>
    <% if (request.getAttribute("successMessage") != null) { %>
        <p style="color:green"><%= request.getAttribute("successMessage") %></p>
    <% } %>
    <form action="login" method="post">
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <p>Don't have an account? <a href="register.jsp">Register</a></p>
</body>
</html>