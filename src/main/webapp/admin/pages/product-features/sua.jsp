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
							<div class="panel-heading">Edit Product</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<h3>Info Product:</h3>

										<form action="${pageContext.request.contextPath}/editProduct"
											method="post">
											<c:set var="productId" value="${param.id}" />
                                            <input type="hidden" name="idProduct" id = "idProduct" value="${productId}">
											<!-- Utilisez la valeur de productId dans une balise label -->
											<label>${productId}</label>
											<div class="form-group">
												<label>Name:</label> <input class="form-control"
													placeholder="please enter Product Name" name="name"
													id="name" />
											</div>
											<div class="form-group">
												<label>Price ($)</label> <input class="form-control"
													placeholder="please enter Price" type="number" name="price"
													id="price" />
											</div>
											<div class="form-group">
												<label>Description </label> <br>
												<textarea rows="4" cols="50" name="description"
													id="description"></textarea>

											</div>

											<div class="form-group">
												<label>Category</label>
												<div class="checkbox" style="color: white">
													<select name="category">
														<c:forEach items="${categoryDAO.selectAll()}" var="c">
															<option value="${c.categoryId}">${c.categoryName}</option>
														</c:forEach>
													</select>
												</div>

											</div>
											<div class="form-group">
												<label>image</label> <input type="file" name="image" />
											</div>
											<button type="submit" class="btn btn-default">Edit</button>
											<button type="reset" class="btn btn-primary">Reset</button>
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