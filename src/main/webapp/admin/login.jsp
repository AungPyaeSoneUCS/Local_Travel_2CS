<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Login - Tourly</title>
  <style>
    body { font-family: Arial; background: #f4f7f6; }
    .login-box { max-width: 400px; margin: 100px auto; background: #fff;
                 padding: 20px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    h2 { text-align: center; color: #00695c; }
    input { width: 100%; padding: 10px; margin: 10px 0; border-radius: 6px; border: 1px solid #ccc; }
    button { width: 100%; padding: 10px; background: #00695c; color: #fff; border: none; border-radius: 6px; }
    button:hover { background: #004d40; }
  </style>
</head>
<body>
<div class="login-box">
  <h2>Admin Login</h2>
  <form method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>
</div>

<%
  if("POST".equalsIgnoreCase(request.getMethod())) {
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourly","root","root");
      PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
      ps.setString(1, uname);
      ps.setString(2, pass);
      ResultSet rs = ps.executeQuery();

      if(rs.next()) {
        session.setAttribute("adminUser", uname);
        response.sendRedirect("dashboard.jsp");
      } else {
        out.println("<p style='color:red;text-align:center;'>Invalid login!</p>");
      }
      con.close();
    } catch(Exception e) {
      out.println(e.getMessage());
    }
  }
%>
</body>
</html>
