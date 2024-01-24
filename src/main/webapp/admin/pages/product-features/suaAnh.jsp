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


<!-- Tháº» nÃºt trong báº£ng -->


<body>

	<jsp:useBean id="categoryDAO" class="Database.CategoryDAO"></jsp:useBean>
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
											<h1 class="card-title" >Sửa ảnh sản phẩm</h1>
											<p class="card-description"></p>
											<div class="table-responsive">

										<form
											action="${pageContext.request.contextPath}/UploadImageProduct"
											method="post" enctype="multipart/form-data">
											<c:set var="productId" value="${param.id}" />
											<input type="hidden" name="idProduct" id="idProduct"
												value="${productId}">

											<div class="form-group">
												<label for="image">Hình ảnh</label> <input type="file"
													name="image" id="image" />
											</div>

											<button type="submit" class="btn btn-default">Sửa</button>
											<button type="reset" class="btn btn-primary">Reset</button>
										</form>
</div>
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
