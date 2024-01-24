<%@page import="Model.Order"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="util.FormatCurrency" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Corona Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="../../assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
</head>
<body>

  <jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>

	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->
		
		<jsp:include page="/admin/nav_bar.jsp" />
			<jsp:include page="/admin/fixed-top.jsp" />
		<!-- partial -->
					<div class="main-panel">
				<div class="content-wrapper">
					<div class="page-header">
						<h3 class="page-title">Chúc bạn một ngày tốt lành</h3>

					</div>
					<div class="row">
						<div class="col-lg-12 grid-margin" >
							<div class="card" >
								<div class="col-lg-12 grid-margin stretch-card" >
									<div class="card" >
										<div class="card-body">
											<div class="col-md-6"
												style="text-align: left; font-size: 22px">
            <jsp:useBean id="orderDao" class="Database.OrderDAO"></jsp:useBean>
            
             <jsp:useBean id="orderDetailDao" class="Database.OrderDetailDAO"></jsp:useBean>
            
             <c:set var="orderId" value="${param.orderId}" />
            <c:set var="order" value="${orderDao.selectById(orderId)}"></c:set>
            <c:set var="userId" value="${param.id}" />
	<c:set var="user" value="${userDAO.selectById(userId)}" />
			<div id="page-wrapper">
				<div id="page-inner">
					<div class="row">
						<div class="col-md-22" style="text-align: left; font-size: 22px">
							<!-- Thông tin khách hàng -->
							<h2 style="color: #FFA500;">Thông tin đơn hàng có mã ${orderId}</h2>
							<h4>Tên user là: <a href="${pageContext.request.contextPath}/userDetail?id=${order.user.userId }">${order.user.username}</a></h4>
							<label for="name"> Họ và tên người nhận: ${order.user.name}</label><br>
							<label for="email"> Email: ${order.user.email}</label><br>
							<label for="phone"> Số điện thoại:
								${order.user.phoneNumber}</label><br>
						</div>

						<div class="col-md-22" style="text-align: left; font-size: 22px">
							<!-- Thông tin đặt hàng -->
							<h2 style="color: #FFA500;">Thông tin đặt hàng</h2>
							<label for="Address"> Địa chỉ: ${order.getAddress()}</label><br>
							<label for="status"> Ghi chú: ${order.getNote()}</label><br>
							<c:set var="subtotal" value="0" />
							<c:set var="total" value="0" />

							<table class="table site-block-order-table mb-5"
								style="text-align: left;border: 2px solid;">
								<tr style="border: 2px solid;">
									<th style="color: #FFA500; font-size: 18px">Product</th>
									<th style="color: #FFA500; font-size: 18px">Total</th>
									</tr>
								<tbody style="border: none">
									<c:forEach var="item" items="${orderDetailDao.selectByOrderId(orderId)}">
										<c:set var="itemTotal"
											value="${item.products.price * item.quantity}" />
										<tr style="border: 2px solid;">
											<td style="color: white; font-size: 18px;"><img 
												src="<c:out value="${pageContext.request.contextPath}/${item.products.image}" />" alt="Image"
												class="img-fluid"> <b><c:out
														value="${item.products.nameProduct}" /></b> <strong
												class="mx-2">x</strong>
											<c:out value="${item.quantity}" /></td>
											<td style="color: red; font-size: 15px"><c:out value="${FormatCurrency.formatCurrency(itemTotal)}" /></td>
										</tr>
										<c:set var="subtotal" value="${subtotal + itemTotal}" />
										<c:set var="total" value="${total + itemTotal}" />
									</c:forEach>
									<tr>
										<td class="text-black font-weight-bold" style="color: #fff; font-size: 15px"><strong>Cart
												Subtotal</strong></td>
										<td class="text-black" style="color: red; font-size: #8B0000"><c:out value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
									</tr>
									<tr style="border: 2px solid;">
										<td class="text-black font-weight-bold" style="color: #fff; font-size: 15px"><strong>Order
												Total</strong></td>
										<td class="text-black font-weight-bold" style="color: red; font-size: 15px"><strong><c:out
													value="${FormatCurrency.formatCurrency(total)}" /></strong></td>
									</tr>
								</tbody>
							</table>

</div></div></div></div></div></div></div></div></div></div>

						</div>
					</div>

			<!-- /. PAGE INNER  -->
		</div>
	</div>
	</div>
	<!-- content-wrapper ends -->
	<!-- partial:../../partials/_footer.html -->
	<footer class="footer">
		<div
			class="d-sm-flex justify-content-center justify-content-sm-between">
			<span
				class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
				Â© bootstrapdash.com 2020</span> <span
				class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
				Free <a
				href="https://www.bootstrapdash.com/bootstrap-admin-template/"
				target="_blank">Bootstrap admin templates</a> from Bootstrapdash.com
			</span>
		</div>
	</footer>

	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
	
	<script src="../../assets/js/off-canvas.js"></script>
	<script src="../../assets/js/hoverable-collapse.js"></script>
	<script src="../../assets/js/misc.js"></script>
	<script src="../../assets/js/settings.js"></script>
	<script src="../../assets/js/todolist.js"></script>
	<!-- endinject -->
</body>
</html>
