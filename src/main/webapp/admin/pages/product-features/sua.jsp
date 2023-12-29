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
<style type="text/css">

</style>
</head>


<!-- Tháº» nÃºt trong báº£ng -->


<body>

	<jsp:useBean id="categoryDAO" class="Database.CategoryDAO"></jsp:useBean>
	<jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>
	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->
		<jsp:include page="/admin/nav_bar.jsp" />

		<!-- partial -->
		<div id="page-wrapper">

			<jsp:include page="/admin/fixed-top.jsp" />
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Add Product</h2>
						<h5>Add product you can sell</h5>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">SỬA SẢN PHẨM</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-8">
										<form action="${pageContext.request.contextPath}/editProduct"
											method="post" enctype="multipart/form-data">
											<c:set var="productId" value="${param.id}" />
										<h3><b>Thông tin sản phẩm mã  <label>${productId}</label>:</b></h3>
											<c:set var="pro" value="${productDAO.selectById(productId)}"></c:set>
											<input type="hidden" name="idProduct" id="idProduct"
												value="${productId}">

											<div class="form-group">
												<label>Tên sản phẩm tiếng việt:</label> <input class="form-control"
													placeholder="please enter Product Name" name="name"
													id="name" value="${pro.nameProduct}" />
											</div>
											<div class="form-group">
												<label>Tên sản phẩm tiếng anh:</label> <input class="form-control"
													placeholder="please enter Product Name" name="nameen"
													id="nameen" value="${pro.nameProducten}" />
											</div>
											<div class="form-group">
												<label>Giá sản phẩm: </label> <input class="form-control"
													placeholder="please enter Price" type="number" name="price"
													id="price" value="${pro.price}" />
											</div>
											<div class="form-group">
												<label>Mô tả tiếng việt:  </label> <br>
												<textarea rows="4" cols="50" name="description"
													id="description">${pro.description}</textarea>
											</div>
											<div class="form-group">
												<label>Mô tả tiếng anh:</label> <br>
												<textarea rows="4" cols="50" name="descriptionen"
													id="descriptionen">${pro.descriptionen}</textarea>
											</div>

											<div class="form-group">
												<label>Loại Pizza</label>
												<div class="checkbox" style="color: white">
													<select name="category">
														<c:forEach items="${categoryDAO.selectAll()}" var="c">
															<option value="${c.categoryId}"
																${c.categoryId eq pro.category.categoryId ? 'selected' : ''}>${c.categoryName}</option>
														</c:forEach>
													</select>
												</div>

											</div>

											<div class="form-group">
												<label for="image">Chọn hình mới</label> <input type="file"
													name="image" id="image" />
											</div>


											<button type="submit" class="btn btn-primary">Sửa</button>
										</form>
						


									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
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