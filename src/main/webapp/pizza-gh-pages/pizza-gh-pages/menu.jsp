<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />
	<!-- END nav -->

	<section class="home-slider owl-carousel img"
		style="background-image: url(images/bg_1.jpg);">

		<div class="slider-item"
			style="background-image: url(images/bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread"><fmt:message bundle="${bnd}" key="menu.title"/></h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.jsp"><fmt:message bundle="${bnd}" key="menu.home"/></a></span> <span><fmt:message bundle="${bnd}" key="menu.menu"/></span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h2 class="mb-4"><fmt:message bundle="${bnd}" key="menu.title"/></h2>
					<p><fmt:message bundle="${bnd}" key="menu.content"/></p>
				</div>
			</div>
		</div>
		
<fmt:setLocale value="${sessionScope.language}" />
<jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>

<div class="container-wrap">
    <div class="row no-gutters d-flex">
        <c:forEach var="productdao" items="${productDAO.selectAllLanguage(sessionScope.language)}">
            <div class="col-lg-4 d-flex ftco-animate">
                <div class="services-wrap d-flex">
                    <a href="#" class="img" style="background-image: url(${productdao.image});"></a>
                    <div class="text p-4">
                        <h3>${productdao.nameProduct}</h3>
                        <p>${productdao.description}</p>
                        <!-- Form to add product to cart -->
                        <form class="add-to-cart-form" action="${pageContext.request.contextPath}/addtocart" method="post" id="addToCartForm">
                            <!-- Your form content -->
                            <input type="hidden" name="productId" value="${productdao.idProduct}">
                            <input class="ml-2 btn btn-white btn-outline-white" type="submit" value="<fmt:message bundle="${bnd}" key="menu.addcart"/>">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
		
	</section>


	<footer class="ftco-footer ftco-section img">
		<jsp:include page="/pizza-gh-pages/pizza-gh-pages/footer.jsp" />
	</footer>

	<!-- Trong trang JSP -->


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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

<script>
         $(document).ready(function () {
                $(".add-to-cart-form").on("submit", function (event) {
                    event.preventDefault();
                    var form = $(this);
                    $.ajax({
                        type: "POST",
                        url: form.attr("action"),
                        data: form.serialize(),
                        success: function (data) {
                           alert("Đã đặt hàng thành công!");
                           var currentQuantity = parseInt($(".cart-item-count").text(), 10);
                           var newQuantity = currentQuantity + 1;
                           $(".cart-item-count").text(newQuantity);
                        },
                        error: function (error) {
                            console.log("Error:", error);
                            alert("Đã đặt lỗi");
                        }
                    });
                });
            });
     </script> 
</body>
</html>