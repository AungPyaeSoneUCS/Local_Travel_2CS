<%@ page import="java.sql.*" %>
<%
    // Only allow admin
    if(session.getAttribute("adminUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String bookingId = request.getParameter("id");
    String status = request.getParameter("status");

    if(bookingId != null && status != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourly","root","root"
            );

            PreparedStatement ps = con.prepareStatement(
                "UPDATE bookings SET status=? WHERE id=?"
            );
            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(bookingId));

            int updated = ps.executeUpdate();
            con.close();

            if(updated > 0) {
                session.setAttribute("msg", "Booking updated successfully!");
            } else {
                session.setAttribute("msg", "Booking not found!");
            }
        } catch(Exception e) {
            session.setAttribute("msg", "Error: " + e.getMessage());
        }
    } else {
        session.setAttribute("msg", "Invalid booking update request.");
    }

    // Redirect back to bookings page
    response.sendRedirect("index.jsp");
%>
