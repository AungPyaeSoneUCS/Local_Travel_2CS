<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Bookings - Tourly Travel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    body { font-family: Arial, sans-serif; margin: 0; background: #f4f7f6; }
    h1 { text-align: center; padding: 20px; color: #00695c; }

    .container { max-width: 1000px; margin: auto; padding: 20px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; background: #fff; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
    th, td { padding: 12px; border-bottom: 1px solid #ddd; text-align: center; }
    th { background: #00695c; color: #fff; }
    tr:hover { background: #f1f1f1; }

    .status { padding: 6px 10px; border-radius: 5px; color: #fff; font-weight: bold; }
    .pending { background: #ff9800; }
    .approved { background: #4caf50; }
    .rejected { background: #f44336; }
  </style>
</head>
<body>

<%@ include file="header.jsp" %>

<h1>My Bookings</h1>
<div class="container">

<%
  Integer userId = (Integer) session.getAttribute("userId");
  if(userId == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly", "root", "root");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE userId=? ORDER BY travelDate DESC");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();

    if(!rs.isBeforeFirst()) {
      out.println("<p style='text-align:center;color:#666;'>You have no bookings yet. <a href=\"packages.jsp\">Book a package</a>.</p>");
    } else {
%>
      <table>
        <tr>
          <th>Package</th>
          <th>Price (MMK)</th>
          <th>Travel Date</th>
          <th>People</th>
          <th>Status</th>
        </tr>
<%
      while(rs.next()) {
        String status = rs.getString("status");
        String cssClass = "";
        if("Pending".equalsIgnoreCase(status)) cssClass = "pending";
        else if("Approved".equalsIgnoreCase(status)) cssClass = "approved";
        else cssClass = "rejected";
%>
        <tr>
          <td><%= rs.getString("packageName") %></td>
          <td><%= rs.getString("price") %></td>
          <td><%= rs.getString("travelDate") %></td>
          <td><%= rs.getInt("people") %></td>
          <td><span class="status <%= cssClass %>"><%= status %></span></td>
        </tr>
<%
      } // end while
%>
      </table>
<%
    }
    con.close();
  } catch(Exception e) {
    out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
  }
%>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
