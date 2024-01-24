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
.red {
	color: red;
}
</style>

<script>
	
</script>
</head>

<body>
  <fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd"/>
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                
                <p style="font-size: 28px; color: black" class="text-center"><b><fmt:message bundle="${bnd}" key="register.title" /></b></p>
                <div style="text-align: center;" class="red" id="baoLoi">${param.error}</div> 
                <div class="red" id="baoLoi">${errorBean.getError()} </div>
                <form class="form" action="${pageContext.request.contextPath}/register" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label"><fmt:message bundle="${bnd}" key="login.name" /></label>
                    <input type="text" class="form-control" id="username" name="username" aria-describedby="textHelp" required="required" value=${username}>
                  </div>
                  <div class="mb-3">
                    <label for="name" class="form-label"><fmt:message bundle="${bnd}" key="register.name" /></label>
                    <input type="text" class="form-control" id="name" name="name" aria-describedby="textHelp"required="required"  value=${name}>
                  </div>
                  <div class="mb-3">
                    <label for="email" class="form-label"><fmt:message bundle="${bnd}" key="register.mail" /></label>
                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp"required="required"value=${email}>
                  </div>
                  <div class="mb-4">
                    <label for="password" class="form-label"><fmt:message bundle="${bnd}" key="login.pas" /></label>
                    <input type="password" class="form-control" id="password" name="password"required="required" onkeyup="kiemTraMatKhau()">
                  </div>
                  <div class="mb-4">
                    <label for="enterThePassword" class="form-label"><fmt:message bundle="${bnd}" key="register.pass" />
                    <span  id="msg" class="red" ></span></label>
                    <input type="password" class="form-control" id="enterThePassword" name="enterThePassword"required="required" onkeyup="kiemTraMatKhau()">
                  </div>
                  <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="agree" name="agree" required="required" onchange="xuLyChonDongY()">
                    <label for="agree" class="form-label"><fmt:message bundle="${bnd}" key="register.agree" /></label>
                    

                  </div>
                  <input type="submit" name="submit"  class="btn btn-primary form-control" value="<fmt:message bundle="${bnd}" key="register.up" />" style="display : hidden;">
                  
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold"><fmt:message bundle="${bnd}" key="register.have" /></p>
                    <a class="text-primary fw-bold ms-2" href="login.jsp"><fmt:message bundle="${bnd}" key="login.log" /></a>
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
<script type="text/javascript">
  
    
function kiemTraMatKhau() {
    matKhau = document.getElementById("password").value;
    matKhauNhapLai = document.getElementById("enterThePassword").value;
    
    if (matKhau != matKhauNhapLai) {
        document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
        return false;
    } else {
        document.getElementById("msg").innerHTML = "";
        matKhau =new PasswordEncryption().toSHA1(matKhau);
        return true;
    }
}

function xuLyChonDongY() {
    dongYDieuKhoan = document.getElementById("agree");
    submitButton = document.getElementById("submit"); // Đã thay đổi để sử dụng ID đúng

    if (dongYDieuKhoan.checked == true) {
        submitButton.style.display  = "visible";
    } else {
        submitButton.style.display  = "hidden";
    }
}


// Thêm sự kiện onchange cho ô đồng ý trong thẻ input
document.getElementById("agree").onchange = xuLyChonDongY;


</script>
</html>