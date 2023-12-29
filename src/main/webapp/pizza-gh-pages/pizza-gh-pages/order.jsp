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
<style type="text/css">
/* CSS để làm đẹp bảng */
#dataTables-example {
	width: 98%; /* Đặt chiều rộng của bảng */
	margin: 0 auto; /* Căn giữa bảng bằng cách sử dụng margin */
	border-collapse: collapse;
	margin-top: 20px;
	max-height: 300px; /* Đặt chiều cao tối đa của bảng */
	overflow-y: auto;
	/* Cho phép cuộn nếu nội dung vượt quá chiều cao tối đa */
}

#dataTables-example th, #dataTables-example td {
	padding: 8px;
	text-align: center;
	vertical-align: middle;
}

/* CSS để làm đẹp link chi tiết */
#dataTables-example a {
	color: #007bff; /* Màu chữ là màu xanh dương */
	text-decoration: none; /* Loại bỏ đường gạch chân */
}

#dataTables-example a:hover {
	text-decoration: underline; /* Hiệu ứng gạch chân khi di chuột qua */
}

#dataTables-example td.address-column {
	text-align: left;
}
</style>

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
	<jsp:useBean id="userDAO" class="Database.UserDAO" />
	<c:set var="userId" value="${customer.getUserId()}" />
	<c:set var="user" value="${userDAO.selectById(userId)}" />
	<jsp:useBean id="orderDAO" class="Database.OrderDAO" />
	<jsp:useBean id="orderDetailDao" class="Database.OrderDetailDAO"></jsp:useBean>
	<h2 style="text-align: center;">
		<b><fmt:message bundle="${bnd}" key="order.title" /></b>
	</h2>
	<c:forEach items="${userDAO.selectCustomer()}" var="customer">
	 <c:if test="${customer.userId eq user.userId}">
    <c:set var="acceptOrders" value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'Accept')}" />
    <c:set var="processingOrders" value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'processing')}" />
    <c:set var="pendingOrders" value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'Request cancellation')}" />
    <c:set var="cancelOrders" value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'Cancel')}" />
	
	<div class="full inner_elements margin_top_30">
		<div class ="tab_style2">
			<div class="tabbar">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#Accept" role="tab"
							aria-selected="true"><fmt:message bundle="${bnd}" key="order.list.A" /></a><a
							class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#processing" role="tab" aria-selected="false"><fmt:message bundle="${bnd}" key="order.list.processing" /></a> <a
							class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#pending" role="tab" aria-selected="false"><fmt:message bundle="${bnd}" key="order.list.P" /></a> <a class="nav-item nav-link" id="nav-contact-tab"
							data-toggle="tab" href="#Cancel" role="tab"
							aria-selected="false"><fmt:message bundle="${bnd}" key="order.list.C" /></a>
						
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="Accept"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="msg_list_main">
							<ul class="msg_list">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th><b><fmt:message bundle="${bnd}" key="order.id" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.inf" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.total" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.Note" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.status" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.detail" /></b></th>
										
											<!-- Thêm các cột khác theo nhu cầu -->
										</tr>
									</thead>
									<tbody>
											<c:set var="orders"
												value="${acceptOrders}" />

											<c:forEach var="order" items="${orders}">
												<tr class="odd gradeX">
													<td>${order.oderId}</td>
													<td class="address-column"><fmt:message
															bundle="${bnd}" key="order.name" />:
														${order.nameConsignee}. <fmt:message bundle="${bnd}"
															key="order.address" /> ${order.address}. <fmt:message
															bundle="${bnd}" key="order.phone" />:
														${order.phoneConsignee}</td>

													<c:set var="subtotal" value="0" />
													<c:forEach var="item"
														items="${orderDetailDao.selectByOrderId(order.oderId)}">
														<c:set var="itemTotal"
															value="${item.products.price * item.quantity}" />
														<c:set var="subtotal" value="${subtotal + itemTotal}" />
													</c:forEach>

													<td><c:out value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
													<td>${order.note}</td>
													<td>${order.status}</td>
													<td><a
														href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																bundle="${bnd}" key="order.de" /></a></td>

																
												</tr>
											</c:forEach>
									</tbody>
								</table>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="processing" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th><b><fmt:message bundle="${bnd}" key="order.id" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.inf" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.total" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.Note" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.status" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.detail" /></b></th>
														<th><b><fmt:message bundle="${bnd}" key="order.cancel" /></b></th>
	
										</tr>
									</thead>
									<tbody>
											<c:set var="orders"
												value="${processingOrders}" />

											<c:forEach var="order" items="${orders}">
												<tr class="odd gradeX">
													<td>${order.oderId}</td>
													<td class="address-column"><fmt:message
															bundle="${bnd}" key="order.name" />:
														${order.nameConsignee}. <fmt:message bundle="${bnd}"
															key="order.address" /> ${order.address}. <fmt:message
															bundle="${bnd}" key="order.phone" />:
														${order.phoneConsignee}</td>

													<c:set var="subtotal" value="0" />
													<c:forEach var="item"
														items="${orderDetailDao.selectByOrderId(order.oderId)}">
														<c:set var="itemTotal"
															value="${item.products.price * item.quantity}" />
														<c:set var="subtotal" value="${subtotal + itemTotal}" />
													</c:forEach>

													<td><c:out value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
													<td>${order.note}</td>
													<td>${order.status}</td>
													<td><a
														href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																bundle="${bnd}" key="order.de" /></a></td>
													<td>
    <form action="${pageContext.request.contextPath}/CancelOrder" method="post">
        <input type="hidden" name="orderId" value="${order.oderId}">
        <input type="submit" name="action" value="Cancel" onclick="cancelOrder('${order.oderId}')">
    </form>
</td>
																
													<!-- Thêm các cột khác theo nhu cầu -->
												</tr>
											</c:forEach>
									</tbody>
								</table>
					</div>
					<div class="tab-pane fade" id="pending" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th><b><fmt:message bundle="${bnd}" key="order.id" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.inf" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.total" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.Note" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.status" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.detail" /></b></th>
	
										</tr>
									</thead>
									<tbody>
											<c:set var="orders"
												value="${pendingOrders}" />

											<c:forEach var="order" items="${orders}">
												<tr class="odd gradeX">
													<td>${order.oderId}</td>
													<td class="address-column"><fmt:message
															bundle="${bnd}" key="order.name" />:
														${order.nameConsignee}. <fmt:message bundle="${bnd}"
															key="order.address" /> ${order.address}. <fmt:message
															bundle="${bnd}" key="order.phone" />:
														${order.phoneConsignee}</td>

													<c:set var="subtotal" value="0" />
													<c:forEach var="item"
														items="${orderDetailDao.selectByOrderId(order.oderId)}">
														<c:set var="itemTotal"
															value="${item.products.price * item.quantity}" />
														<c:set var="subtotal" value="${subtotal + itemTotal}" />
													</c:forEach>

													<td><c:out value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
													<td>${order.note}</td>
													<td>${order.status}</td>
													<td><a
														href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																bundle="${bnd}" key="order.de" /></a></td>

																
													<!-- Thêm các cột khác theo nhu cầu -->
												</tr>
											</c:forEach>
									</tbody>
								</table>
					</div>
					<div class="tab-pane fade" id="Cancel" role="tabpanel"
						aria-labelledby="nav-contact-tab">
						<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th><b><fmt:message bundle="${bnd}" key="order.id" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.inf" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.total" /></b></th>
											<th><b><fmt:message bundle="${bnd}" key="order.Note" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.status" /></b></th>
											<th><b><fmt:message bundle="${bnd}"
														key="order.detail" /></b></th>
											<!-- Thêm các cột khác theo nhu cầu -->
										</tr>
									</thead>
									<tbody>
											<c:set var="orders"
												value="${cancelOrders}" />

											<c:forEach var="order" items="${orders}">
												<tr class="odd gradeX">
													<td>${order.oderId}</td>
													<td class="address-column"><fmt:message
															bundle="${bnd}" key="order.name" />:
														${order.nameConsignee}. <fmt:message bundle="${bnd}"
															key="order.address" /> ${order.address}. <fmt:message
															bundle="${bnd}" key="order.phone" />:
														${order.phoneConsignee}</td>

													<c:set var="subtotal" value="0" />
													<c:forEach var="item"
														items="${orderDetailDao.selectByOrderId(order.oderId)}">
														<c:set var="itemTotal"
															value="${item.products.price * item.quantity}" />
														<c:set var="subtotal" value="${subtotal + itemTotal}" />
													</c:forEach>

													<td><c:out value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
													<td>${order.note}</td>
													<td>${order.status}</td>
													<td><a
														href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																bundle="${bnd}" key="order.de" /></a></td>

																
													<!-- Thêm các cột khác theo nhu cầu -->
												</tr>
											</c:forEach>
								</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>
</c:forEach>

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
<script>
function cancelOrder(orderId) {
    var confirmed = confirm("Bạn có chắc chắn muốn hủy đơn hàng?");
    if (confirmed) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    // Update the interface if necessary
                    location.reload();
                } else {
                    alert("Failed to cancel order. Please try again.");
                }
            }
        };
        xhr.open("POST", "${pageContext.request.contextPath}/CancelOrder", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("orderId=" + encodeURIComponent(orderId) + "&action=Cancel");
    }
}
</script>

</html>