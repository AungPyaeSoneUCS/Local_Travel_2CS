<!-- header.jsp -->
<div class="header">
  <div class="container">
    <h2 class="logo">Tourly Travel</h2>
    <nav class="navbar">
      <a href="../index.jsp">Home</a>
      <a href="destination.jsp">Destinations</a>
      <a href="packages.jsp">Packages</a>
      <a href="gallery.jsp">Gallery</a>
      <a href="myBookings.jsp">My Bookings</a>

      <%
        String userName = (String) session.getAttribute("userName");
        if (userName != null) {
      %>
          <span style="margin-left:15px; color:#ffd54f; font-weight:bold;">
            Welcome, <%= userName %>
          </span>
          <a href="logout.jsp" style="margin-left:15px;">Logout</a>
      <%
        } else {
      %>
          <a href="login.jsp">Login</a>
      <%
        }
      %>
    </nav>
  </div>
</div>

<style>
  .header {
    background: #00695c;
    color: #fff;
    padding: 15px 0;
  }
  .header .container {
    max-width: 1200px;
    margin: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
  }
  .logo {
    margin: 0;
    font-size: 24px;
  }
  .navbar {
    display: flex;
    align-items: center;
  }
  .navbar a {
    color: #fff;
    margin: 0 10px;
    text-decoration: none;
    font-weight: bold;
  }
  .navbar a:hover {
    text-decoration: underline;
  }
</style>
