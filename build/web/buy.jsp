<%@ page import="java.sql.*"%>
<%
     String s = request.getParameter("vegetable");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy JsP page</title>
   <link rel="stylesheet" href="buy1.css">
</head>
<body>
    <form method="post">
    <nav>
        <ul class="sidebar">
            <li onclick="hidesidebar()"><a href="#"><img src="close11.png" width="40px" height="40px"></a></li>
            <li id="home"><a href="#">Home</a></li>
            <li id="login"><a href="#">Login</a></li>
            <li id="option"><a href="#">Option</a></li>
           
            <li><a href="#">About</a></li>
            <li id="logout"><a href="#">Log Out</a></li>
            <li id="back"><a href="#">Back</a></li>
        </ul>
        <ul>
            <li><a href="#">V-vendor</a></li>
            <li class="menu-button" onclick="showsidebar()"><a href="#"><img src="threeline.png" class="img1" id="threeline"></a></li>
        </ul>
    </nav>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:///v_vendor", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT t1.User_name, t1.Vegetable_name, t1.Quantity, t1.Price, s.mobile_number " +
                                            "FROM " + s + " t1 " +
                                            "JOIN signup s ON t1.user_name = s.first_name " +
                                            "ORDER BY CAST(t1.Price AS DECIMAL) ASC;");

    %>
            <div>
                <table cellpadding="12">
                    <tr>
                        <th>User Name</th>
                        <th>Vegetable</th>
                        <th>Quantity (kg)</th>
                        <th>Price (rupees)</th>
                        <th>Mobile Number</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td>
                            <form method="post" action="payment.jsp">
                                <input type="hidden" name="username" value="<%= rs.getString(1) %>">
                                <input type="hidden" name="vegetable" value="<%= rs.getString(2) %>">
                                <input type="hidden" name="quantity" value="<%= rs.getString(3) %>">
                                <% session.setAttribute("quantity", rs.getString(3)); %>
                                <input type="hidden" name="price" value="<%= rs.getString(4) %>">
                                <button type="submit" onclick="console.log('Button clicked for: <%= rs.getString(1) %>');">Buy</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </table>
                
            </div>
    <%
        } catch (Exception e1) {
            out.println(e1);
        }
    %>

    <script>
        document.getElementById('back').addEventListener('click', function() {
            window.location = 'buy.html';
        });
 document.getElementById('option').addEventListener('click',function(){
            window.location='option.html';
        });
         document.getElementById('login').addEventListener('click',function(){
            window.location='Login.html';
        });
        document.getElementById('logout').addEventListener('click',function(){
            window.location='SignUp.html';
        });
         document.getElementById('home').addEventListener('click',function(){
             window.location.href='index.html';
         });
       

        function showsidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.style.display = 'flex';
        }

        function hidesidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.style.display = 'none';
        }
    </script>
    </form>
</body>
</html>
