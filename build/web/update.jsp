<%@page import="java.sql.*"%>
<%
    String s1=(String)session.getAttribute("u1");
    
    String s2=request.getParameter("v1");
    String s3=request.getParameter("q1");
    String s4=request.getParameter("r1");
    
try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql:///v_vendor","root","root");
Statement st=con.createStatement();
st.executeUpdate("UPDATE " + s1 + " SET Quantity = " + s3 + ", Price = " + s4 + " WHERE Vegetable_name = '" + s2 + "'");
st.executeUpdate("UPDATE " + s2 + " SET Quantity = " + s3 + ", Price = " + s4 + " WHERE Vegetable_name = '" + s2 + "'");
 response.sendRedirect("ShowAll.jsp");
con.close();
    }
    catch(Exception e)
    {
    out.println(e);
    }
    %>