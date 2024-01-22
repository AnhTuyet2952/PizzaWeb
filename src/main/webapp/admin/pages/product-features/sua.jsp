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
<style>
  .equal-width,
    .description-textarea,
    input[type="text"],
    input[type="number"],
    textarea,
    select {
        width: 50%;
        color: black;
        background-color: white;
        box-sizing: border-box;
        margin-bottom: 10px;
        transition: all 0.3s; /* Add transition for a smoother effect */
        padding: 10px; /* Add padding for better visual appearance */
    }

    .equal-width:focus,
    input[type="text"]:focus,
    input[type="number"]:focus,
    .description-textarea:focus,
    textarea:focus,
    select:focus {
        color: black;
        background-color: white;
    }

</style>
</head>




<body>

	<jsp:useBean id="categoryDAO" class="Database.CategoryDAO"></jsp:useBean>
	<jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>
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
											<h1 class="card-title" >Sửa sản phẩm</h1>
											<p class="card-description"></p>
											<div class="table-responsive">

										<form action="${pageContext.request.contextPath}/editProduct"
											method="post" enctype="multipart/form-data">
											<c:set var="productId" value="${param.id}" />
										<h3><b>Thông tin sản phẩm mã  <label>${productId}</label>:</b></h3>
											<c:set var="pro" value="${productDAO.selectById(productId)}"></c:set>
											<input type="hidden" name="idProduct" id="idProduct"
												value="${productId}">

											<div class="form-group">
												<label style="font-size: 22px">Tên sản phẩm tiếng việt:</label> <input class="form-control equal-width"
													placeholder="please enter Product Name" name="name"
													id="name" value="${pro.nameProduct}" />
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Tên sản phẩm tiếng anh:</label> <input class="form-control equal-width"
													placeholder="please enter Product Name" name="nameen"
													id="nameen" value="${pro.nameProducten}" />
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Giá sản phẩm: </label> <input class="form-control equal-width"
													placeholder="please enter Price" type="number" name="price"
													id="price" value="${pro.price}" />
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Mô tả tiếng việt:  </label> <br>
												<textarea rows="4" cols="50" name="description"
													id="description">${pro.description}</textarea>
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Mô tả tiếng anh:</label> <br>
												<textarea rows="4" cols="50" name="descriptionen"
													id="descriptionen">${pro.descriptionen}</textarea>
											</div>

											<div class="form-group">
												<label style="font-size: 22px">Loại Pizza</label>
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
												<label for="image" style="font-size: 22px">Chọn hình mới</label> <input type="file"
													name="image" id="image" />
											</div>


											<button type="submit" class="btn btn-primary">Sửa</button>
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
