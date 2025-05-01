<%@ page language="java" %>
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
            min-height: 100vh;
        }
        
        h2 {
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
        
        pre {
            background-color: #242424;
            border-radius: 5px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
            padding: 35px;
            width: 100%;
            max-width: 800px;
            border-left: 1px solid #3a3a3a;
            border-top: 1px solid #3a3a3a;
            white-space: pre-wrap;
            font-family: 'Libre Baskerville', Georgia, serif;
            font-size: 15px;
            line-height: 1.8;
            overflow-x: auto;
        }
        
        a {
            color: #d4aa70;
            text-decoration: none;
            transition: all 0.2s ease;
            margin-top: 25px;
            display: inline-block;
            font-size: 16px;
        }
        
        a:hover {
            color: #a88c5a;
            text-decoration: underline;
        }
        
        a:before {
            content: '?';
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <h2>Your Book Recommendations</h2>
    <pre>${recommendations}</pre>
    <a href="index.jsp">Back</a>
</body>
</html>