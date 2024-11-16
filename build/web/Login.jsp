<%@page import="java.sql.*"%>
<%
    String s1=request.getParameter("u1");
    String s2=request.getParameter("p1");
    %>
    <form action="sell1.jsp" method="post">
        <input type="hidden" name="u1" value="<%= s1 %>"/>
    </form>
    <%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql:///v_vendor","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from signup where first_name = '"+s1+"' AND create_password = '"+s2+"'");
if(rs.next())
{
session.setAttribute("u1", s1);
response.sendRedirect("option.html");
    }
   else{
           response.sendRedirect("Login.html");
           }
           con.close();
    }
    catch(Exception e1)
    {
    out.println(e1);
    }
    %>
    