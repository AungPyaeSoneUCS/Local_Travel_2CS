<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Travel Packages - Tourly Travel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    body { font-family: Arial, sans-serif; margin: 0; background: #f4f7f6; }
    h1 { text-align: center; padding: 20px; color: #00695c; }

    .packages { max-width: 1000px; margin: auto; padding: 20px; }
    .card { background: #fff; margin: 20px 0; border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); padding: 20px; }
    .card h3 { margin: 0 0 10px; color: #004d40; }
    .card p { margin: 0 0 10px; }
    .price { font-weight: bold; color: #e65100; margin-bottom: 15px; }
    .btn { padding: 10px 15px; background: #00695c; color: #fff;
           text-decoration: none; border-radius: 6px; }
    .btn:hover { background: #004d40; }

    /* Modal */
    .modal { display: none; position: fixed; top: 0; left: 0;
             width: 100%; height: 100%; background: rgba(0,0,0,0.6);
             justify-content: center; align-items: center; }
    .modal-content { background: #fff; padding: 20px; border-radius: 10px;
                     width: 400px; position: relative; }
    .close { position: absolute; top: 10px; right: 15px;
             cursor: pointer; font-size: 20px; color: #333; }
    input { width: 100%; padding: 10px; margin: 10px 0;
            border-radius: 6px; border: 1px solid #ccc; }
    button { width: 100%; padding: 10px; border: none; border-radius: 6px;
             background: #00695c; color: #fff; cursor: pointer; }
    button:hover { background: #004d40; }
  </style>
</head>
<body>

<%@ include file="header.jsp" %>

<h1>Available Packages</h1>
<div class="packages">
<%
  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tourly", "root", "root"
      );
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM packages");
      while(rs.next()) {
%>
        <div class="card">
          <h3><%= rs.getString("name") %></h3>
          <p><%= rs.getString("description") %></p>
          <p class="price">MMK <%= rs.getDouble("price") %></p>
          <a href="#" class="btn"
             onclick="openBooking('<%= rs.getString("name") %>', '<%= rs.getDouble("price") %>')">
             Book Now</a>
        </div>
<%
      }
      con.close();
  } catch(Exception e) {
      out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
  }
%>
</div>

<!-- Booking Modal -->
<div class="modal" id="bookingModal">
  <div class="modal-content">
    <span class="close" onclick="closeBooking()">&times;</span>
    <h2>Book Package</h2>
    <form method="post">
      <input type="hidden" name="packageName" id="packageName">
      <input type="hidden" name="basePrice" id="basePrice">

      <label>Travel Date</label>
      <input type="date" name="travelDate" required>

      <label>No. of People</label>
      <input type="number" name="people" min="1" required>

      <button type="submit">Confirm Booking</button>
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>

<!-- JavaScript -->
<script>
  function openBooking(name, basePrice) {
    document.getElementById("packageName").value = name;
    document.getElementById("basePrice").value = basePrice;
    document.getElementById("bookingModal").style.display = "flex";
  }
  function closeBooking() {
    document.getElementById("bookingModal").style.display = "none";
  }
  window.onclick = function(event) {
    if(event.target == document.getElementById("bookingModal")) {
      closeBooking();
    }
  }
</script>

<%
  if(request.getMethod().equalsIgnoreCase("POST")) {
    Integer userId = (Integer) session.getAttribute("userId");
    if(userId == null) {
      response.sendRedirect("login.jsp");
      return;
    }

    String packageName = request.getParameter("packageName");
    double basePrice = Double.parseDouble(request.getParameter("basePrice"));
    int people = Integer.parseInt(request.getParameter("people"));
    String travelDate = request.getParameter("travelDate");

    double totalPrice = basePrice * people;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tourly", "root", "root"
      );
      PreparedStatement ps = con.prepareStatement(
        "INSERT INTO bookings(userId,packageName,price,travelDate,people,status) VALUES(?,?,?,?,?,?)"
      );
      ps.setInt(1, userId);
      ps.setString(2, packageName);
      ps.setDouble(3, totalPrice);
      ps.setString(4, travelDate);
      ps.setInt(5, people);
      ps.setString(6, "Pending");
      ps.executeUpdate();
      con.close();
      out.println("<script>alert('Booking successful! Check My Bookings page.');</script>");
    } catch(Exception e) {
      out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
  }
%>

</body>
</html>
