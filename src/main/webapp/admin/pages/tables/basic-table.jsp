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
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="../../assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
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
						<h3 class="page-title">Basic Tables</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Tables</a></li>
								<li class="breadcrumb-item active" aria-current="page">Basic
									tables</li>
							</ol>
						</nav>
					</div>
					<input type="hidden" name="order_Id" value="${order.orderId}">
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Đơn hàng cần xác nhận</h4>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
												   <th>Time Order</th>
													<th>User</th>
													<th>Product</th>
													<th>Price</th>
													<th>Status</th>
													<th>Action</th>

												</tr>
											</thead>
											<tbody>
											<jsp:useBean id="orderDAO1" class="Database.OrderDAO"></jsp:useBean>
												<c:forEach var="order"
													items="${orderDAO1.selectConfirmedOrders()}">
													<tr>
													    <td>${order.bookingDate.toString()}</td>
														<td>${order.user.username}</td>
														<td><a
															href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
														<td class="text-danger">${order.total}<i
															class="mdi mdi-arrow-down"></i></td>
														<td><label class="badge badge-danger">${order.status}</label>
														</td>
														<td>
															<form action="${pageContext.request.contextPath}/confirmOrder" method="post">
																<input type="hidden" name="orderId" value="${order.oderId}"> <input type="submit" name="action" value="accept">
																 <input type="submit" name="action" value="reject">
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
									<h4 class="card-title">Tất cả đơn hàng</h4>

									<div class="table-responsive">
										<table style="border: 1px" class="table table-hover">
											<thead>
												<tr>
												    <th>Time Order</th>
													<th>User</th>
													<th>Product</th>
													<th>Price</th>
													<th>Status</th>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach var="order" items="${orderDAO.selectAcceptOrders()}">
													<tr>
													    <td>${order.bookingDate.toString()}</td>
														<td>${order.user.username}</td>
														<td><a href="${pageContext.request.contextPath}/orderDetail?orderId=${order.oderId}">${order.oderId}</a></td>
														<td class="text-danger">${order.total}<i
															class="mdi mdi-arrow-down"></i></td>
														<td><label class="badge badge-danger">${order.status}</label></td>
													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Striped Table</h4>
									<p class="card-description">
										Add class
										<code>.table-striped</code>
									</p>
									<div class="table-responsive">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>User</th>
													<th>First name</th>
													<th>Progress</th>
													<th>Amount</th>
													<th>Deadline</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-1.png"
														alt="image" /></td>
													<td>Herman Beck</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-success" role="progressbar"
																style="width: 25%" aria-valuenow="25" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-2.png"
														alt="image" /></td>
													<td>Messsy Adam</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar"
																style="width: 75%" aria-valuenow="75" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$245.30</td>
													<td>July 1, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-3.png"
														alt="image" /></td>
													<td>John Richards</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 90%" aria-valuenow="90" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$138.00</td>
													<td>Apr 12, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-4.png"
														alt="image" /></td>
													<td>Peter Meggik</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-primary" role="progressbar"
																style="width: 50%" aria-valuenow="50" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-1.png"
														alt="image" /></td>
													<td>Edward</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar"
																style="width: 35%" aria-valuenow="35" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 160.25</td>
													<td>May 03, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-2.png"
														alt="image" /></td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: 65%" aria-valuenow="65" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 123.21</td>
													<td>April 05, 2015</td>
												</tr>
												<tr>
													<td class="py-1"><img
														src="../../assets/images/faces-clipart/pic-3.png"
														alt="image" /></td>
													<td>Henry Tom</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Bordered table</h4>
									<p class="card-description">
										Add class
										<code>.table-bordered</code>
									</p>
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>First name</th>
													<th>Progress</th>
													<th>Amount</th>
													<th>Deadline</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Herman Beck</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-success" role="progressbar"
																style="width: 25%" aria-valuenow="25" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Messsy Adam</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar"
																style="width: 75%" aria-valuenow="75" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$245.30</td>
													<td>July 1, 2015</td>
												</tr>
												<tr>
													<td>3</td>
													<td>John Richards</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 90%" aria-valuenow="90" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$138.00</td>
													<td>Apr 12, 2015</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Peter Meggik</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-primary" role="progressbar"
																style="width: 50%" aria-valuenow="50" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td>5</td>
													<td>Edward</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar"
																style="width: 35%" aria-valuenow="35" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 160.25</td>
													<td>May 03, 2015</td>
												</tr>
												<tr>
													<td>6</td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: 65%" aria-valuenow="65" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 123.21</td>
													<td>April 05, 2015</td>
												</tr>
												<tr>
													<td>7</td>
													<td>Henry Tom</td>
													<td>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																style="width: 20%" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Inverse table</h4>
									<p class="card-description">
										Add class
										<code>.table-dark</code>
									</p>
									<div class="table-responsive">
										<table class="table table-dark">
											<thead>
												<tr>
													<th>#</th>
													<th>First name</th>
													<th>Amount</th>
													<th>Deadline</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Herman Beck</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Messsy Adam</td>
													<td>$245.30</td>
													<td>July 1, 2015</td>
												</tr>
												<tr>
													<td>3</td>
													<td>John Richards</td>
													<td>$138.00</td>
													<td>Apr 12, 2015</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Peter Meggik</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr>
													<td>5</td>
													<td>Edward</td>
													<td>$ 160.25</td>
													<td>May 03, 2015</td>
												</tr>
												<tr>
													<td>6</td>
													<td>John Doe</td>
													<td>$ 123.21</td>
													<td>April 05, 2015</td>
												</tr>
												<tr>
													<td>7</td>
													<td>Henry Tom</td>
													<td>$ 150.00</td>
													<td>June 16, 2015</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Table with contextual classes</h4>
									<p class="card-description">
										Add class
										<code>.table-{color}</code>
									</p>
									<div class="table-responsive">
										<table class="table table-bordered table-contextual">
											<thead>
												<tr>
													<th>#</th>
													<th>First name</th>
													<th>Product</th>
													<th>Amount</th>
													<th>Deadline</th>
												</tr>
											</thead>
											<tbody>
												<tr class="table-info">
													<td>1</td>
													<td>Herman Beck</td>
													<td>Photoshop</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr class="table-warning">
													<td>2</td>
													<td>Messsy Adam</td>
													<td>Flash</td>
													<td>$245.30</td>
													<td>July 1, 2015</td>
												</tr>
												<tr class="table-danger">
													<td>3</td>
													<td>John Richards</td>
													<td>Premeire</td>
													<td>$138.00</td>
													<td>Apr 12, 2015</td>
												</tr>
												<tr class="table-success">
													<td>4</td>
													<td>Peter Meggik</td>
													<td>After effects</td>
													<td>$ 77.99</td>
													<td>May 15, 2015</td>
												</tr>
												<tr class="table-primary">
													<td>5</td>
													<td>Edward</td>
													<td>Illustrator</td>
													<td>$ 160.25</td>
													<td>May 03, 2015</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
