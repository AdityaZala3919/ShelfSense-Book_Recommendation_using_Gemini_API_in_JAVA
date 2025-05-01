<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ajava.shelfsense.UserInput" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
            padding: 40px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
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
            width: 100%;
            max-width: 800px;
        }
        
        p {
            text-align: center;
            margin: 20px 0;
        }
        
        p[style="color:red"] {
            color: #ff6b6b !important;
            background-color: rgba(255, 107, 107, 0.1);
            border-left: 3px solid #ff6b6b;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 3px;
            width: 100%;
            max-width: 800px;
            box-sizing: border-box;
        }
        
        a {
            color: #d4aa70;
            text-decoration: none;
            transition: all 0.2s ease;
            margin-bottom: 30px;
            display: inline-block;
        }
        
        a:hover {
            color: #a88c5a;
            text-decoration: underline;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            background-color: #242424;
            border-radius: 5px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
            overflow: hidden;
            margin-top: 20px;
        }
        
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #333;
        }
        
        th {
            background-color: #2a2a2a;
            color: #d4aa70;
            font-weight: normal;
            letter-spacing: 1px;
        }
        
        tr:hover {
            background-color: #2c2c2c;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <h1>Your Book Preference History</h1>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color:red"><%= request.getAttribute("errorMessage") %></p>
    <% } %>
    
    <a href="index.jsp">Back to Recommendation Form</a>
    
    <% 
    List<UserInput> inputs = (List<UserInput>) request.getAttribute("inputs");
    if (inputs != null && !inputs.isEmpty()) { 
        SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm");
    %>
        <table border="1">
            <tr>
                <th>Date</th>
                <th>Genre</th>
                <th>Favorite Author</th>
                <th>Purpose</th>
                <th>Preferred Era</th>
                <th>Reading Length</th>
            </tr>
            <% for (UserInput input : inputs) { %>
                <tr>
                    <td><%= dateFormat.format(input.getSubmittedAt()) %></td>
                    <td><%= input.getGenre() %></td>
                    <td><%= input.getFavoriteAuthor() != null ? input.getFavoriteAuthor() : "" %></td>
                    <td><%= input.getPurpose() %></td>
                    <td><%= input.getPreferredEra() %></td>
                    <td><%= input.getReadingLength() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>No history found.</p>
    <% } %>
</body>
</html>