<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header" data-header>

<link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com"> <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700;800&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

  <div class="overlay" data-overlay></div>
  <div class="header-top">
    <div class="container">
      <a href="tel:+959123456789" class="helpline-box">
        <div class="icon-box">
          <ion-icon name="call-outline"></ion-icon>
        </div>
        <div class="wrapper">
          <p class="helpline-title">For Further Inquiries :</p>
          <p class="helpline-number">+95 9979737123</p>
        </div>
      </a>
      <a href="index.jsp" class="logo">
        <img src="./assets/images/logo.svg" alt="Tourly Myanmar logo">
      </a>
      <div class="header-btn-group">
        <button class="search-btn" aria-label="Search"><ion-icon name="search"></ion-icon></button>
        <button class="nav-open-btn" aria-label="Open Menu" data-nav-open-btn>
          <ion-icon name="menu-outline"></ion-icon>
        </button>
      </div>
    </div>
  </div>

  <div class="header-bottom">
    <div class="container">
      <ul class="social-list">
        <li><a href="#" class="social-link"><ion-icon name="logo-facebook"></ion-icon></a></li>
        <li><a href="#" class="social-link"><ion-icon name="logo-twitter"></ion-icon></a></li>
        <li><a href="#" class="social-link"><ion-icon name="logo-youtube"></ion-icon></a></li>
      </ul>

      <nav class="navbar" data-navbar>
        <div class="navbar-top">
          <a href="index.jsp" class="logo">
            <img src="./assets/images/logo-blue.svg" alt="Tourly Myanmar logo">
          </a>
          <button class="nav-close-btn" aria-label="Close Menu" data-nav-close-btn>
            <ion-icon name="close-outline"></ion-icon>
          </button>
        </div>

        <ul class="navbar-list">
          <li><a href="index.jsp" class="navbar-link">Home</a></li>
          <li><a href="about.jsp" class="navbar-link">About Us</a></li>
          <li><a href="destination.jsp" class="navbar-link">Destinations</a></li>
          <li><a href="gallery.jsp" class="navbar-link">Gallery</a></li>
          <li><a href="contact.jsp" class="navbar-link">Contact Us</a></li>
        </ul>
      </nav>
      <button class="btn btn-primary"> <a href="user/packages.jsp" class="navbar-link">Book Now</a>   </button>
    </div>
  </div>
</header>
