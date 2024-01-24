<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
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
<link rel="icon" href="images/pizza.png" type="image/png">
</head>

<body>
	<fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd" />
	<!-- Start Header/Navigation -->
	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />

	<!-- End Header/Navigation -->

	<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt"></div>
				</div>
				<div class="col-lg-7"></div>
			</div>
		</div>
	</div>
		<h1 style="text-align: center;">
		<b><fmt:message bundle="${bnd}" key="order.detail" /></b>
	</h1>
	<jsp:useBean id="orderDao" class="Database.OrderDAO"></jsp:useBean>

	<jsp:useBean id="orderDetailDao" class="Database.OrderDetailDAO"></jsp:useBean>

	<c:set var="orderId" value="${param.orderId}" />
	<c:set var="order" value="${orderDao.selectById(orderId)}"></c:set>
	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-6" style="text-align: left; font-size: 22px">
					<!-- Thông tin khách hàng -->
					<h3>
						<fmt:message bundle="${bnd}" key="thank.inf.cus" />
					</h3>
					<label for="name"><fmt:message bundle="${bnd}" key="orderDetail.name" />:
						${order.getNameConsignee()}</label><br> <label for="phone">
						<fmt:message bundle="${bnd}" key="orderDetail.phone" />: ${order.getPhoneConsignee()}</label><br>
				</div>

				<div class="col-md-6" style="text-align: left; font-size: 22px">
					<!-- Thông tin đặt hàng -->
					<h3>
						<fmt:message bundle="${bnd}" key="thank.inf.order" />
						${param.orderId}
					</h3>
					<label for="Address"> <fmt:message bundle="${bnd}"
							key="checkout.bill.address" />: ${order.getAddress()}
					</label><br> <label for="status"><fmt:message bundle="${bnd}"
							key="checkout.bill.note" />: ${order.getNote()}</label><br>
					<c:set var="subtotal" value="0" />
					<c:set var="total" value="0" />

					<table class="table site-block-order-table mb-5"
						style="text-align: left;">
						<thead>
							<th><fmt:message bundle="${bnd}" key="checkout.product" /></th>
							<th><fmt:message bundle="${bnd}" key="checkout.total" /></th>
						</thead>
						<tbody>
							<c:forEach var="item"
								items="${orderDetailDao.selectByOrderId(param.orderId)}">

								<c:set var="itemTotal"
									value="${item.products.price * item.quantity}" />
								<tr>
									<td><img style="width: 60px; height: 45px;"
										src="<c:out value="${pageContext.request.contextPath}/${item.products.image}" />" alt="Image"
										class="img-fluid"> <b><c:out
												value="${(sessionScope.language == 'en') ? item.products.nameProducten : item.products.nameProduct}" /></b>
										<strong class="mx-2">x</strong> <c:out
											value="${item.quantity}" /></td>
									<td><c:out value="${FormatCurrency.formatCurrency(itemTotal)}" /></td>
								</tr>
								<c:set var="subtotal" value="${subtotal + itemTotal}" />
								<c:set var="total" value="${total + itemTotal}" />
							</c:forEach>
							<tr>
								<td class="text-black font-weight-bold"><strong><fmt:message bundle="${bnd}" key="checkout.sub"/></strong></td>
								<td class="text-black"><c:out value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
							</tr>
							<tr>
								<td class="text-black font-weight-bold"><strong><fmt:message bundle="${bnd}" key="checkout.ordertotal"/></strong></td>
								<td class="text-black font-weight-bold"><strong><c:out
											value="${FormatCurrency.formatCurrency(total)}" /></strong></td>
							</tr>
						</tbody>
					</table>
 <p><a href="order.jsp" class="btn btn-primary btn-outline-primary"><fmt:message bundle="${bnd}" key="orderDetail.back"/></a></p>


				</div>
			</div>
			</div></div>
</body>



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