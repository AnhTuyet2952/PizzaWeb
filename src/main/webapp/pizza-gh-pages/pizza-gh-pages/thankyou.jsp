<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
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
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>

		<!-- End Hero Section -->


<jsp:useBean id="orderDAO" class="Database.OrderDAO"></jsp:useBean>
<c:set var="orderId" value="${sessionScope.order.oderId}" />
<c:set var="orders" value="${orderDAO.selectById(orderId)}" />


<c:if test="${orders.getStatus() eq 'processing'}">
    <h2 class="display-3 text-black" style="text-align: center;s">Đơn hàng của bạn đang chờ xử lý. Vui lòng đợi xác nhận.</h2>
</c:if>

<c:if test="${orders.getStatus() eq 'Accept'}">


<!-- Trong trang thankyou -->

		<div class="untree_co-section">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center pt-5">
          <span class="display-3 thankyou-icon text-primary">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart-check mb-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z"/>
              <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
            </svg>
          </span>
          <h2 class="display-3 text-black"><fmt:message bundle="${bnd}" key="thank.title"/></h2>
          <p class="lead mb-5"><fmt:message bundle="${bnd}" key="thank.content"/></p>
          <div class="row">
    <div class="col-md-6" style="text-align: left; font-size: 22px">
        <!-- Thông tin khách hàng -->
        <h2><fmt:message bundle="${bnd}" key="thank.inf.cus"/></h2>
        <label for="nameConsignee"> <fmt:message bundle="${bnd}" key="checkout.bill.name"/>: ${order.getNameConsignee()}</label><br>
		<label for="phoneConsignee"><fmt:message bundle="${bnd}" key="checkout.bill.phone"/>: ${order.getPhoneConsignee()}</label><br>
    </div>

    <div class="col-md-6" style="text-align: left; font-size: 22px">
        <!-- Thông tin đặt hàng -->
        <h2><fmt:message bundle="${bnd}" key="thank.inf.order"/></h2>
        <label for="Address"><fmt:message bundle="${bnd}" key="checkout.bill.address"/>: ${order.getAddress()}</label><br>
		<label for="note"><fmt:message bundle="${bnd}" key="checkout.bill.note"/>: ${order.getNote()}</label><br>
<c:set var="subtotal" value="0" />
<c:set var="total" value="0" />

<table class="table site-block-order-table mb-5" style="text-align: left;">
    <thead>
        <th><fmt:message bundle="${bnd}" key="checkout.product"/></th>
        <th><fmt:message bundle="${bnd}" key="checkout.total"/></th>
    </thead>
    <tbody>
    <jsp:useBean id="orderDetailDAO" class="Database.OrderDetailDAO"></jsp:useBean>
<c:set var="orderId" value="${sessionScope.order.oderId}" />
<c:set var="orderDetails" value="${orderDetailDAO.selectByOrderId(orderId)}" />
        <c:forEach var="item" items="${orderDetails}">
            <c:set var="itemTotal" value="${item.products.price * item.quantity}" />
            <tr>
                <td>
                    <img style="width: 60px; height: 45px;" src="<c:out value="${item.products.image}" />" alt="Image" class="img-fluid">
                    <b><c:out value="${(sessionScope.language == 'en') ? item.products.nameProducten : item.products.nameProduct}" /></b>
                    <strong class="mx-2">x</strong><c:out value="${item.quantity}" />
                </td>
                <td><c:out value="${itemTotal}" /></td>
            </tr>
            <c:set var="subtotal" value="${subtotal + itemTotal}" />
            <c:set var="total" value="${total + itemTotal}" />
        </c:forEach>
        <tr>
            <td class="text-black font-weight-bold"><strong><fmt:message bundle="${bnd}" key="checkout.sub"/></strong></td>
            <td class="text-black"><c:out value="${subtotal}" /></td>
        </tr>
        <tr>
            <td class="text-black font-weight-bold"><strong><fmt:message bundle="${bnd}" key="checkout.ordertotal"/></strong></td>
            <td class="text-black font-weight-bold"><strong><c:out value="${total}" /></strong></td>
        </tr>
    </tbody>
</table>


		              
    </div>
</div>




          
          <p><a href="index.jsp" class="btn btn-primary btn-outline-primary"><fmt:message bundle="${bnd}" key="thank.backtoshop"/></a></p>
        </div>
      </div>
    </div>
  </div>
  </c:if>
<c:if test="${orders.getStatus() eq 'Reject'}">
    <h2 class="display-3 text-black">Xin lỗi, đơn hàng của bạn đã bị từ chối. Vui lòng liên hệ chăm sóc khách hàng để biết thêm chi tiết.</h2>
</c:if>

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
