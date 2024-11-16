<%@page import="java.sql.*"%>
<%
    String s1=request.getParameter("u1");
    String s2=request.getParameter("p1");
    try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql:///v_vendor","root","root");
    Statement st=con.createStatement();
    st.executeUpdate("update signup set create_password= '"+s2+"' where first_name='"+s1+"' ");
    response.sendRedirect("Login.html");
    con.close();
    }
    catch(Exception e1)
    {
    out.println(e1);
    }
%>