<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Get parameters from the request
    String username = request.getParameter("username");
    String vegetable = request.getParameter("vegetable");
    String quantity = request.getParameter("quantity");
    String price = request.getParameter("price");

    double totalPrice = 0;
    if (quantity != null && price != null) {
        totalPrice = Double.parseDouble(price) * Integer.parseInt(quantity);
    }
    int quantityInt = Integer.parseInt(quantity);

    // Store the quantity in session
    session.setAttribute("quantity", quantityInt);
    session.setAttribute("quantity", quantity);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Jsp</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            margin-top:-30px;
            padding: 20px;
            background-color: #c9c5ba;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select, input[type="number"], button {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
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
        <h1>Payment Details</h1>
        <p><strong>User Name:</strong> <%= username %></p>
        <p><strong>Vegetable:</strong> <%= vegetable %></p>
        <p><strong>Total Quantity:</strong> <%= quantity != null ? quantity + " kg" : "Select Quantity" %></p>
        
        <label for="quantity">Select Quantity (10 kg - <%= quantity %> kg):</label>
        <select name="quantity" id="quantity" required onchange="updateTotalPrice()">
            <option value="">Select Quantity</option>
            <%
                for (int i = 10; i <= quantityInt; i++) {
                    String selected = (quantity != null && quantity.equals(String.valueOf(i))) ? "selected" : "";
                    out.println("<option value='" + i + "' " + selected + ">" + i + " kg</option>");
                }
            %>
        </select>

        <p><strong>Price per kg:</strong> <%= price != null ? price : "0" %> rupees</p>
        <p><strong>Total Price:</strong> <span id="totalPrice"><%= totalPrice %></span> rupees</p>

        <form method="post" action="confirmPayment.jsp">
            <input type="hidden" name="username" value="<%= username %>">
            <input type="hidden" name="vegetable" value="<%= vegetable %>">
            <input type="hidden" name="quantity" id="hiddenQuantity" value="<%= quantityInt %>">
            <input type="hidden" name="price" value="<%= price %>">
            <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="<%= totalPrice %>">
            <label for="account1">Pay Amount</label>
           
            <button type="submit">Pay</button>
        </form>

        <button onclick="window.history.back();">Back</button>
    </div>

    <script>
        function updateTotalPrice() {
            const quantity = document.getElementById('quantity').value;
            const priceValue = <%= price != null ? price : 0 %>; // Ensure price is a number
            
            // Check if quantity is selected
            if (quantity) {
                const totalPrice = quantity * priceValue;

                document.getElementById('totalPrice').innerText = totalPrice;
                document.getElementById('hiddenTotalPrice').value = totalPrice;
                document.getElementById('hiddenQuantity').value = quantity;
                document.getElementById('account1').value = totalPrice; // Update pay amount
            } else {
                document.getElementById('totalPrice').innerText = "0";
                document.getElementById('account1').value = "0"; // Reset if no quantity selected
            }
        }
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
