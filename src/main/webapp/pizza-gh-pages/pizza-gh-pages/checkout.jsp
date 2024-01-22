<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="util.FormatCurrency" %>
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
</head>

	<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
		<!-- Start Header/Navigation -->
		<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />


		<!-- End Header/Navigation -->

		<!-- Start Hero Section -->
		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1><fmt:message bundle="${bnd}" key="checkout.title"/></h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

		<div class="untree_co-section">
		    <div class="container">
		      <div class="row mb-5">
		        <div class="col-md-12">
		        <c:choose>
    <c:when test="${empty sessionScope.customer and empty sessionScope.admin}">
        <div class="untree_co-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-12">
                        <div class="border p-4 rounded" role="alert">
                            <fmt:message bundle="${bnd}" key="checkout.login"/> <a href="login.jsp"><fmt:message bundle="${bnd}" key="checkout.login.click"/></a> <fmt:message bundle="${bnd}" key="checkout.login.to"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>

</c:choose>

		        </div>
		      </div>
		          <form action="${pageContext.request.contextPath}/checkoutController">
		      <div class="row">
		        <div class="col-md-6 mb-5 mb-md-0">
		          <h2 class="h3 mb-3 text-black"><fmt:message bundle="${bnd}" key="checkout.bill"/></h2>
		          <div class="p-3 p-lg-5 border bg-white">
		            <div class="form-group row">
		              <div class="col-md-6">
		                <label for="nameConsignee" class="text-black"><fmt:message bundle="${bnd}" key="checkout.bill.name"/><span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="nameConsignee" name="nameConsignee" required="required">
		              </div>
		            </div>
	        

		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="Address" class="text-black"><fmt:message bundle="${bnd}" key="checkout.bill.address"/><span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="address" name="Address" required="required">
		              </div>
		            </div>


		            

		            <div class="form-group row mb-5">
		              <div class="col-md-6">
		                <label for="phoneConsignee" class="text-black"><fmt:message bundle="${bnd}" key="checkout.bill.phone"/><span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="phoneConsignee" name="phoneConsignee" required="required">
		              </div>
		            </div>	      
		            <div class="form-group">
		              <label for="note" class="text-black"><fmt:message bundle="${bnd}" key="checkout.bill.note"/></label>
		              <textarea name="note" id="note" cols="30" rows="5" class="form-control" placeholder="<fmt:message bundle="${bnd}" key="checkout.bill.note.write"/>"></textarea>
		            </div>

		          </div>
		        </div>
		        <div class="col-md-6">



		          <div class="row mb-5">
		            <div class="col-md-12">
		              <h2 class="h3 mb-3 text-black"><fmt:message bundle="${bnd}" key="checkout.order"/></h2>
		              <div class="p-3 p-lg-5 border bg-white">
		                <table class="table site-block-order-table mb-5">
		                  <thead>
		                    <th><fmt:message bundle="${bnd}" key="checkout.product"/></th>
		                    <th><fmt:message bundle="${bnd}" key="checkout.total"/></th>
		                  </thead>
		                  <tbody>
		                  <c:forEach var="item" items="${sessionScope.cart.cart_items}">
		                    <tr>
		                      <td> <img style="width: 60px; height: 45px;" src="${pageContext.request.contextPath}/${item.product.image}" alt="Image" class="img-fluid"> <b>${(sessionScope.language == 'en') ? item.product.nameProducten : item.product.nameProduct}</b><strong class="mx-2">x</strong> ${item.quantity}</td>
		                      <td>${FormatCurrency.formatCurrency(item.product.price* item.quantity)}</td>
		                    </tr>
							<c:set var="subtotal" value="${subtotal + (item.product.price * item.quantity)}" />
       						<c:set var="total" value="${total + (item.product.price * item.quantity)}" />
		                    </c:forEach>
		                    <tr>
		                      <td class="text-black font-weight-bold"><strong><fmt:message bundle="${bnd}" key="checkout.sub"/></strong></td>
		                      <td class="text-black">${FormatCurrency.formatCurrency(subtotal)}</td>
		                    </tr>
		                    <tr>
		                      <td class="text-black font-weight-bold"><strong><fmt:message bundle="${bnd}" key="checkout.ordertotal"/></strong></td>
		                      <td class="text-black font-weight-bold"><strong>${FormatCurrency.formatCurrency(total)}</strong></td>
		                    </tr>
		                  </tbody>
		                </table>

		               

		                <div class="form-group">
		                  <button class="btn btn-black btn-lg py-3 btn-block" type="submit"><fmt:message bundle="${bnd}" key="checkout.placeorder"/></button>
		                </div>

		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <!-- </form> -->
					</form>
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
</html>		<!-- End Footer Section -->	


		