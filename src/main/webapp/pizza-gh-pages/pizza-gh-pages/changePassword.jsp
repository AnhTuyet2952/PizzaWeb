<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />
  <fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd"/>


    <!-- END nav -->
  <!--  Body Wrapper -->
  
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                
                <p style="font-size: 18px; color: black" class="text-center"><b><fmt:message bundle="${bnd}" key="change.title" /></b></p>
                <div style="text-align: center;" class="rq" id="baoLoi">${param.error}</div> 
                <div class="text-center" ><span class="rq"> ${Error}</span></div>
                <form class="form" action="${pageContext.request.contextPath}/changePassword" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label"><fmt:message bundle="${bnd}" key="login.name" /></label>
                    <input type="text" class="form-control" id="username" name="username" aria-describedby="textHelp" required="required" value=${username}>
                  </div>
                 <div class="mb-3">
                    <label for="password" class="form-label"><fmt:message bundle="${bnd}" key="login.pas" /></label>
                    <input type="password" class="form-control" id="" name="password" aria-describedby="textHelp" required="required" value="  ">
                   
										
                  </div>
                  <div class="mb-4">
                    <label for="password" class="form-label"><fmt:message bundle="${bnd}" key="change.newpass" /></label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword"required="required" onkeyup="kiemTraMatKhau()">
                  </div>
                  <div class="mb-4">
                    <label for="enterTheNewPassword" class="form-label"><fmt:message bundle="${bnd}" key="register.pass" />
                    <span  id="msg" class="red" ></span></label>
                    <input type="password" class="form-control" id="enterTheNewPassword" name="enterTheNewPassword"required="required" onkeyup="kiemTraMatKhau()">
                  </div>
                 
                  <input type="submit" name="submit"  class="btn btn-primary form-control" value="<fmt:message bundle="${bnd}" key="change.change" />" style="display : hidden;">

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
<script type="text/javascript">
  
    
function kiemTraMatKhau() {
    matKhau = document.getElementById("newPassword").value;
    matKhauNhapLai = document.getElementById("enterTheNewPassword").value;
    
    if (matKhau != matKhauNhapLai) {
        document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
        return false;
    } else {
        document.getElementById("msg").innerHTML = "";
        matKhau =new PasswordEncryption().toSHA1(matKhau);
        return true;
    }
}

</script>
</html>