<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us - Tourly Travel Myanmar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CSS -->
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background: #f4f7f6;
      color: #333;
    }

    /* Hero Section */
    .hero {
      background: linear-gradient(rgba(0, 105, 92, 0.85), rgba(0, 105, 92, 0.85)), 
                  url('images/contact-bg.jpg') center/cover no-repeat;
      color: #fff;
      padding: 5rem 1rem;
      text-align: center;
    }
    .hero h1 {
      font-size: 2.5rem;
      margin-bottom: 1rem;
    }
    .hero p {
      font-size: 1.2rem;
      max-width: 700px;
      margin: auto;
    }

    /* Contact Section */
    .contact {
      max-width: 1000px;
      margin: auto;
      padding: 4rem 1rem;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 2rem;
    }

    /* Contact Info */
    .contact-info {
      background: #fff;
      padding: 2rem;
      border-radius: 16px;
      box-shadow: 0 6px 12px rgba(0,0,0,0.08);
    }
    .contact-info h2 {
      margin-bottom: 1rem;
      color: #00796b;
    }
    .contact-info p {
      margin: 0.5rem 0;
    }

    /* Contact Form */
    .contact-form {
      background: #fff;
      padding: 2rem;
      border-radius: 16px;
      box-shadow: 0 6px 12px rgba(0,0,0,0.08);
    }
    .contact-form h2 {
      margin-bottom: 1rem;
      color: #00796b;
    }
    .contact-form label {
      display: block;
      margin: 0.8rem 0 0.3rem;
      font-weight: 500;
    }
    .contact-form input,
    .contact-form textarea {
      width: 100%;
      padding: 0.8rem;
      border-radius: 8px;
      border: 1px solid #ccc;
      font-size: 1rem;
      margin-bottom: 1rem;
      transition: border 0.3s ease;
    }
    .contact-form input:focus,
    .contact-form textarea:focus {
      border: 1px solid #00796b;
      outline: none;
    }
    .contact-form button {
      padding: 0.8rem 1.6rem;
      border-radius: 10px;
      border: none;
      background: #00796b;
      color: #fff;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s ease;
    }
    .contact-form button:hover {
      background: #004d40;
      transform: scale(1.05);
    }
  </style>
</head>
<body>

  <!-- HEADER -->
  <%@ include file="header.jsp" %>

  <!-- HERO SECTION -->
  <section class="hero">
    <h1>Contact Us</h1>
    <p>We’d love to hear from you! Get in touch with Tourly Myanmar for inquiries, bookings, or travel advice.</p>
  </section>

  <!-- MAIN CONTACT SECTION -->
  <section class="contact">
    <!-- Contact Info -->
    <div class="contact-info">
      <h2>Our Office</h2>
      <p><strong>📍 Address:</strong> Yangon, Myanmar</p>
      <p><strong>📞 Phone:</strong> +95 9979737123</p>
      <p><strong>✉️ Email:</strong> info@tourlymyanmar.com</p>
      <p><strong>🕒 Hours:</strong> Mon - Sat (9am - 6pm)</p>
    </div>

    <!-- Contact Form -->
    <div class="contact-form">
      <h2>Send us a Message</h2>
      <form id="contactForm" action="#" method="post">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" placeholder="Your Name">

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Your Email">

        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" placeholder="Your Message"></textarea>

        <button type="submit">Send Message</button>
      </form>
    </div>
  </section>

  <!-- FOOTER -->
  <%@ include file="footer.jsp" %>

  <!-- JavaScript -->
  <script>
    // Form Validation
    document.getElementById("contactForm").addEventListener("submit", function(event) {
      event.preventDefault();
      const name = document.getElementById("name").value.trim();
      const email = document.getElementById("email").value.trim();
      const message = document.getElementById("message").value.trim();
      const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

      if (!name || !email || !message) {
        alert("⚠️ Please fill in all fields.");
        return;
      }
      if (!email.match(emailPattern)) {
        alert("⚠️ Please enter a valid email address.");
        return;
      }
      alert("✅ Thank you for contacting us, " + name + "! We will get back to you soon.");
      document.getElementById("contactForm").reset();
    });
  </script>
</body>
</html>
