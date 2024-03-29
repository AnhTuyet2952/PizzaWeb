<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
  <head>
    <title>Pizza - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
.cart-item-count {
    color: red; /* Màu chữ của số lượng */
    font-size: 20px;
}
</style>
  </head>
  <body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
		<!-- Start Header/Navigation -->
		<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />
		<!-- End Header/Navigation -->

    <section class="home-slider owl-carousel img" style="background-image: url(images/bg_1.jpg);">

      <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread"><fmt:message bundle="${bnd}" key="service.title"/></h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html"><fmt:message bundle="${bnd}" key="service.home"/></a></span> <span><fmt:message bundle="${bnd}" key="service.title"/></span></p>
            </div>

          </div>
        </div>
      </div>
    </section>
    

    <section class="ftco-section ftco-services">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-4"><fmt:message bundle="${bnd}" key="service.title"/></h2>
            <p><fmt:message bundle="${bnd}" key="service.content"/></p>
          </div>
        </div>
    		<div class="row">
          <div class="col-md-4 ftco-animate">
            <div class="media d-block text-center block-6 services">
              <div class="icon d-flex justify-content-center align-items-center mb-5">
              	<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading"><fmt:message bundle="${bnd}" key="service1"/></h3>
                <p><fmt:message bundle="${bnd}" key="service1_content"/></p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="media d-block text-center block-6 services">
              <div class="icon d-flex justify-content-center align-items-center mb-5">
              	<span class="flaticon-bicycle"></span>
              </div>
              <div class="media-body">
                <h3 class="heading"><fmt:message bundle="${bnd}" key="service1"/></h3>
                <p><fmt:message bundle="${bnd}" key="service1_content"/></p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="media d-block text-center block-6 services">
              <div class="icon d-flex justify-content-center align-items-center mb-5"><span class="flaticon-pizza-1"></span></div>
              <div class="media-body">
                <h3 class="heading"><fmt:message bundle="${bnd}" key="service1"/></h3>
                <p><fmt:message bundle="${bnd}" key="service1_content"/></p>
              </div>
            </div>    
          </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-4">Hot Meals</h2>
            <p class="flip"><span class="deg1"></span><span class="deg2"></span><span class="deg3"></span></p>
            <p class="mt-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-3 text-center ftco-animate">
      			<div class="menu-wrap">
      				<a href="#" class="menu-img img mb-4" style="background-image: url(images/pizza-1.jpg);"></a>
      				<div class="text">
      					<h3><a href="#">Itallian Pizza</a></h3>
      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
      					<p class="price"><span>$2.90</span></p>
      					<p><a href="#" class="btn btn-white btn-outline-white">Add to cart</a></p>
      				</div>
      			</div>
      		</div>
      		<div class="col-md-3 text-center ftco-animate">
      			<div class="menu-wrap">
      				<a href="#" class="menu-img img mb-4" style="background-image: url(images/pizza-2.jpg);"></a>
      				<div class="text">
      					<h3><a href="#">Itallian Pizza</a></h3>
      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
      					<p class="price"><span>$2.90</span></p>
      					<p><a href="#" class="btn btn-white btn-outline-white">Add to cart</a></p>
      				</div>
      			</div>
      		</div>
      		<div class="col-md-3 text-center ftco-animate">
      			<div class="menu-wrap">
      				<a href="#" class="menu-img img mb-4" style="background-image: url(images/pizza-3.jpg);"></a>
      				<div class="text">
      					<h3><a href="#">Itallian Pizza</a></h3>
      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
      					<p class="price"><span>$2.90</span></p>
      					<p><a href="#" class="btn btn-white btn-outline-white">Add to cart</a></p>
      				</div>
      			</div>
      		</div>
      		<div class="col-md-3 text-center ftco-animate">
      			<div class="menu-wrap">
      				<a href="#" class="menu-img img mb-4" style="background-image: url(images/pizza-4.jpg);"></a>
      				<div class="text">
      					<h3><a href="#">Itallian Pizza</a></h3>
      					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
      					<p class="price"><span>$2.90</span></p>
      					<p><a href="#" class="btn btn-white btn-outline-white">Add to cart</a></p>
      				</div>
      			</div>
      		</div>
    		</div>
    	</div>
    </section>

	<footer class="ftco-footer ftco-section img">
		<jsp:include page="/pizza-gh-pages/pizza-gh-pages/footer.jsp" />
	</footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>