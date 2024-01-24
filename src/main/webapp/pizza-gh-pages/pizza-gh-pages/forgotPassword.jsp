<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do" rel="stylesheet">

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
<title>Forgot Password</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
<style>
.red {
	color: red;
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
  <fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd"/>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
			
				<div class="forgot">
					<h2><fmt:message bundle="${bnd}" key="forgot.title" /></h2>
					<p><fmt:message bundle="${bnd}" key="forgot.yeucau" /></p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium">1. </span><fmt:message bundle="${bnd}" key="forgot.nhapmail" /></li>
						<li><span class="text-primary text-medium">2. </span><fmt:message bundle="${bnd}" key="forgot.otp" /></li>
						<li><span class="text-primary text-medium">3. </span><fmt:message bundle="${bnd}" key="forgot.nhanotp" /></li>
					</ol>
				</div>
				<form class="card mt-4" action="${pageContext.request.contextPath}/forgotPassword" method="POST">
					<div class="card-body">
						<div class="form-group">
						<div style="text-align: center;" class="rq" id="baoLoi">${param.error}</div> 
					
							<label for="email-for-pass"><fmt:message bundle="${bnd}" key="forgot.email" /></label> <input
								class="form-control" type="email" name="email" id="email-for-pass" required="required"><small
								class="form-text text-muted"><fmt:message bundle="${bnd}" key="forgot.guiotp" />p</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit"><fmt:message bundle="${bnd}" key="forgot.taomk" /></button>
						<a class="btn btn-danger" href="login.jsp"><fmt:message bundle="${bnd}" key="forgot.return" /></a>
					</div>
				</form>
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
	<footer class="ftco-footer ftco-section img">
    	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/footer.jsp" />
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>