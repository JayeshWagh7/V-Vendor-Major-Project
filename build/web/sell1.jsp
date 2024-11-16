<%@page import="java.sql.*"%>
<%
       String vegetable[] = request.getParameterValues("vegetables");

        String s3[]=request.getParameterValues("number");
        String s4[]=request.getParameterValues("r1");
        String s = (String) session.getAttribute("u1");
       
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///v_vendor","root","root");
        Statement st=con.createStatement();
         for(int i=0;i<s3.length;i++)
        {
        st.executeUpdate("insert into "+s+" values('"+s+"','"+vegetable[i]+"','"+s3[i]+"','"+s4[i]+"')");
        st.executeUpdate("insert into "+vegetable[i]+" values('"+s+"','"+vegetable[i]+"','"+s3[i]+"','"+s4[i]+"')");
        }
        response.sendRedirect("ShowAll.jsp");
        con.close();
 
  }
  catch(Exception e1)
  {
  out.println(e1);
}
         
        %>