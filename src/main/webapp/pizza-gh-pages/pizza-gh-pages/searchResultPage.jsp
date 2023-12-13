<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
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
</head>
<body>
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
			 
			   <div class="container" style="margin: 150px; margin-top: 0">
			   <h4 style="color: #fac564; margin-bottom:  50px">CÓ THỂ BẠN CŨNG THÍCH</h4>
				<c:forEach var="product" items="${productDAO.selectAll()}">
					<div style="border-left: 100px"
						class="pricing-entry d-flex ftco-animate fadeInUp ftco-animated">
						<div class="img" style="background-image: url(${product.image});"></div>
						<div class="desc pl-3">
							<div class="d-flex text align-items-center">
								<h3>
									<span>${product.nameProduct}</span>
								</h3>
								<span class="price">${product.price}</span>
							</div>
							<div class="d-block">
								<p>${product.description}</p>
							</div>
						</div>
					</div>
				</c:forEach>
              </div>
			
			</c:when>
        
			<c:otherwise>
			
			<div class="container" style="margin: 150px; ">
				<c:forEach var="product" items="${listProductSearchByName}">
					<div style="border-left: 100px"
						class="pricing-entry d-flex ftco-animate fadeInUp ftco-animated">
						<div class="img" style="background-image: url(${product.image});"></div>
						<div class="desc pl-3">
							<div class="d-flex text align-items-center">
								<h3>
									<span>${product.nameProduct}</span>
								</h3>
								<span class="price">${product.price}</span>
								
							</div>
							
							
							<div class="d-block">
								<p>${product.description}</p>
							</div>
						</div>
					</div>
					
					           <form class="add-to-cart-form" action="${pageContext.request.contextPath}/addtocart"
									method="post">
									 <p class="price">
										<span>${product.price}</span> <br> <input
											type="hidden" name="productId"
											value="${product.idProduct}"> <input
											class="ml-2 btn btn-white btn-outline-white" type="submit"
											value="Add to Cart">
									</p>
								</form>
					
				</c:forEach>
              </div>
			</c:otherwise>

		</c:choose>

	</div>
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