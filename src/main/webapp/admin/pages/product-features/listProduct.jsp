<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.FormatCurrency"%>
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
<c:set var="userId" value="${customer.getUserId()}" />
	<jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>
	<jsp:useBean id="customerdao" class="Database.UserDAO"></jsp:useBean>
	<c:set var="cus" value="${customerdao.selectById(userId)}"></c:set>
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
											<h4 class="card-title">Danh sách sản phẩm</h4>
											<p class="card-description"></p>
											<div class="table-responsive">
												<table class="table table-striped">
													<thead>
														<tr>
															<th  style="color: white;">ID</th>
															<th  style="color: white;">Hình ảnh</th>
															<th  style="color: white;">Tên sản phẩm</th>
															<th  style="color: white;">Giá (đ)</th>
															<th  style="color: white;">Loại bánh</th>
															<th  style="color: white;">Action</th>
														</tr>
													</thead>
													<tbody>
															<c:forEach items="${productDAO.selectAll()}" var="pro">
														<tr class="odd gradeX">
															<td  style="color: #F0F0F0;">${pro.idProduct}</td>
															<td><img height="150" width="200"
																src="${pageContext.request.contextPath}/${pro.image }" /></td>

															<td  style="color: #F0F0F0;">${pro.nameProduct }</td>
															<td style="color: #F0F0F0;">${FormatCurrency.formatCurrency(pro.price)}</td>
															<td style="width: 50%; color: #F0F0F0;">${pro.category.categoryName }</td>
															<td><a
																href="<c:url value='/admin/pages/product-features/sua.jsp?id=${pro.idProduct }'/>"
																class="center">Sửa</a> |<a
																href="<c:url value='/deleteProduct?id=${pro.idProduct }'/>"
																class="center">Xóa</a>|<a
																href="<c:url value='/admin/pages/product-features/suaAnh.jsp?id=${pro.idProduct }'/>"
																class="center">Sửa ảnh</a></td>

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

				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- content-wrapper ends -->
	<!-- partial:../../partials/_footer.html -->

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
