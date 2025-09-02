<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Destinations - Tourly Travel Myanmar</title>
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
                  url('images/destination-bg.jpg') center/cover no-repeat;
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

    /* Destinations Grid */
    .destinations {
      max-width: 1200px;
      margin: auto;
      padding: 4rem 1rem;
    }
    .destinations h2 {
      text-align: center;
      color: #00796b;
      font-size: 2rem;
      margin-bottom: 2rem;
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 2rem;
    }
    .card {
      background: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 6px 12px rgba(0,0,0,0.08);
      transform: translateY(30px);
      opacity: 0;
      transition: transform 0.5s ease, opacity 0.5s ease;
    }
    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }
    .card-body {
      padding: 1.5rem;
    }
    .card-body h3 {
      margin-top: 0;
      color: #004d40;
    }
    .card-body p {
      margin: 0.5rem 0 1rem;
    }
    .card-body a {
      display: inline-block;
      padding: 0.6rem 1.2rem;
      border-radius: 8px;
      background: #00796b;
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      transition: background 0.3s ease;
    }
    .card-body a:hover {
      background: #004d40;
    }
  </style>
</head>
<body>

  <!-- HEADER -->
  <%@ include file="header.jsp" %>

  <!-- HERO -->
  <section class="hero">
    <h1>Top Destinations in Myanmar</h1>
    <p>From golden temples to serene lakes, explore the beauty of Myanmar’s most iconic places.</p>
  </section>

  <!-- DESTINATION CARDS -->
  <section class="destinations">
  <h2>Explore Myanmar</h2>
  <div class="grid">
    <div class="card">
      <img src="images/bagan.jpg" alt="Bagan Temples">
      <div class="card-body">
        <h3>Bagan</h3>
        <p>Discover thousands of ancient temples and watch the sunrise over the plains.</p>
        <a href="#">Learn More</a>
      </div>
    </div>

    <div class="card">
      <img src="images/shwedagon.jpg" alt="Shwedagon Pagoda">
      <div class="card-body">
        <h3>Shwedagon Pagoda</h3>
        <p>The most sacred Buddhist pagoda in Myanmar, glittering in gold at sunset.</p>
        <a href="#">Learn More</a>
      </div>
    </div>

    <div class="card">
      <img src="images/goldenrock.jpg" alt="Golden Rock">
      <div class="card-body">
        <h3>Golden Rock</h3>
        <p>Visit the famous Kyaiktiyo Pagoda, a golden boulder balancing on a cliff.</p>
        <a href="#">Learn More</a>
      </div>
    </div>

    <div class="card">
      <img src="images/ngapali.jpg" alt="Ngapali Beach">
      <div class="card-body">
        <h3>Ngapali Beach</h3>
        <p>Relax on pristine beaches with turquoise waters and fresh seafood delights.</p>
        <a href="#">Learn More</a>
      </div>
    </div>

    <div class="card">
      <img src="images/mandalay.jpg" alt="Mandalay Palace">
      <div class="card-body">
        <h3>Mandalay</h3>
        <p>Explore Myanmar’s last royal capital, home to historic palaces and monasteries.</p>
        <a href="#">Learn More</a>
      </div>
    </div>

    <div class="card">
      <img src="images/inle.jpg" alt="Inle Lake">
      <div class="card-body">
        <h3>Inle Lake</h3>
        <p>Experience floating villages, unique leg-rowing fishermen, and peaceful waters.</p>
        <a href="#">Learn More</a>
      </div>
    </div>
  </div>
</section>


  <!-- FOOTER -->
  <%@ include file="footer.jsp" %>

  <!-- JavaScript -->
  <script>
    // Scroll Animation
    window.addEventListener("scroll", () => {
      const cards = document.querySelectorAll(".card");
      cards.forEach(card => {
        const rect = card.getBoundingClientRect();
        if (rect.top < window.innerHeight - 100) {
          card.style.transform = "translateY(0)";
          card.style.opacity = "1";
        }
      });
    });
  </script>
</body>
</html>
