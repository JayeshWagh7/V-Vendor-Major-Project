<%@ page import="java.sql.*"%>
<%
    String s = (String) session.getAttribute("u1");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShowAll Jsp</title>
     <link rel="stylesheet" href="ShowAll1.css"> 
</head>
<body>
    <nav>
        <ul class="sidebar">
              <li onclick="hidesidebar()"><a href="#"><img src="close11.png" width="40px" height="40px"></a></li>
            <li><a href="#">Home</a></li>
            <li><a href="#">Login</a></li>
            <li><a href="#">Registration</a></li>
            <li id="selection"><a href="#">Selection</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Help</a></li>
            <li id="back"><a href="#">Back</a></li>
        </ul>
        <ul>
            <li><a href="#">V-vendor</a></li>
            <li class="menu-button" onclick="showsidebar()"><a href="#"><img src="threeline.png" width="40px" height="40px" ></a></li>
        </ul>
    </nav>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:///v_vendor", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select d.User_name, d.Vegetable_name, d.Quantity, d.Price, s.mobile_number from " + s + " as d inner join signup as s on d.User_name=s.first_name");
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
                        </tr>
                    <% } %>
                </table>
                <button onclick="window.history.back();">Back</button>
                <button id="option">Option</button>
                <button onclick="window.location.href='update1.jsp';">Update</button>
            </div>
    <%
        } catch (Exception e1) {
            out.println(e1);
        }
    %>

    <script>
        document.getElementById('back').addEventListener('click',function(){
            window.location='Login.html';
        });
         document.getElementById('option').addEventListener('click',function(){
            window.location='option.html';
        });
         document.getElementById('selection').addEventListener('click',function(){
            window.location='option.html';
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
</body>
</html>
