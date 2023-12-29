<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<title>Pizza - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style>
.rq {
	color: red;
}
</style>

<script>
	
</script>
</head>

<body>
	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />

	<!-- END nav -->
	<!--  Body Wrapper -->

	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<div
			class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
			<div class="d-flex align-items-center justify-content-center w-100">
				<div class="row justify-content-center w-100">
					<div class="col-md-8 col-lg-6 col-xxl-3">
						<div class="card mb-0">
							<div class="card-body">
								<p class="text-center">Thay đổi thông tin cá nhân</p>
								<div style="text-align: center;" class="rq" id="baoLoi">${param.error}</div>
								<div class="text-center">
									<span class="rq"> ${Error}</span>
								</div>
								<form class="form"
									action="${pageContext.request.contextPath}/changeInformation"
									method="post">
									<input type="hidden" name="customerId" value="${customer.userId}">
									<div class="mb-3">
										<label for="username" class="form-label">Username</label> <input
											type="text" class="form-control" id="username"
											name="username" aria-describedby="textHelp"
											required="required">
									</div>
									<div class="mb-3">
										<label class="form-label">Giới tính</label>
										<div class="form-check">
											<input type="radio" class="form-check-input" id="nam"
												name="gender" value="Nam" required="required"> <label
												class="form-check-label" for="nam">Nam</label>
										</div>
										<div class="form-check">
											<input type="radio" class="form-check-input" id="nu"
												name="gender" value="Nữ" required="required"> <label
												class="form-check-label" for="nu">Nữ</label>
										</div>
										<div class="form-check">
											<input type="radio" class="form-check-input" id="nu"
												name="gender" value="Khác" required="required"> <label
												class="form-check-label" for="khac">Khác</label>
										</div>
									</div>
									<div class="mb-3">
										<label for="birthday" class="form-label">Ngày sinh</label> <input
											type="date" class="form-control" id="birthday"
											name="birthday" aria-describedby="textHelp"
											required="required">
									</div>
									<div class="mb-3">
										<label for="phoneNumber" class="form-label">Số điện thoại</label> <input
											type="number" class="form-control" id="phoneNumber"
											name="phoneNumber" aria-describedby="textHelp"
											required="required">
									</div>
									<div class="mb-3">
										<label for="email" class="form-label">Email</label> <input
											type="email" class="form-control" id="email"
											name="email" aria-describedby="textHelp"
											required="required">
									</div>

									<input type="submit" name="submit"
										class="btn btn-primary form-control" value="Cập nhật thông tin"
										style="display: hidden;">

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>

		<footer class="ftco-footer ftco-section img">
			<jsp:include page="/pizza-gh-pages/pizza-gh-pages/footer.jsp" />
		</footer>
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery-migrate-3.0.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.waypoints.min.js"></script>
		<script src="js/jquery.stellar.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/aos.js"></script>
		<script src="js/jquery.animateNumber.min.js"></script>
		<script src="js/bootstrap-datepicker.js"></script>
		<script src="js/jquery.timepicker.min.js"></script>
		<script src="js/scrollax.min.js"></script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="js/google-map.js"></script>
		<script src="js/main.js"></script>
</body>

</html>