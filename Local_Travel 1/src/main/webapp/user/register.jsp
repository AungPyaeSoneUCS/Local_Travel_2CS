<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Register - Tourly Travel</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f0f4f7; }
    .form-container { max-width: 400px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
    h2 { text-align: center; color: #00695c; }
    input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 6px; }
    button { background: #00695c; color: #fff; padding: 10px; border: none; border-radius: 6px; cursor: pointer; width: 100%; }
    button:hover { background: #004d40; }
    a { display: block; text-align: center; margin-top: 15px; }
  </style>
</head>
<body>
<div class="form-container">
  <h2>User Register</h2>
  <form method="post">
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="text" name="phone" placeholder="Phone" required>
    <button type="submit">Register</button>
  </form>
  <a href="login.jsp">Already have an account? Login</a>
</div>

<%
  if(request.getMethod().equalsIgnoreCase("POST")) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly", "root", "root");
      PreparedStatement ps = con.prepareStatement("INSERT INTO users(name,email,password,phone,role) VALUES(?,?,?,?,?)");
      ps.setString(1, name);
      ps.setString(2, email);
      ps.setString(3, password);
      ps.setString(4, phone);
      ps.setString(5, "user");
      ps.executeUpdate();
      response.sendRedirect("login.jsp");
    } catch(Exception e) {
      out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
  }
%>
</body>
</html>
