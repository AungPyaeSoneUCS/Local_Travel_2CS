<%@ page import="java.sql.*" %>
<%
  // Redirect if not logged in as admin
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
    body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 20px; }
    h2 { color: #00695c; }
    table { width: 100%; border-collapse: collapse; background: #fff; margin-top: 20px; }
    th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    th { background: #00695c; color: #fff; }
    a { color: #11111; text-decoration: none; font-weight: bold; }
    a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <h2>Bookings</h2>
  <table>
    <tr>
      <th>ID</th>
      <th>User Name</th>
      <th>Package</th>
      <th>Date</th>
      <th>People</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
<%
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
    Statement st = con.createStatement();

    // Query with JOIN to fetch user name
    String query = "SELECT b.id, b.userId, u.name AS userName, b.packageName, b.travelDate, b.people, b.status " +
                   "FROM bookings b " +
                   "JOIN users u ON b.userId = u.id";

    ResultSet rs = st.executeQuery(query);
    while(rs.next()) {
%>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("userName") %></td>
      <td><%= rs.getString("packageName") %></td>
      <td><%= rs.getString("travelDate") %></td>
      <td><%= rs.getInt("people") %></td>
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
    out.println("<tr><td colspan='7' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
  }
%>
  </table>
</body>
</html>
