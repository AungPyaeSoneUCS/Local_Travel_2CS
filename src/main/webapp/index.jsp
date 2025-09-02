<%@ include file="header.jsp" %>

<main>
  <article>
    <section class="hero" id="home">
      <div class="container">
        <h2 class="h1 hero-title">Explore the Beauty of Myanmar</h2>
        <p class="hero-text">From golden pagodas in Yangon to the ancient temples of Bagan – your adventure begins here.</p>
        <div class="btn-group">
          <a href="about.jsp" class="btn btn-primary">Learn More</a>
          <a href="packages.jsp" class="btn btn-secondary">Book Now</a>
        </div>
      </div>
    </section>

    <section class="tour-search">
      <div class="container">
        <form action="destination.jsp" method="get" class="tour-search-form">
          <div class="input-wrapper">
            <label for="destination" class="input-label">Search Destination*</label>
            <input type="text" name="destination" id="destination" required placeholder="E.g. Bagan" class="input-field">
          </div>
          <div class="input-wrapper">
            <label for="people" class="input-label">Pax Number*</label>
            <input type="number" name="people" id="people" required placeholder="No. of People" class="input-field">
          </div>
          <div class="input-wrapper">
            <label for="checkin" class="input-label">Checkin Date*</label>
            <input type="date" name="checkin" id="checkin" required class="input-field">
          </div>
          <div class="input-wrapper">
            <label for="checkout" class="input-label">Checkout Date*</label>
            <input type="date" name="checkout" id="checkout" required class="input-field">
          </div>
          <button type="submit" class="btn btn-secondary">Inquire Now</button>
        </form>
      </div>
    </section>
  </article>
</main>

<%@ include file="footer.jsp" %>
