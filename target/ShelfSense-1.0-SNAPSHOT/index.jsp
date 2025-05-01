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
            align-items: center;
            min-height: 100vh;
            padding-top: 40px;
        }
        
        .container {
            background-color: #242424;
            border-radius: 5px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
            padding: 35px;
            width: 100%;
            max-width: 550px;
            border-left: 1px solid #3a3a3a;
            border-top: 1px solid #3a3a3a;
            margin-bottom: 40px;
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
        
        label, form select, form input[type="text"] {
            display: block;
            width: 100%;
            box-sizing: border-box;
        }
        
        select, input[type="text"] {
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
        
        input[type="text"]:focus,
        select:focus {
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
            margin-bottom: 20px;
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
        
        .nav-links {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 550px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <% 
    String email = (String) session.getAttribute("email");
    if (email != null) { 
    %>
        <p>Welcome, <%= email %>! <a href="logout">Logout</a></p>
        <a href="history">View History</a>
    <% } else { %>
        <p><a href="login.jsp">Login</a> or <a href="register.jsp">Register</a></p>
    <% } %>
    
    <h1>Book Recommendation Form</h1>
    <form action="recommend" method="post">
        Genre: <input type="text" name="genre" required><br>
        Favorite Author: <input type="text" name="author"><br>
        Purpose: 
        <select name="purpose" required>
            <option value="Entertainment">Entertainment</option>
            <option value="Education">Education</option>
            <option value="Research">Research</option>
            <option value="learning">Learning</option>
            <option value="self-improvement">Self-Improvement</option>
            <option value="relaxation">Relaxation</option>
            <option value="exploration">Exploration of new ideas</option>
        </select><br>
        Preferred Book Era:
        <select name="era" required>
            <option value="Modern">Modern (2000s+)</option>
            <option value="20th Century">20th Century</option>
            <option value="Victorian">Victorian</option>
            <option value="Medieval">Medieval</option>
            <option value="Ancient">Ancient/Classical</option>
        </select><br>
        Reading Length Preference:
        <select name="length" required>
            <option value="Short Stories">Short Stories</option>
            <option value="Novels">Novels</option>
            <option value="Epics">Epics</option>
            <option value="Novellas">Novellas</option>
            <option value="Poetry">Poetry</option>
        </select><br>
        <input type="submit" value="Get Recommendations">
    </form>
</body>
</html>