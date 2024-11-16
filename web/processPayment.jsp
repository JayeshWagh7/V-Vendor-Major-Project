    <%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
    <%@ page import="java.sql.*" %>
    <%
        // Get parameters from the request
        String username = request.getParameter("username");
        String vegetable = request.getParameter("vegetable");
        String quantity = request.getParameter("quantity");
        String totalPrice = request.getParameter("totalPrice");
        String totalquantity =(String) session.getAttribute("quantity");

        int x=Integer.parseInt(quantity);
        int y=Integer.parseInt(totalquantity);
        int z=y-x;
        
       
  
        boolean paymentSuccess = true; // Simulate payment processing

        // Database transaction simulation (add your own logic here)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/v_vendor", "root", "root");;
            Statement st = con.createStatement();
            if(z!=0)
            st.executeUpdate("UPDATE carrot SET Quantity = " + z + " WHERE User_name = '" + username + "'");
            else st.executeUpdate("delete from "+vegetable+" WHERE User_name = '" + username + "'");
            con.close();
            
        } catch (Exception e) {
            out.println(e);
        }
    %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Result</title>
    </head>
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
    <body>
        <h1>Payment Result</h1>
        <p><strong>User Name:</strong> <%= username %></p>
        <p><strong>Vegetable:</strong> <%= vegetable %></p>
        <p><strong>Total Price:</strong> <%= totalPrice %> rupees</p>

        <%
            if (paymentSuccess) {
        %>
            <h2>Payment Successful!</h2>
            <p>Thank you for your purchase!</p>
            <p>Your order has been processed successfully.</p>
        <%
            } else {
        %>
            <h2>Payment Failed!</h2>
            <p>There was an issue processing your payment. Please try again.</p>
        <%
            }
        %>

        <button onclick="window.location.href='buy.html';">Go To Option</button>
    </body>
    </html>
