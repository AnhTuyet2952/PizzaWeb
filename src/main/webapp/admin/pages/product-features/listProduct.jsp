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
<!-- End Plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
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
		<div class="content-wrapper full-page-wrad-flexpper  align-items-center auth login-bg" style="margin-top: 100px">
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_navbar.html -->
			
			<jsp:include page="/admin/fixed-top.jsp" />
			<!-- partial -->

			<div id="page-wrapper">
				<div id="page-inner">
					<div class="row">
						<div class="col-md-12">
							<h2>All Product</h2>
							<h5>You can management product in here</h5>

						</div>
					</div>
					<!-- /. ROW  -->
					<hr />

					<div class="row">
						<div class="col-md-12">
							<!-- Advanced Tables -->
							<div class="panel panel-default">
								<div class="panel-heading">Advanced Tables</div>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover"
											id="dataTables-example">
											<thead>
												<tr>
													<th>ID</th>
													<th>Image</th>
													<th>Name</th>
													<th>Price($)</th>
													<th>Category</th>
													<th>Description</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${productDAO.selectAll()}" var="pro">
													<tr class="odd gradeX">
														<td>${pro.idProduct}</td>
														<c:url value="/image?fname=${pro.image }" var="imgUrl"></c:url>
														<td><img height="150" width="200" src="${imgUrl}" /></td>

														<td>${pro.nameProduct }</td>
														<td>${pro.price }</td>
														<td>${pro.category.categoryName }</td>
														<td>${pro.description }</td>
														<td><a
															href="<c:url value='/product/detail?id=${pro.idProduct }'/>"
															class="center">Detail</a> | <a
															href="<c:url value='/admin/pages/product-features/sua.jsp?id=${pro.idProduct }'/>"
															class="center">Edit</a> |<a
															href="<c:url value='/deleteProduct?id=${pro.idProduct }'/>"
															class="center">Delete</a></td>

													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>

								</div>
							</div>
							<!--End Advanced Tables -->
						</div>
					</div>

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
	<!-- partial -->
	</div>
	<!-- main-panel ends -->
	</div>
	</div>
	<!-- page-body-wrapper ends -->
	
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