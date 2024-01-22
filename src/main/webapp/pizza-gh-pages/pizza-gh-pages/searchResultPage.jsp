<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    .container-wrap {
    }

    .services-wrap {
        margin: 10px;
        padding: 5px; 
    }
    .services-wrap img {
        max-width: 100%; 
        height: auto; 
        border-bottom: 1px solid #ddd; 
    }
    .text {
        padding-top: 20px; 
    }
</style>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />

	
		<c:choose>
		
			<c:when test="${listProductSearchByName.size() == 0}">
			<div class="container" style="margin: 150px; margin-left: 450px; margin-bottom: 50px">
				<img style="margin-left: 250px" src="images/icons8-pizza-80.png" />
				<h3 style="margin-left: 100px">Không tìm thấy kết quả nào</h3>
				<h3 style="color: dark">Hãy thử sử dụng các từ khóa chung chung
					hơn</h3>
			 </div>
			 
			 
			 
			 <jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>
			 <div class="container-wrap">
				<h4 style="color: #fac564; text-align: center;">CÓ THỂ BẠN CŨNG
					THÍCH</h4>
				<div class="row no-gutters d-flex">
        <c:forEach var="productdao" items="${productDAO.selectAllLanguage(sessionScope.language)}">
            <div class="col-lg-4 d-flex ftco-animate">
                <div class="services-wrap d-flex" style="background-color: black">
                    <img class="img alt=" src="${pageContext.request.contextPath}/${productdao.image}">
                    <div class="text p-4" style="background-color: black; color: white">
                        <h3 >${productdao.nameProduct}</h3>
                        <h3 style="color: red;font-size: 25px">${FormatCurrency.formatCurrency(productdao.price)}</h3>
                        <p>${productdao.description}</p>
                        <form class="add-to-cart-form" action="${pageContext.request.contextPath}/addtocart" method="post" id="addToCartForm">
                            <input type="hidden" name="productId" value="${productdao.idProduct}">
                            <input class="ml-2 btn btn-white btn-outline-white" type="submit" value="<fmt:message bundle="${bnd}" key="menu.addcart"/>">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
			
			</c:when>
        
			<c:otherwise>
			<div class="container-wrap">
    <h4 style="color: #fac564; text-align: center;">KẾT QUẢ TÌM KIẾM</h4>
    <div class="row no-gutters d-flex">
        <c:forEach var="product" items="${listProductSearchByName}">
            <div class="col-lg-4 d-flex ftco-animate">
                <div class="services-wrap d-flex" style="background-color: black">
                    <img class="img alt=" src="${pageContext.request.contextPath}/${product.image}">
                    <div class="text p-4" style="background-color: black; color: white">
                        <h3>${product.nameProduct}</h3>
                        <h3 style="color: red;font-size: 25px">${FormatCurrency.formatCurrency(product.price)}</h3>
                        <p>${product.description}</p>
                        <form class="add-to-cart-form" action="${pageContext.request.contextPath}/addtocart" method="post" id="addToCartForm">
                            <input type="hidden" name="productId" value="${product.idProduct}">
                            <input class="ml-2 btn btn-white btn-outline-white" type="submit" value="<fmt:message bundle="${bnd}" key="menu.addcart"/>">
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
			</c:otherwise>

		</c:choose>

	<footer class="ftco-footer ftco-section img">
		<jsp:include page="/pizza-gh-pages/pizza-gh-pages/footer.jsp" />
	</footer>



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