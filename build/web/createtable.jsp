<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%   
    String[] s = request.getParameterValues("vegetables");
    
    String s11 = (String) session.getAttribute("u1");
  
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql:///v_vendor", "root", "root");
        Statement st = con.createStatement();
        
        st.executeUpdate("DROP TABLE IF EXISTS " + s11);

        st.executeUpdate("CREATE TABLE " + s11 + " (User_name VARCHAR(30),Vegetable_name varchar(30), Quantity VARCHAR(30), Price VARCHAR(30))");
//       for (int i = 0; i < s.length; i++) {
//    // Create the table if it doesn't exist with the specified structure
//    
//    if(st.executeUpdate("CREATE TABLE IF NOT EXISTS " + s[i] + " ){ 
//    st.executeUpdate("DELETE FROM " + s[i] + " WHERE User_name = '" + s11 + "'"); 
//    }
//    else{
//    st.executeUpdate("CREATE TABLE IF NOT EXISTS " + s[i] + " (User_name VARCHAR(30), Vegetable_name VARCHAR(30), Quantity VARCHAR(30), Price VARCHAR(30))");
//} 
//    }
for (int i = 0; i < s.length; i++) {
    // Check if the table exists
    ResultSet rs = st.executeQuery("SHOW TABLES LIKE '" + s[i] + "'");

    if (rs.next()) {
        // If the table exists, run the DELETE query
        st.executeUpdate("DELETE FROM " + s[i] + " WHERE User_name = '" + s11 + "'");
    } else {
        // If the table does not exist, run the CREATE TABLE query
        st.executeUpdate("CREATE TABLE " + s[i] + " (User_name VARCHAR(30), Vegetable_name VARCHAR(30), Quantity VARCHAR(30), Price VARCHAR(30))");
    }
}

        session.setAttribute("vegetableList", s);
        
        response.sendRedirect("sell.jsp");
        con.close();
    } catch (Exception e1) {
        out.println(e1);
    }
%>
