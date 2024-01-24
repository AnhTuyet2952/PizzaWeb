<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- End Plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="../../assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
</head>


<!-- Tháº» nÃºt trong báº£ng -->


<body>
	<jsp:useBean id="customerdao" class="Database.UserDAO"></jsp:useBean>
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
						<h3 class="page-title">Chúc bạn một ngày tốt lành</h3>

					</div>
					<div class="row">
						<div class="col-lg-12 grid-margin">
							<div class="card">
								<div class="col-lg-12 grid-margin stretch-card">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title" style="color: #FFA500">Danh sách người dùng</h4>
											<p class="card-description"></p>
											<div class="table-responsive">
												<table class="table table-striped">
													<thead>
														<tr>
															<th style="color: white">Id</th>
															<th style="color: white">User</th>
															<th style="color: white">Username</th>
															<th style="color: white">name</th>
															<th style="color: white">Birthday</th>
															<th style="color: white">Sexual</th>
															<th style="color: white">Email</th>
															<th style="color: white">Phone number</th>
															<th style="color: white">Detail</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${customerdao.selectCustomer()}"
															var="customer">
															<tr>
																<td class="py-1" style="color: white">${customer.userId}</td>
																<td class="py-1" style="color: white"><img height="150" width="200"
																	src="${pageContext.request.contextPath}/${customer.avatar}" />
																</td>
																<td style="color: white">${customer.username }</td>
																<td style="color: white">${customer.name }</td>
																<td style="color: white">${customer.birthday.toString()}</td>
																<td style="color: white">${customer.sexual }</td>
																<td style="color: white">${customer.email}</td>
																<td style="color: white">${customer.phoneNumber }</td>
																<td><a style="color: #FFA500;font-size: 17px"
																	href="${pageContext.request.contextPath}/userDetail?id=${customer.userId }">Chi
																		tiết</a></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<div class="card">
										<div class="card-body">
											<h4 class="card-title" style="color: #FFA500">Danh sách Admin</h4>
											<p class="card-description"></p>
											<div class="table-responsive">
												<table class="table table-striped">
													<thead>
														<tr>
															<th style="color: white">Id</th>
															<th style="color: white">User</th>
															<th style="color: white">Username</th>
															<th style="color: white">name</th>
															<th style="color: white">Birthday</th>
															<th style="color: white">Sexual</th>
															<th style="color: white">Email</th>
															<th style="color: white">Phone number</th>
															<th style="color: white">Detail</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${customerdao.selectAdmin()}"
															var="customer">
															<tr>
																<td class="py-1"  style="color: white">${customer.userId}</td>
																<td class="py-1" style="color: white"><img height="150" width="200"
																	src="${pageContext.request.contextPath}/${customer.avatar}" />
																</td>
																<td style="color: white">${customer.username }</td>
																<td style="color: white">${customer.name }</td>
																<td style="color: white">${customer.birthday.toString()}</td>
																<td style="color: white">${customer.sexual }</td>
																<td style="color: white">${customer.email}</td>
																<td style="color: white">${customer.phoneNumber }</td>
																<td><a style="color: #FFA500;font-size: 17px"
																	href="${pageContext.request.contextPath}/userDetail?id=${customer.userId }">Chi
																		tiết</a></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- partial -->
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
</body>
</html>