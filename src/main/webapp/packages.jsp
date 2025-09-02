<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Packages - Tourly Travel Myanmar</title>
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

    /* Hero */
    .hero {
      background: linear-gradient(rgba(0, 105, 92, 0.85), rgba(0, 105, 92, 0.85)),
                  url('images/packages-bg.jpg') center/cover no-repeat;
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

    /* Packages Section */
    .packages {
      max-width: 1100px;
      margin: auto;
      padding: 3rem 1rem;
    }
    .packages h2 {
      text-align: center;
      color: #00796b;
      font-size: 2rem;
      margin-bottom: 2.5rem;
    }

    .package-row {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      background: #fff;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 6px 12px rgba(0,0,0,0.08);
      margin-bottom: 2.5rem;
      transform: translateY(40px);
      opacity: 0;
      transition: transform 0.6s ease, opacity 0.6s ease;
    }
    .package-row.reverse {
      flex-direction: row-reverse;
    }

    .package-image {
      flex: 1 1 50%;
    }
    .package-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .package-info {
      flex: 1 1 50%;
      padding: 2rem;
    }
    .package-info h3 {
      margin-top: 0;
      color: #004d40;
    }
    .details {
      margin: 0.25rem 0 1rem;
      font-size: 0.95rem;
      color: #455a64;
    }
    .price-line {
      margin: 0.25rem 0 1rem;
      font-weight: 600;
      color: #00796b;
    }
    .price-line small {
      color: #546e7a;
      font-weight: 500;
    }
    .package-info p {
      margin-bottom: 1rem;
    }
    .package-info a {
      display: inline-block;
      padding: 0.6rem 1.2rem;
      border-radius: 8px;
      background: #00796b;
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      transition: background 0.3s ease;
    }
    .package-info a:hover {
      background: #004d40;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .package-row,
      .package-row.reverse {
        flex-direction: column;
      }
      .package-image, .package-info {
        flex: 1 1 100%;
      }
    }
  </style>
</head>
<body>

  <!-- HEADER -->
  <%@ include file="header.jsp" %>

  <!-- HERO -->
  <section class="hero">
    <h1>Travel Packages</h1>
    <p>Choose from our curated Myanmar travel packages with best experiences and great prices.</p>
  </section>

  <!-- PACKAGES -->
  <section class="packages">
    <h2>Popular Packages</h2>

    <!-- Package 1 -->
    <div class="package-row">
      <div class="package-image">
        <img src="images/inle.jpg" alt="Bagan & Inle Lake Tour">
      </div>
      <div class="package-info">
        <h3>Bagan & Inle Lake Tour</h3>
        <p class="details">5 Days</p>
        <p class="price-line">
          From <span class="usd">$<span data-usd>599</span></span>
          <small>(≈ <span class="mmk" data-mmk></span> MMK)</small>
        </p>
        <p>Explore ancient Bagan temples and enjoy the peaceful floating villages of Inle Lake.</p>
        <a href="#">Book Now</a>
      </div>
    </div>

    <!-- Package 2 -->
    <div class="package-row reverse">
      <div class="package-image">
        <img src="images/goldenrock.jpg" alt="Yangon & Golden Rock">
      </div>
      <div class="package-info">
        <h3>Yangon & Golden Rock</h3>
        <p class="details">3 Days</p>
        <p class="price-line">
          From <span class="usd">$<span data-usd>399</span></span>
          <small>(≈ <span class="mmk" data-mmk></span> MMK)</small>
        </p>
        <p>Visit the glittering Shwedagon Pagoda and the sacred Golden Rock pilgrimage site.</p>
        <a href="#">Book Now</a>
      </div>
    </div>

    <!-- Package 3 -->
    <div class="package-row">
      <div class="package-image">
        <img src="images/bagan.jpg" alt="Mandalay & Bagan Adventure">
      </div>
      <div class="package-info">
        <h3>Mandalay & Bagan Adventure</h3>
        <p class="details">7 Days</p>
        <p class="price-line">
          From <span class="usd">$<span data-usd>799</span></span>
          <small>(≈ <span class="mmk" data-mmk></span> MMK)</small>
        </p>
        <p>Discover Mandalay’s royal heritage and the endless pagodas of Bagan’s plains.</p>
        <a href="#">Book Now</a>
      </div>
    </div>

  </section>

  <!-- FOOTER -->
  <%@ include file="footer.jsp" %>

  <!-- JavaScript -->
  <script>
    // USD to MMK conversion rate (example: 1 USD = 2100 MMK)
    const rate = 2100;

    function convertPrices() {
      document.querySelectorAll("[data-usd]").forEach(usdEl => {
        const usd = parseFloat(usdEl.textContent.trim());
        const mmkEl = usdEl.closest(".price-line").querySelector("[data-mmk]");
        if (usd && mmkEl) {
          mmkEl.textContent = (usd * rate).toLocaleString("en-US");
        }
      });
    }

    // Scroll animation for packages
    function revealPackages() {
      document.querySelectorAll(".package-row").forEach(row => {
        const rect = row.getBoundingClientRect();
        if (rect.top < window.innerHeight - 100) {
          row.style.transform = "translateY(0)";
          row.style.opacity = "1";
        }
      });
    }

    window.addEventListener("DOMContentLoaded", () => {
      convertPrices();
      revealPackages();
    });

    window.addEventListener("scroll", revealPackages);
  </script>
</body>
</html>
