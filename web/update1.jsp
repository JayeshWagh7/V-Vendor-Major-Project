
<%@ page import="java.sql.*"%>
<%
    String s = (String) session.getAttribute("u1");
    %>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .table {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                width: 90%; /* Flexible width */
                display:inline-block;
                max-width: 800px; /* Maximum width for larger screens */
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #007BFF;
                color: white;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            button {
                margin-top: 20px;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                background-color: #007BFF;
                color: white;
            }
            button:hover {
                background-color: #0056b3;
            }
            @media (max-width: 600px) {
                th, td {
                    padding: 8px; /* Adjust padding for smaller screens */
                }
                div {
                    padding: 10px; /* Adjust padding for smaller screens */
                }
            }
            .update{
                margin-top:10px;
                margin-left: 100px;
            }
        </style>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql:///v_vendor", "root", "root");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select d.User_name, d.Vegetable_name, d.Quantity, d.Price, s.mobile_number from "+s+" as d inner join signup as s on d.User_name=s.first_name");
        %>
            <div class="table">
                <table cellpadding="12">
                   <tr>
                       <th>User Name</th>
                       <th>Vegetable</th>
                       <th>Quantity (kg)</th>
                       <th>Price (rupees)</th>
                       <th>Mobile Number</th>
                   </tr>
                   <% while(rs.next()) { %>
                   <tr>
                       <td><%= rs.getString(1) %></td>
                       <td><%= rs.getString(2) %></td>
                       <td><%= rs.getString(3) %></td>
                       <td><%= rs.getString(4) %></td>
                       <td><%= rs.getString(5) %></td>
                   </tr>
                   <% } %>
                </table>
                <button onclick="window.history.back();">Back</button>
                
            </div>
        <%
            } catch (Exception e1) {
                out.println(e1);
            }
        %>
        
        
 

        <div class="update">
    <h1>Update</h1>
    <form action="update.jsp">
        <label for="vegName">Vegetable Name:</label><br>
        <input type="text" id="vegName" name="v1"  required><br><br>

        <label for="quantity">Quantity:</label><br>
        <input type="number" id="quantity" name="q1"  required><br><br>

        <label for="price">Price:</label><br>
        <input type="number" id="price" name="r1"  required><br><br>

        <button>update</button>
    </form><!-- < -->
        </div>
</body>
</html>
