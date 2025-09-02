<%@ page import="java.sql.*" %>
<%
  if(session.getAttribute("adminUser") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>


  <%@ include file="dashboard.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Manage Bookings - Tourly</title>
  <style>
    table { width: 100%; border-collapse: collapse; background: #fff; }
    th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    th { background: #00695c; color: #fff; }
  </style>
</head>
<body>
  <h2>Bookings</h2>
  <table>
    <tr>
      <th>ID</th><th>User ID</th><th>Package</th><th>Date</th><th>People</th><th>Status</th><th>Action</th>
    </tr>
<%
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM bookings");
    while(rs.next()) {
%>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getInt("userId") %></td>
      <td><%= rs.getString("packageName") %></td>
      <td><%= rs.getString("travelDate") %></td>
      <td><%= rs.getString("people") %></td>
      <td><%= rs.getString("status") %></td>
      <td>
        <a href="updateBooking.jsp?id=<%=rs.getInt("id")%>&status=Approved">Approve</a> |
        <a href="updateBooking.jsp?id=<%=rs.getInt("id")%>&status=Rejected">Reject</a>
      </td>
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
