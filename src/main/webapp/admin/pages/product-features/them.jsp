<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Required meta tags -->
<meta charset="UTF-8">

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
											<h1 class="card-title" >Thêm sản phẩm</h1>
											<p class="card-description"></p>
											<div class="table-responsive">

										<form action="${pageContext.request.contextPath}/addProduct"
											method="post" style="border: "enctype="multipart/form-data">
											<div class="form-group">
												<label style="font-size: 22px">Tên sản phẩm tiếng việt:</label> <input class="form-control equal-width"
												placeholder="Nhập tên tiếng Việt" name="name"
													id="name"/>
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Tên sản phẩm tiếng anh:</label> <input class="form-control equal-width"
													placeholder="Nhập tên tiếng Anh" name="nameen"
													id="nameen"/>
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Giá sản phẩm: </label> <input class="form-control equal-width"
													placeholder="Nhập giá" type="number" name="price"
													id="price" />
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Mô tả tiếng việt:  </label> <br>
												<textarea rows="4" cols="69" name="description" 
													id="description"></textarea>
											</div>
											<div class="form-group">
												<label style="font-size: 22px">Mô tả tiếng anh:</label> <br>
												<textarea rows="4" cols="69" name="descriptionen"
													id="descriptionen"></textarea>
											</div>

											<div class="form-group">
												<label style="font-size: 22px">Chọn loại bánh pizza</label>
												<div class="checkbox" style="color: white">
													<select name="category">
														<c:forEach items="${categoryDAO.selectAll()}" var="c">
															<option value="${c.categoryId}">${c.categoryName}</option>
														</c:forEach>
													</select>
												</div>

											</div>
											<div class="form-group">
												<label style="font-size: 22px">Chọn hình ảnh</label>  <input type="file" name="image" />
											</div>
											<button type="submit" class="btn btn-default">Thêm</button>
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
			<!-- main-panel ends -->
		<!-- page-body-wrapper ends -->
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script>
    document.getElementById("image").addEventListener("change", function() {
        var fileName = this.files[0].name;
        document.getElementById("file-chosen").innerHTML = fileName;
    });
    </script>
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