<%@page import="java.sql.*"%>
<%
    String s[] = (String[]) session.getAttribute("vegetableList");
    String s11 = (String) session.getAttribute("u1");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sell jsp</title>
    <link rel="stylesheet" href="Jspsell.css"> <!-- Link to external CSS -->
</head>
<body>
    <nav>
        <ul class="sidebar">
            <li onclick="hidesidebar()"><a href="#"><img src="close11.png" width="40px" height="40px"></a></li>
            <li id="home"><a href="#">Home</a></li>
            <li id="login"><a href="#">Login</a></li>
            <li id="registration"><a href="#">Registration</a></li>
            <li id="option"><a href="#">Option</a></li>
            <li><a href="#">Help</a></li>
            <li id="back"><a href="#">Back</a></li>
        </ul>
        <ul>
            <li><a href="#">V-vendor</a></li>
            <li class="menu-button" onclick="showsidebar()"><a href="#"><img src="threeline.png" class="img1" id="threeline"></a></li>
        </ul>
    </nav>

    <div>
        <form onsubmit="return data()" action="sell1.jsp" method="post">
            <% for (String s1 : s) { %>
                <input type="hidden" name="vegetables" value="<%= s1 %>"/>
                <h3><%= s1 %></h3>
                <p>Add quantity and Price:</p>
                <label for="number-select">Quantity</label>
                <select class="s1" id="number-select" name="number">
                    <% for (int i = 10; i <= 50; i++) { %>
                        <option value="<%= i %>"><%= i %> Kg</option>
                    <% } %>
                </select><br>
                <label>Price in Rupees: </label>
                <input class="t1" type="number" id="t" name="r1" placeholder="In Rupees"><br>
            <% } %>
            <input class="b11" type="submit" value="Add Items" style="background-color: #619eb9; border:none; margin-top:20px; color: white; padding: 10px 20px; border-radius: 5px; font-size: 16px;">

        </form>
    </div>

    <script>
        function data() {
            let x = document.getElementById('t').value;
            if (x === "") {
                alert("Enter Your Item's Price");
                return false;
            } else {
                return true;
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
         document.getElementById('registration').addEventListener('click', function() {
            window.location.href = 'SignUp.html';
        });
        document.getElementById('home').addEventListener('click', function() { // Fixed typo here
            window.location.href = 'index.html';
        });
        document.getElementById('login').addEventListener('click', function() {
            window.location.href = 'Login.html';
        });
         document.getElementById('option').addEventListener('click', function() {
            window.location.href = 'option.html';
        });
         document.getElementById('back').addEventListener('click', function() {
            window.location.href = 'sell.html';
        });
    </script>
</body>
</html>
