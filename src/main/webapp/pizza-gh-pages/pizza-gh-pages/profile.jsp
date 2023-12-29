<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<style type="text/css">
.avatar-container {
	position: relative;
	display: inline-block;
}

#editButton {
	position: absolute;
	top: 0;
	right: 0;
	display: none;
	cursor: pointer;
}

.avatar-container:hover #editButton {
	display: block;
}
</style>

</head>
<body>
  <fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
	<jsp:include page="/pizza-gh-pages/pizza-gh-pages/navbar.jsp" />
	<div class="full_container">
		<div class="inner_container">
			<!-- right content -->
			<div id="content">

				<!-- end topbar -->
				<!-- dashboard inner -->
				<div class="midde_cont">
					<div class="container-fluid">
						<div class="row column_title">
							<div class="col-md-12">
								<div class="page_title">
									<h2 style="text-align: center; font-size: 70px"><fmt:message bundle="${bnd}" key="profile.title"/></h2>
								</div>
							</div>
						</div>
						<!-- row -->
						<div class="row column1">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="white_shd full margin_bottom_30">
									<div class="full graph_head">
										<div class="heading1 margin_0">
											<h2><fmt:message bundle="${bnd}" key="profile.user"/></h2>
										</div>
									</div>
									<div class="full price_table padding_infor_info">
										<div class="row">
											<!-- user profile section -->
											<!-- profile image -->
											<div class="col-lg-12">
		<jsp:useBean id="userDAO" class="Database.UserDAO" />
<c:set var="userId" value="${customer.getUserId()}" />
<c:set var="user" value="${userDAO.selectById(userId)}" />

<c:choose>
    <c:when test="${not empty user and not empty user.avatar}">
        <div class="avatar-container" onmouseover="showEditButton()" onmouseout="hideEditButton()">
            <img id="avatarImage" style="width: 180px; height: 180px" src="${pageContext.request.contextPath}/${user.avatar}" alt="User Avatar">
            <button id="editButton" onclick="openFileExplorer()"><fmt:message bundle="${bnd}" key="profile.edit"/></button>
        </div>
        <form id="uploadForm" style="display: none;" action="${pageContext.request.contextPath}/uploadimage" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userId" value="${user.userId}" />
            <label for="avatar"><fmt:message bundle="${bnd}" key="profile.change"/>:</label>
            <input type="file" name="avatar" accept="image/*" onchange="uploadImage()">
            <button type="button" onclick="cancelUpload()"><fmt:message bundle="${bnd}" key="profile.cancel"/></button>
            <button type="button" onclick="submitUpload()"><fmt:message bundle="${bnd}" key="profile.ok"/></button>
        </form>
    </c:when>
    <c:otherwise>
        <div class="avatar-container" onmouseover="showEditButton()" onmouseout="hideEditButton()">
            <img id="avatarImage" style="width: 180px; height: 180px" src="images/cool.png" alt="Default Avatar">
            <button id="editButton" onclick="openFileExplorer()"><fmt:message bundle="${bnd}" key="profile.edit"/></button>
        </div>
        <form id="uploadForm" style="display: none;" action="${pageContext.request.contextPath}/uploadimage" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userId" value="${user.userId}" />
            <label for="avatar"><fmt:message bundle="${bnd}" key="profile.change"/>:</label>
            <input type="file" name="avatar" accept="image/*" onchange="uploadImage()">
            <button type="button" onclick="cancelUpload()"><fmt:message bundle="${bnd}" key="profile.cancel"/></button>
            <button type="button" onclick="submitUpload()"><fmt:message bundle="${bnd}" key="profile.ok"/></button>
        </form>
    </c:otherwise>
</c:choose>

<div class="profile_contant">
    <div class="contact_inner">
        <h3>${user.name}</h3>
        <p>
            <strong><fmt:message bundle="${bnd}" key="profile.about"/>: ${user.name}</strong> 
        </p>
        <ul class="list-unstyled">
            <li><img src="images/icons8-email-32 (1).png">: ${user.email}</li>
            <li><img src="images/icons8-telephone-32.png">: ${user.phoneNumber}</li>
            <li><img src="images/birthday-cake (1).png"> : ${user.birthday.toString()}</li>
            <li><img src="images/sexual-harassment.png"> : ${user.sexual}</li>
        </ul>
    </div>
</div>

													<div class="user_progress_bar">
														<div class="progress_bar">
															<!-- Skill Bars -->
															<span class="skill" style="width: 85%;">Web
																Applications <span class="info_valume">85%</span>
															</span>
															<div class="progress skill-bar ">
																<div
																	class="progress-bar progress-bar-animated progress-bar-striped"
																	role="progressbar" aria-valuenow="85" aria-valuemin="0"
																	aria-valuemax="100" style="width: 85%;"></div>
															</div>
															<span class="skill" style="width: 78%;">Website
																Design <span class="info_valume">78%</span>
															</span>
															<div class="progress skill-bar">
																<div
																	class="progress-bar progress-bar-animated progress-bar-striped"
																	role="progressbar" aria-valuenow="78" aria-valuemin="0"
																	aria-valuemax="100" style="width: 78%;"></div>
															</div>
															<span class="skill" style="width: 47%;">Automation
																& Testing <span class="info_valume">47%</span>
															</span>
															<div class="progress skill-bar">
																<div
																	class="progress-bar progress-bar-animated progress-bar-striped"
																	role="progressbar" aria-valuenow="54" aria-valuemin="0"
																	aria-valuemax="100" style="width: 54%;"></div>
															</div>
															<span class="skill" style="width: 65%;">UI / UX <span
																class="info_valume">65%</span></span>
															<div class="progress skill-bar">
																<div
																	class="progress-bar progress-bar-animated progress-bar-striped"
																	role="progressbar" aria-valuenow="65" aria-valuemin="0"
																	aria-valuemax="100" style="width: 65%;"></div>
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

						<!-- profile contant section -->

						<!-- end row -->
					</div>

					<!-- footer -->

				</div>
				<!-- end dashboard inner -->
			</div>
		</div>
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
	<script type="text/javascript"></script>
	<script type="text/javascript">
		function showEditButton() {
			document.getElementById('editButton').style.display = 'block';
		}

		function hideEditButton() {
			document.getElementById('editButton').style.display = 'none';
		}

		function openFileExplorer() {
			document.getElementById('uploadForm').style.display = 'block';
		}

		function cancelUpload() {
			document.getElementById('uploadForm').style.display = 'none';
		}

		function submitUpload() {
			// Add any additional logic you need before submitting the form
			document.getElementById('uploadForm').submit();
		}

		function uploadImage() {
			// Add any logic you need when an image is selected for upload
		}
	</script>

</body>
</html>