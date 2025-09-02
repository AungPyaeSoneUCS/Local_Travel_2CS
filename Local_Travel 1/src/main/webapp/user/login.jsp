<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Login - Tourly Travel</title>
  <style>
    body { font-family: Arial, sans-serif; background: #e8f5e9; }
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
  <h2>User Login</h2>
  <form method="post">
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>
  <a href="register.jsp">New user? Register</a>
</div>

<%
  if(request.getMethod().equalsIgnoreCase("POST")) {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly", "root", "root");
      PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=? AND role='user'");
      ps.setString(1, email);
      ps.setString(2, password);
      ResultSet rs = ps.executeQuery();

      if(rs.next()) {
        session.setAttribute("userId", rs.getInt("id"));
        session.setAttribute("userName", rs.getString("name"));
        response.sendRedirect("packages.jsp");
      } else {
        out.println("<p style='color:red;text-align:center;'>Invalid credentials</p>");
      }
    } catch(Exception e) {
      out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
  }
%>
</body>
</html>
