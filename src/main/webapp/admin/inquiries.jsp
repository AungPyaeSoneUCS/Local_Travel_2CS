<%@ page import="java.sql.*" %>
<%
  if(session.getAttribute("adminUser") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Inquiries - Tourly</title>
  <style>
    table { width: 100%; border-collapse: collapse; background: #fff; }
    th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    th { background: #00695c; color: #fff; }
  </style>
</head>
<body>
  <h2>User Inquiries</h2>
  <table>
    <tr>
      <th>ID</th><th>Name</th><th>Email</th><th>Message</th>
    </tr>
<%
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM inquiries");
    while(rs.next()) {
%>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getString("email") %></td>
      <td><%= rs.getString("message") %></td>
    </tr>
<%
    }
    con.close();
  } catch(Exception e) {
    out.println(e.getMessage());
  }
%>
  </table>
</body>
</html>
