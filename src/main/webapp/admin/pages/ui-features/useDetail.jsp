<%@page import="Model.Order"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<!-- partial -->
		<div
			class="content-wrapper full-page-wrad-flexpper  align-items-center auth login-bg"
			style="margin-top: 100px">
			<div class="container-fluid page-body-wrapper">
				<!-- partial:../../partials/_navbar.html -->

				<jsp:include page="/admin/fixed-top.jsp" />
				<!-- partial -->

				<jsp:useBean id="customerDao" class="Database.CustomerDAO"></jsp:useBean>
				<jsp:useBean id="orderDao" class="Database.OrderDAO"></jsp:useBean>

				<jsp:useBean id="orderDetailDao" class="Database.OrderDetailDAO"></jsp:useBean>

				<c:set var="customerId" value="${param.id}" />

				<c:set var="user" value="${customerDao.selectById(customerId)}" />
				
				<div id="page-wrapper">
					<div id="page-inner">
						<div >
							<h1>${orderId}</h1>
							<div class="col-md-6" style="text-align: left; font-size: 22px">
								<!-- Thông tin khách hàng -->
								<h2>THÔNG TIN NGƯỜI DÙNG</h2>
								<label for="name"> Họ & tên: ${user.name}</label><br> <label
									for="name"> Giới tính : ${user.sexual}</label><br> <label
									for="email"> Email: ${user.email}</label><br> <label
									for="phone"> Số điện thoại:${user.phoneNumber}</label><br>
								<label for="email"> Ngày sinh:
									${customer.birthday.toString()}</label><br>

							</div>

							<div class="col-md-6" style="text-align: left; font-size: 22px">
								<!-- Thông tin đặt hàng -->
								<h2>LỊCH SỬ MUA HÀNG</h2>

								<table class="table site-block-order-table mb-5"
									style="text-align: left;">
									<thead>
										<th>Product</th>
										<th>Total</th>
										<th>Status</th>
									</thead>
									<tbody>
										<c:forEach var="order" items="${orderDao.selectByCustomerId(customerId)}">
											<tr>
												<td><a
													href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
												<td class="text-danger">${order.total}<i
													class="mdi mdi-arrow-down"></i></td>
												<td><label class="badge badge-danger">${order.status}</label></td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>



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
						target="_blank">Bootstrap admin templates</a> from
						Bootstrapdash.com
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
/html>