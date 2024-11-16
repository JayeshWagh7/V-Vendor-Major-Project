<%@page import="java.sql.*"%>
<%
    String s1=request.getParameter("u1");
    String s2=request.getParameter("l1");
    String s3=request.getParameter("g1");
    String s4=request.getParameter("m1");
    String s5=request.getParameter("p1");
    
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql:///v_vendor","root","root");
Statement st=con.createStatement();
st.executeUpdate("insert into signup values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");
response.sendRedirect("Login.html");
con.close();
    }
    catch(Exception e1)
    {
    out.println(e1);
    }
   %>