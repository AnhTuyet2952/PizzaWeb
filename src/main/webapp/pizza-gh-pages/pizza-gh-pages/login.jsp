<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
<link rel="icon" href="images/pizza.png" type="image/png">
<style>
.rq {
	color: red;
}
</style>

<script>
	
</script>
</head>

<body>
<fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd"/>
    <c:set var="customer" value="null" scope="session"></c:set>
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
								<a href="./index.html"
									class="text-nowrap logo-img text-center d-block py-3 w-100">
									<img src="../assets/images/logos/dark-logo.svg" width="180"
									alt="">
								</a>
								
								<p style="font-size: 28px; color: black" class="text-center"><b><fmt:message bundle="${bnd}" key="login.login" /></b></p>
						        <div style="text-align: center;" class="rq" id="baoLoi">${param.error}</div> 
								<div class="text-center" ><span class="rq">${errorBean.getError()}</span></div>
								<form action="${pageContext.request.contextPath}/login" method="post">
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label"><fmt:message bundle="${bnd}" key="login.name" /></label>

										<input class="form-control" type="username" name="username"
											required="required">
									</div>
									<div class="mb-4">
										<label for="exampleInputPassword1" class="form-label"><fmt:message bundle="${bnd}" key="login.pas" /></label>
										<input class="form-control" type="password" name="password" id="password"
											required="required">
									</div>
									<div
										class="d-flex align-items-center justify-content-between mb-4">
										<div class="form-check">
											<input class="form-check-input primary" type="checkbox"
												value="" id="flexCheckChecked" checked> <label
												class="form-check-label text-dark" for="flexCheckChecked">
												<fmt:message bundle="${bnd}" key="login.re" /></label>
										</div>
										<a class="text-primary fw-bold" href="forgotPassword.jsp"><fmt:message bundle="${bnd}" key="login.forgot" /></a>
									</div>
									<input class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2" type="submit" value="<fmt:message bundle="${bnd}" key="login.log" />">
							
									<div class="d-flex align-items-center justify-content-center">
										<p class="fs-4 mb-0 fw-bold"><fmt:message bundle="${bnd}" key="login.create" /></p>
										<a class="text-primary fw-bold ms-2"
											href="./authentication-register.jsp"><fmt:message bundle="${bnd}" key="login.cre" /></a>
									</div>
								</form>
							</div>
						</div>
					</div>
					<form action="${pageContext.request.contextPath}/changeLanguage"
				method="post">
					<fmt:setLocale value="${sessionScope.language}" />
					<!-- Các hình ảnh chuyển ngôn ngữ -->
						<button type="submit" name="lang" value="en"
							style="border: none; padding: 0; background: none; cursor: pointer;">
							<img style="height: 30px; width: 30px;" src="images/england.jpg"
								alt="English" ${sessionScope.language == 'en' ? 'checked' : ''}>
						</button>
						<button type="submit" name="lang" value="vi"
							style="border: none; padding: 0; background: none; cursor: pointer;">
							<img style="height: 30px; width: 30px;"
								src="images/vietnamese.jpg" alt="Tiếng Việt"
								${sessionScope.language == 'vi' ? 'checked' : ''}>
						</button>
						<input type="hidden" name="submitType" value="image">
			</form>
				</div>
			</div>
		</div>
	</div>
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