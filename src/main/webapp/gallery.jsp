<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Gallery - Tourly Travel Myanmar</title>
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
                  url('images/gallery-bg.jpg') center/cover no-repeat;
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

    /* Gallery Section */
    .gallery {
      max-width: 1200px;
      margin: auto;
      padding: 3rem 1rem;
    }
    .gallery h2 {
      text-align: center;
      color: #00796b;
      font-size: 2rem;
      margin-bottom: 2rem;
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
    }
    .grid img {
      width: 100%;
      height: 220px;
      object-fit: cover;
      border-radius: 12px;
      box-shadow: 0 6px 12px rgba(0,0,0,0.1);
      cursor: pointer;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .grid img:hover {
      transform: scale(1.05);
      box-shadow: 0 8px 16px rgba(0,0,0,0.15);
    }

    /* Lightbox */
    .lightbox {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: rgba(0,0,0,0.85);
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 1000;
      visibility: hidden;
      opacity: 0;
      transition: opacity 0.3s ease, visibility 0.3s ease;
    }
    .lightbox.active {
      visibility: visible;
      opacity: 1;
    }
    .lightbox img {
      max-width: 90%;
      max-height: 80%;
      border-radius: 8px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.4);
    }
    .lightbox span {
      position: absolute;
      top: 20px;
      right: 30px;
      font-size: 2rem;
      color: #fff;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <!-- HEADER -->
  <%@ include file="header.jsp" %>

  <!-- HERO -->
  <section class="hero">
    <h1>Travel Gallery</h1>
    <p>Discover the stunning beauty of Myanmar through our curated gallery.</p>
  </section>

  <!-- GALLERY -->
  <section class="gallery">
    <h2>Our Collection</h2>
    <div class="grid">
      <img src="images/gallery1.jpg" alt="Bagan Sunrise">
      <img src="images/gallery2.jpg" alt="Inle Lake">
      <img src="images/gallery3.jpg" alt="Shwedagon Pagoda">
      <img src="images/gallery4.jpg" alt="Ngapali Beach">
      <img src="images/gallery5.jpg" alt="Mandalay Palace">
      <img src="images/gallery6.jpg" alt="Golden Rock">
      <img src="images/gallery7.jpg" alt="Street Market">
      <img src="images/gallery8.jpg" alt="Monks Walking">
      <img src="images/gallery9.jpg" alt="Traditional Dance">
    </div>
  </section>

  <!-- LIGHTBOX -->
  <div class="lightbox" id="lightbox">
    <span id="close">&times;</span>
    <img id="lightbox-img" src="" alt="">
  </div>

  <!-- FOOTER -->
  <%@ include file="footer.jsp" %>

  <!-- JavaScript -->
  <script>
    const lightbox = document.getElementById("lightbox");
    const lightboxImg = document.getElementById("lightbox-img");
    const closeBtn = document.getElementById("close");

    document.querySelectorAll(".grid img").forEach(img => {
      img.addEventListener("click", () => {
        lightbox.classList.add("active");
        lightboxImg.src = img.src;
        lightboxImg.alt = img.alt;
      });
    });

    closeBtn.addEventListener("click", () => {
      lightbox.classList.remove("active");
    });

    lightbox.addEventListener("click", (e) => {
      if (e.target !== lightboxImg) {
        lightbox.classList.remove("active");
      }
    });
  </script>
</body>
</html>
