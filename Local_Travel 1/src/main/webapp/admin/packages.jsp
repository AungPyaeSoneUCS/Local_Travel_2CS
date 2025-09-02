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
  <title>Manage Packages - Tourly</title>
  <style>
    table { width: 100%; border-collapse: collapse; background: #fff; margin-top: 20px; }
    th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    th { background: #00695c; color: #fff; }
    form { margin: 20px 0; }
    input, textarea { padding: 8px; margin: 5px; border-radius: 6px; border: 1px solid #ccc; width: 250px; }
    button { padding: 8px 15px; background: #00695c; color: #fff; border: none; border-radius: 6px; cursor: pointer; }
    button:hover { background: #004d40; }
  </style>
</head>
<body>
  <h2>Manage Packages</h2>

  <!-- Add Package Form -->
  <form method="post">
    <input type="hidden" name="action" value="add">
    <input type="text" name="name" placeholder="Package Name" required>
    <input type="text" name="price" placeholder="Price (MMK)" required><br>
    <textarea name="description" placeholder="Description" required></textarea><br>
    <button type="submit">Add Package</button>
  </form>

<%
  request.setCharacterEncoding("UTF-8");
  String action = request.getParameter("action");

  if("add".equals(action)) {
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String desc = request.getParameter("description");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
      PreparedStatement ps = con.prepareStatement("INSERT INTO packages(name, price, description) VALUES(?,?,?)");
      ps.setString(1, name);
      ps.setString(2, price);
      ps.setString(3, desc);
      ps.executeUpdate();
      con.close();
      out.println("<p style='color:green;'>Package added successfully!</p>");
    } catch(Exception e) {
      out.println("<p style='color:red;'>" + e.getMessage() + "</p>");
    }
  } else if("delete".equals(action)) {
    String id = request.getParameter("id");
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
      PreparedStatement ps = con.prepareStatement("DELETE FROM packages WHERE id=?");
      ps.setInt(1, Integer.parseInt(id));
      ps.executeUpdate();
      con.close();
      out.println("<p style='color:green;'>Package deleted successfully!</p>");
    } catch(Exception e) {
      out.println("<p style='color:red;'>" + e.getMessage() + "</p>");
    }
  } else if("edit".equals(action)) {
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String desc = request.getParameter("description");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
      PreparedStatement ps = con.prepareStatement("UPDATE packages SET name=?, price=?, description=? WHERE id=?");
      ps.setString(1, name);
      ps.setString(2, price);
      ps.setString(3, desc);
      ps.setInt(4, Integer.parseInt(id));
      ps.executeUpdate();
      con.close();
      out.println("<p style='color:green;'>Package updated successfully!</p>");
    } catch(Exception e) {
      out.println("<p style='color:red;'>" + e.getMessage() + "</p>");
    }
  }
%>

  <!-- Packages Table -->
  <table>
    <tr>
      <th>ID</th><th>Name</th><th>Price</th><th>Description</th><th>Actions</th>
    </tr>
<%
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM packages");
    while(rs.next()) {
%>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getString("price") %></td>
      <td><%= rs.getString("description") %></td>
      <td>
        <!-- Edit Form -->
        <form method="post" style="display:inline-block;">
          <input type="hidden" name="action" value="edit">
          <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
          <input type="text" name="name" value="<%= rs.getString("name") %>" required>
          <input type="text" name="price" value="<%= rs.getString("price") %>" required>
          <input type="text" name="description" value="<%= rs.getString("description") %>" required>
          <br>
          <button type="submit">Update</button>
        </form>
        <!-- Delete Form -->
        <form method="post" style="display:inline-block;" onsubmit="return confirm('Are you sure?');">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
          <button type="submit" style="background:#d32f2f;">Delete</button>
        </form>
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
