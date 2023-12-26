<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
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
	<fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd" />
	<!-- Start Header/Navigation -->
	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />

	<!-- End Header/Navigation -->

	<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt"></div>
				</div>
				<div class="col-lg-7"></div>
			</div>
		</div>
	</div>

<jsp:useBean id="orderDAO" class="Database.OrderDAO" />
<c:set var="customerId" value="${sessionScope.customer.getCustomerId()}" />
<c:set var="orders" value="${orderDAO.selectByCustomerId(customerId)}" />

<div class="table-responsive">
    <h4 class="card-title">Danh sách sản phẩm đơn hàng</h4>
    <c:forEach var="order" items="${orders}">
        <div class="order-item">
            <h5>Mã đơn hàng: ${order.oderId}</h5>
            <div class="list_oder">
                <jsp:useBean id="orderDetailDAO" class="Database.OrderDetailDAO" />
                <!-- Lưu trữ thông tin chi tiết của đơn hàng hiện tại -->
                <c:set var="currentOrderDetails" value="${orderDetailDAO.selectByOrderId(order.oderId)}"></c:set>

                <!-- Hiển thị chỉ sản phẩm đầu tiên -->
                <c:if test="${not empty currentOrderDetails}">
                    <c:set var="firstProduct" value="${currentOrderDetails[0]}" />
                    <div class="sp">
                        <img style="width: 30px; height: 30px" alt="" src="${firstProduct.products.image}" />
                        <b><c:out value="${(sessionScope.language == 'en') ? firstProduct.products.nameProducten : firstProduct.products.nameProduct}" /></b>x<b>${firstProduct.quantity}</b>
                    </div>

                    <!-- Hiển thị thêm sản phẩm khi bấm vào -->
                    <div class="view-more" onclick="toggleProducts('${order.oderId}')">Xem thêm sản phẩm</div>
                </c:if>

                <!-- Hiển thị đầy đủ sản phẩm ẩn -->
                <c:if test="${not empty currentOrderDetails and currentOrderDetails.size() > 1}">
                    <div class="full-product-list" id="products_${order.oderId}" style="display: none;">
                        <c:forEach var="orderDetail" items="${currentOrderDetails}" begin="1">
                            <c:if test="${orderDetail.products ne null}">
                                <div class="sp">
                                    <img style="width: 30px; height: 30px" alt="" src="${orderDetail.products.image}" />
                                    <b><c:out value="${(sessionScope.language == 'en') ? orderDetail.products.nameProducten : orderDetail.products.nameProduct}" /></b>x<b>${orderDetail.quantity}</b>
                                </div>
                            </c:if>
                        </c:forEach>
                        <!-- Hiển thị nút "Ẩn bớt sản phẩm" ở cuối danh sách sản phẩm -->
                        <div class="view-more" onclick="toggleProducts('${order.oderId}')">Ẩn bớt sản phẩm</div>
                    </div>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>





</body>



<!-- Start Footer Section -->
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
    function toggleProducts(orderId) {
        var productsDiv = document.getElementById('products_' + orderId);
        var viewMoreButton = productsDiv.querySelector('.view-more');

        if (productsDiv.style.display === 'none' || productsDiv.style.display === '') {
            productsDiv.style.display = 'block';
            viewMoreButton.innerHTML = 'Ẩn bớt sản phẩm'; // Đổi nút thành "Ẩn bớt sản phẩm"
        } else {
            productsDiv.style.display = 'none';
            viewMoreButton.innerHTML = 'Xem thêm sản phẩm'; // Đổi nút thành "Xem thêm sản phẩm"
        }

        // Hide the "Xem thêm sản phẩm" button if all products are shown
        var orderDetails = productsDiv.getElementsByClassName('sp');
        var viewMoreButtons = productsDiv.getElementsByClassName('view-more');

        var allProductsVisible = true;
        for (var i = 0; i < orderDetails.length; i++) {
            if (orderDetails[i].style.display !== 'none') {
                allProductsVisible = false;
                break;
            }
        }

        if (allProductsVisible) {
            for (var i = 0; i < viewMoreButtons.length; i++) {
                viewMoreButtons[i].style.display = 'none';
            }
        } else {
            for (var i = 0; i < viewMoreButtons.length; i++) {
                viewMoreButtons[i].style.display = 'block';
            }
        }
    }
</script>
</html>