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
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="../../assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
<style type="text/css">

</style>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->
		<jsp:include page="/admin/nav_bar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_navbar.html -->
			<jsp:include page="/admin/fixed-top.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="page-header">
						<h3 class="page-title">QUẢN LÝ ĐƠN HÀNG</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Tables</a></li>
								<li class="breadcrumb-item active" aria-current="page">quản lý đơn hàng</li>
							</ol>
						</nav>
					</div>
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Đơn hàng cần xác nhận</h4>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th style="color: #CC0000; font-size: 13px; text-align: left;">User</th>
													<th style="color: #CC0000; font-size: 13px">Mã</th>
													<th style="color: #CC0000; font-size: 13px">Tổng</th>
													<th style="color: #CC0000; font-size: 13px">Date</th>
													<th style="color: #CC0000; font-size: 13px">Status</th>
													<th style="color: #CC0000; font-size: 13px">Duyệt</th>

												</tr>
											</thead>
											<tbody>
											<jsp:useBean id="orderDAO1" class="Database.OrderDAO"></jsp:useBean>
												<c:forEach var="order"
													items="${orderDAO1.selectConfirmedOrders()}">
													<tr>
														<td style="color: white; font-size: 13px; text-align: left">${order.user.username}</td>
														<td style="color: #0000FF; font-size: 13px"><a
															href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
														<td style="color: white; font-size: 13px">${FormatCurrency.formatCurrency(order.total)}</td>
															<td style="font-size: 13px">${order.bookingDate}</td>
														<td style="color: red">${order.status}</td>
														<td>
															<form
																action="${pageContext.request.contextPath}/confirmOrder"
																method="post">
																<input type="hidden" name="orderId"
																	value="${order.oderId}"> <input type="submit"
																	name="action" value="Accept"> <input
																	type="submit" name="action" value="Reject">
															</form>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<jsp:useBean id="orderDAO" class="Database.OrderDAO"></jsp:useBean>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Đơn bị hủy</h4>

									<div class="table-responsive">
										<table style="border: 1px" class="table table-hover">
											<thead>
												<tr>
													<th style="color: #CC0000; font-size: 13px; text-align: left;">User</th>
													<th style="color: #CC0000; font-size: 13px">Mã</th>
													<th style="color: #CC0000; font-size: 13px">Tổng</th>
													<th style="color: #CC0000; font-size: 13px">Date</th>
													<th style="color: #CC0000; font-size: 13px">Status</th>
													<th style="color: #CC0000; font-size: 13px">Xóa</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${orderDAO.selectRejectOrders()}">
													<tr>
															<td style="color: white; font-size: 13px; text-align: left">${order.user.username}</td>
														<td style="color: #0000FF; font-size: 13px"><a
															href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
														<td style="color: white; font-size: 13px">${FormatCurrency.formatCurrency(order.total)}</td>
															<td style="font-size: 13px">${order.bookingDate}</td>
														<td style="color: red">${order.status}</td>
														<td><form
																action="${pageContext.request.contextPath}/confirmOrder"
																method="post">
																<input type="hidden" name="orderId"
																	value="${order.oderId}"> <input
																	type="submit" name="action"  value="delete">
															</form></td>
													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
							<jsp:useBean id="orderDAO2" class="Database.OrderDAO"></jsp:useBean>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Tất cả đơn hàng</h4>

									<div class="table-responsive">
										<table style="border: 1px; text-align: center;" class="table table-hover">
											<thead>
												<tr>
													<th style="color: #CC0000; font-size: 13px; text-align: left;">User</th>
													<th style="color: #CC0000; font-size: 13px">Mã</th>
													<th style="color: #CC0000; font-size: 13px">Tổng</th>
													<th style="color: #CC0000; font-size: 13px">Date</th>
													<th style="color: #CC0000; font-size: 13px">Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${orderDAO2.selectAcceptOrders()}">
													<tr>
														<td style="color: white; font-size: 13px; text-align: left">${order.user.username}</td>
														<td style="color: #0000FF; font-size: 13px"><a
															href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
														<td style="color: white; font-size: 13px">${FormatCurrency.formatCurrency(order.total)}</td>
															<td style="font-size: 13px">${order.bookingDate}</td>
														<td style="color: #00FF00">${order.status}</td>
													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>		<jsp:useBean id="orderDAO3" class="Database.OrderDAO"></jsp:useBean>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Đơn yêu cầu hủy</h4>

									<div class="table-responsive">
										<table style="border: 1px" class="table table-hover">
											<thead>
												<tr>
													<th style="color: #CC0000; font-size: 13px; text-align: left;">User</th>
													<th style="color: #CC0000; font-size: 13px">Mã</th>
													<th style="color: #CC0000; font-size: 13px">Tổng</th>
													<th style="color: #CC0000; font-size: 13px">Date</th>
													<th style="color: #CC0000; font-size: 13px">Status</th>
													<th style="color: #CC0000; font-size: 13px">Hủy</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${orderDAO3.selectCancelOrders()}">
													<tr>
														<td style="color: white; font-size: 13px; text-align: left">${order.user.username}</td>
														<td style="color: #0000FF; font-size: 13px"><a
															href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
														<td style="color: white; font-size: 13px">${FormatCurrency.formatCurrency(order.total)}</td>
															<td style="font-size: 13px">${order.bookingDate}</td>
														<td style="color: red">${order.status}</td>
														<td>
															<form
																action="${pageContext.request.contextPath}/CancelAdmin"
																method="post">
																<input type="hidden" name="orderId"
																	value="${order.oderId}"> <input
																	type="submit" name="action" value="Cancelled">
															</form>
														</td>
													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						</div></div>
				<!-- content-wrapper ends -->

			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../../assets/js/off-canvas.js"></script>
	<script src="../../assets/js/hoverable-collapse.js"></script>
	<script src="../../assets/js/misc.js"></script>
	<script src="../../assets/js/settings.js"></script>
	<script src="../../assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<!-- End custom js for this page -->
</body>
</html>
