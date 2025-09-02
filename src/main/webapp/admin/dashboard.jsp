<%@ page contentType="text/html;charset=UTF-8" %>
<%
  if(session.getAttribute("adminUser") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard - Tourly</title>
  <style>
    body { font-family: Arial; background: #f4f7f6; padding: 20px; }
    h1 { color: #00695c; }
    a { display: inline-block; margin: 10px; padding: 10px 15px; background: #00695c; color: #fff; border-radius: 6px; text-decoration: none; }
    a:hover { background: #004d40; }
  </style>
</head>
<body>
  <h1>Welcome, <%= session.getAttribute("adminUser") %></h1>
  <a href="index.jsp">Manage Bookings</a>
  <a href="packages.jsp">Manage Packages</a>
  <a href="logout.jsp">Logout</a>
</body>
</html>
