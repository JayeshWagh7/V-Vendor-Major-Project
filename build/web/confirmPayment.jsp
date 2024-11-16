<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Get parameters from the request
    String username = request.getParameter("username");
    String vegetable = request.getParameter("vegetable");
    String quantity = request.getParameter("quantity");
    String totalPrice = request.getParameter("totalPrice");
    String price = request.getParameter("price");

    // Here you can add logic to process the payment
    // For demonstration purposes, we'll just confirm the payment
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            max-width: 300px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        p {
            margin: 10px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
        @media (max-width: 600px) {
            body {
                padding: 10px;
            }
            .container {
                padding: 15px;
            }
        }
    </style>
     <link rel="stylesheet" href="buy1.css">
</head>
<body>
    
      <nav>
        <ul class="sidebar">
            <li onclick="hidesidebar()"><a href="#"><img src="close11.png" width="40px" height="40px"></a></li>
            <li id="home"><a href="#">Home</a></li>
            <li id="login"><a href="#">Login</a></li>
            <li id="option"><a href="#">option</a></li>
            <li id="logout"><a href="#">Log out</a></li>
           
        </ul>
        <ul>
            <li><a href="#">V-vendor</a></li>
            <li class="menu-botton" onclick="showsidebar()"><a href="#"><img src="threeline.png" class="img1" id="threeline"></a></li>
        </ul>
    </nav>
    <div class="container">
        <h1>Payment Confirmation</h1>
        <p><strong>User Name:</strong> <%= username %></p>
        <p><strong>Vegetable:</strong> <%= vegetable %></p>
        <p><strong>Selected Quantity:</strong> <%= quantity %></p>
        <p><strong>Price per kg:</strong> <%= price %> rupees</p>
        <p><strong>Total Price:</strong> <%= totalPrice %> rupees</p>

        <h2>Confirm Payment</h2>
        <form method="post" action="processPayment.jsp">
            <input type="hidden" name="username" value="<%= username %>">
            <input type="hidden" name="vegetable" value="<%= vegetable %>">
            <input type="hidden" name="quantity" value="<%= quantity %>">
            <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
            <button type="submit">Confirm Payment</button>
        </form>

        <button onclick="window.history.back();">Cancel</button>
    </div>
            <script>
                 function showsidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.style.display = 'flex';
        }
        function hidesidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.style.display = 'none';
        }
        document.getElementById('option').addEventListener('click',function(){
            window.location='option.html';
        });
         document.getElementById('login').addEventListener('click',function(){
            window.location='Login.html';
        });
        document.getElementById('logout').addEventListener('click',function(){
            window.location='SignUp.html';
        });
        </script>
</body>
</html>
