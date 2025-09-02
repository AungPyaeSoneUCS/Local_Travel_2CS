<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Myanmar - Tourly Travel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CSS -->
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      line-height: 1.6;
      background: #f4f7f6;
      color: #333;
    }

    /* Hero Section */
    .hero {
      background: linear-gradient(rgba(0, 105, 92, 0.85), rgba(0, 105, 92, 0.85)), 
                  url('images/myanmar-bg.jpg') center/cover no-repeat;
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

    /* About Section */
    .about {
      padding: 4rem 1rem;
      max-width: 1000px;
      margin: auto;
      text-align: center;
    }
    .about h2 {
      font-size: 2.2rem;
      color: #004d40;
      margin-bottom: 1.5rem;
    }
    .about p {
      margin-bottom: 1rem;
      font-size: 1.1rem;
    }

    /* Features Grid */
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 2rem;
      margin-top: 2.5rem;
    }
    .feature-card {
      background: #fff;
      padding: 2rem 1.5rem;
      border-radius: 16px;
      box-shadow: 0 6px 12px rgba(0,0,0,0.08);
      opacity: 0;
      transform: translateY(40px);
      transition: all 0.6s ease;
    }
    .feature-card h3 {
      margin-top: 0.5rem;
      color: #00796b;
    }

    /* Button Group */
    .btn-group {
      margin-top: 3rem;
    }
    .btn {
      padding: 0.8rem 1.6rem;
      border-radius: 10px;
      font-weight: 600;
      text-decoration: none;
      margin: 0.5rem;
      display: inline-block;
      transition: background 0.3s ease, transform 0.2s ease;
    }
    .btn-primary {
      background: #00796b;
      color: #fff;
    }
    .btn-primary:hover {
      background: #004d40;
      transform: scale(1.05);
    }
    .btn-secondary {
      background: #e0e0e0;
      color: #333;
    }
    .btn-secondary:hover {
      background: #bdbdbd;
      transform: scale(1.05);
    }
  </style>
</head>
<body>

  <!-- HEADER -->
  <%@ include file="header.jsp" %>

  <!-- HERO SECTION -->
  <section class="hero">
    <h1>About Myanmar</h1>
    <p>Discover the Golden Land — where ancient temples, serene lakes, and rich traditions await you.</p>
  </section>

  <!-- MAIN CONTENT -->
  <main>
    <section class="about" id="about">
      <h2>Discover the Golden Land</h2>

      <p>
        Myanmar, also known as Burma, is a land of breathtaking beauty and rich cultural heritage. 
        Known as the “Golden Land” for its glittering pagodas, Myanmar offers unforgettable experiences 
        from the ancient temples of <strong>Bagan</strong> to the peaceful waters of <strong>Inle Lake</strong>, 
        and from the bustling city of <strong>Yangon</strong> to the tranquil beaches of <strong>Ngapali</strong>.
      </p>

      <p>
        Whether you’re admiring the majestic <strong>Shwedagon Pagoda</strong>, exploring the 
        floating villages of Inle, or enjoying traditional Myanmar cuisine, every moment here 
        is a journey into history, spirituality, and nature.
      </p>

      <!-- Features -->
      <div class="grid">
        <div class="feature-card">
          <h3>🌏 Rich Culture</h3>
          <p>Discover timeless traditions, colorful festivals, and sacred temples.</p>
        </div>
        <div class="feature-card">
          <h3>🏞️ Natural Beauty</h3>
          <p>From Inle Lake to Shan Hills, Myanmar is full of stunning landscapes.</p>
        </div>
        <div class="feature-card">
          <h3>🤝 Warm Hospitality</h3>
          <p>Known for its kind and welcoming people, Myanmar makes visitors feel at home.</p>
        </div>
        <div class="feature-card">
          <h3>🍜 Authentic Cuisine</h3>
          <p>Enjoy Mohinga, Shan noodles, and other traditional Myanmar dishes.</p>
        </div>
      </div>

      <!-- Buttons -->
      <div class="btn-group">
        <a href="destination.jsp" class="btn btn-primary">Explore Destinations</a>
        <a href="contact.jsp" class="btn btn-secondary">Contact Us</a>
      </div>
    </section>
  </main>

  <!-- FOOTER -->
  <%@ include file="footer.jsp" %>

  <!-- JavaScript -->
  <script>
    // Fade-in + slide-up effect for feature cards
    const cards = document.querySelectorAll('.feature-card');
    const revealCards = () => {
      cards.forEach(card => {
        const rect = card.getBoundingClientRect();
        if (rect.top < window.innerHeight - 80) {
          card.style.opacity = "1";
          card.style.transform = "translateY(0)";
        }
      });
    };
    window.addEventListener('scroll', revealCards);
    window.addEventListener('load', revealCards);
  </script>
</body>
</html>
