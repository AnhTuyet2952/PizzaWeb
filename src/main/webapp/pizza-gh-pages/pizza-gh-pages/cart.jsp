 <!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




<html lang="en">
<head>
<title>Pizza - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do"
	rel="stylesheet">

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

</style>
<!-- Thêm mã JavaScript vào trang của bạn -->

</head>


	<body>
	
<fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
		<!-- Start Header/Navigation -->
		<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />
		<!-- End Header/Navigation -->

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1><fmt:message bundle="${bnd}" key="cart.title"/></h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

		
	
	
		<div class="untree_co-section before-footer-section">
            <div class="container">
              <div class="row mb-5">
                  <div class="site-blocks-table">
                    <table class="table">
                      <thead>
                        <tr>
                          <th class="product-thumbnail"><fmt:message bundle="${bnd}" key="cart.image.title"/></th>
                          <th class="product-name"><fmt:message bundle="${bnd}" key="cart.product.title"/></th>
                          <th class="product-price"><fmt:message bundle="${bnd}" key="cart.price.title"/></th>
                          <th class="product-quantity"><fmt:message bundle="${bnd}" key="cart.quantity.title"/></th>
                          <th class="product-total"><fmt:message bundle="${bnd}" key="cart.total.title"/></th>
                          <th class="product-remove"><fmt:message bundle="${bnd}" key="cart.remove.title"/></th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="item" items="${sessionScope.cart.cart_items}">
                        <tr>
                          <td class="product-thumbnail">
                            <img style="width: 160px; height: 160px;" src="${item.product.image}" alt="Image" class="img-fluid">
                          </td>
                          <td class="product-name">
                           <h2 class="h5 text-black">${(sessionScope.language == 'en') ? item.product.nameProducten : item.product.nameProduct}</h2>
  
                          </td>
                          <td>${item.product.price}</td>
                             <td>
            <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                        <div class="input-group-prepend">
                        <form action="${pageContext.request.contextPath}/updateQuantity" method="post">
                            <input type="hidden" name=idproduct value="${item.product.idProduct}">
                            <input type="hidden" name="quantity" value="${item.quantity - 1}">
                            <button type="submit" class="btn btn-outline-black">-</button>
                        </form>
                    </div>
                    <input type="text" class="form-control text-center quantity-amount" value="${item.quantity}" readonly>
                    <div class="input-group-append">
                        <form action="${pageContext.request.contextPath}/updateQuantity" method="post">
                            <input type="hidden" name="idproduct" value="${item.product.idProduct}">
                            <input type="hidden" name="quantity" value="${item.quantity + 1}">
                            <button type="submit" class="btn btn-outline-black">+</button>
                        </form>
                    </div>
            </div>
        </td>
                          <td>${item.product.price*item.quantity}</td>
                         <td><form action="${pageContext.request.contextPath}/removeItem" method="post">
                         <input type="hidden" name="productId" value="${item.product.idProduct}">
                         
                          <button type="submit" class="btn btn-black btn-sm">X</button>
                        </form>
                        </td>
                        </tr>
        <c:set var="subtotal" value="${subtotal + (item.product.price * item.quantity)}" />
        <c:set var="total" value="${total + (item.product.price * item.quantity)}" />
                    </c:forEach>
                      </tbody>
                    </table>
                  </div>
              </div>
        
              <div class="row">
                <div class="col-md-6">
                  <div class="row mb-5">
                    
                    <div class="col-md-6">
                     <a class="btn btn-outline-black btn-sm btn-block" href="menu.jsp"><fmt:message bundle="${bnd}" key="cart.continue"/></a>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <label class="text-black h4" for="coupon"><fmt:message bundle="${bnd}" key="cart.coupon.title"/></label>
                    </div>
                    <div class="col-md-8 mb-3 mb-md-0">
                      <input type="text" class="form-control py-3" id="coupon" placeholder="<fmt:message bundle="${bnd}" key="cart.coupon.enter"/>">
                    </div>
                    <div class="col-md-4">
                      <button class="btn btn-black"><fmt:message bundle="${bnd}" key="cart.coupon.apply"/></button>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 pl-5">
                  <div class="row justify-content-end">
                    <div class="col-md-7">
                      <div class="row">
                        <div class="col-md-12 text-right border-bottom mb-5">
                          <h3 class="text-black h4 text-uppercase"><fmt:message bundle="${bnd}" key="cart.cartTotal"/></h3>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <span class="text-black"><fmt:message bundle="${bnd}" key="cart.subtotal"/></span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black">${subtotal}</strong>
                        </div>
                      </div>
                      <div class="row mb-5">
                        <div class="col-md-6">
                          <span class="text-black"><fmt:message bundle="${bnd}" key="cart.total"/></span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black">${total}</strong>
                        </div>
                      </div>
        
                      <div class="row">
                        <div class="col-md-12">
                         <c:set var="cart" value="${sessionScope.cart.cart_items}" />

						<button class="btn btn-black btn-lg py-3 btn-block" 
      					  onclick="window.location='${not empty cart ? 'checkout.jsp' : 'menu.jsp'}'">
    						<fmt:message bundle="${bnd}" key="cart.checkout"/>
						</button>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		

		<!-- Start Footer Section -->
    <footer class="ftco-footer ftco-section img">
    	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/footer.jsp" />
    </footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
</html>