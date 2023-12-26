<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<nav <fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd"/>
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="index.html"><span
			class="flaticon-pizza-1 mr-1"></span>
		<fmt:message bundle="${bnd}" key="header.logo_pizza" /><br> <small><fmt:message
					bundle="${bnd}" key="header.logo_royal" /></small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span>
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="index.jsp" class="nav-link"><fmt:message
							bundle="${bnd}" key="header.home.title" /></a></li>
				<li class="nav-item"><a href="menu.jsp" class="nav-link"><fmt:message
							bundle="${bnd}" key="header.menu.title" /></a></li>
				<li class="nav-item"><a href="services.jsp" class="nav-link"><fmt:message
							bundle="${bnd}" key="header.service.title" /></a></li>
				<li class="nav-item"><a href="blog.jsp" class="nav-link"><fmt:message
							bundle="${bnd}" key="header.blog.title" /></a></li>
				<li class="nav-item "><a href="about.jsp" class="nav-link"><fmt:message
							bundle="${bnd}" key="header.about.title" /></a></li>
				<li class="nav-item"><a href="contact.jsp" class="nav-link"><fmt:message
							bundle="${bnd}" key="header.contact.title" /></a></li>
				<c:if test="${not empty admin}">
					<li class="nav-item"><a
						href="/pizza_web/admin/index.jsp"
						class="nav-link"> <fmt:message bundle="${bnd}"
								key="header.admin.title" />
					</a></li>
				</c:if>

			</ul>
			<ul class="custom-navbar-cta navbar-nav ml-auto mb-2 mb-md-0 ms-5">
				<li><a class="nav-link" href="cart.jsp"> <img
						src="images/cart.svg" alt="Cart Icon"> <span
						class="cart-item-count"> <c:choose>
								<c:when test="${empty cart.calculateTotalQuantity()}">
                        0
                    </c:when>
								<c:otherwise>
                        ${cart.calculateTotalQuantity()}
                    </c:otherwise>
							</c:choose>
					</span>
				</a></li>
			</ul>
			<form action="${pageContext.request.contextPath}/changeLanguage"
				method="post">
				<ul style="margin-top: 20px;">
					<fmt:setLocale value="${sessionScope.language}" />
					<!-- Các hình ảnh chuyển ngôn ngữ -->
					<div>
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
					</div>
				</ul>
			</form>



			<ul>
				<li style="padding-left: 5px; padding-top: 10px; margin: 0px;"
					class="nav-item dropdown"><a class="nav-icon-hover"
					href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
					aria-expanded="false"> <img
						style="margin-left: 40px; margin-top: 20px" src="images/cool.png"
						alt="" width="35" height="35" class="rounded-circle">


				</a> <c:choose>
				
						<c:when test="${empty customer && empty admin}">
							<div
								class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
								aria-labelledby="drop2">
								<div class="message-body">
									<a href="login.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-user fs-6"></i>
										<p class="mb-0 fs-3">
											<fmt:message bundle="${bnd}" key="header.login" />
										</p>
									</a> <a href="authentication-register.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-mail fs-6"></i>
										<p class="mb-0 fs-3">
											<fmt:message bundle="${bnd}" key="header.register" />
										</p>
									</a> <a href="forgotPassword.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-mail fs-6"></i>
										<p class="mb-0 fs-3">
											<fmt:message bundle="${bnd}" key="header.forgotpw" />
										</p>
									</a>
								</div>
							</div>
						</c:when>

						<c:otherwise>
							<c:set var="customer" value="${customer}" scope="session"></c:set>
							<p>
								<fmt:message bundle="${bnd}" key="header.hello" />
								
								${customer.username}
							</p>
							<div
								class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
								aria-labelledby="drop2">
								<div class="message-body">
									<a href="profile.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-user fs-6"></i>
										<p class="mb-0 fs-3">
											<fmt:message bundle="${bnd}" key="header.profile" />
										</p>
									</a> 
									 <a href="changePassword.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-list-check fs-6"></i>
										<p class="mb-0 fs-3">
											<fmt:message bundle="${bnd}" key="header.changepw" />
										</p>
									</a> <a href="changeInformation.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-list-check fs-6"></i>
										<p class="mb-0 fs-3">
											<fmt:message bundle="${bnd}" key="header.changeInf" />
										</p>
									</a> <a href="tro_giup.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-list-check fs-6"></i>
										<p class="mb-0 fs-3">Assistant</p>
									</a> </a> <a href="thankyou.jsp"
										class="d-flex align-items-center gap-2 dropdown-item"> <i
										class="ti ti-list-check fs-6"></i>
										<p class="mb-0 fs-3">Đơn đặt hàng</p>
									</a>
									<c:url var="logoutUrl" value="/logout" />
									<a href="${logoutUrl}"
										class="btn btn-outline-primary mx-3 mt-2 d-block"><fmt:message
											bundle="${bnd}" key="header.logout" /></a>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
			</ul>

		</div>
	</div>
	<div>
		<ul class="navbar-nav w-100">
			<li class="nav-item w-100">
				<form action="${pageContext.request.contextPath}/search"
					class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
					<input type="text" id="productName" name="productName"
						class="form-control"
						placeholder="<fmt:message bundle="${bnd}" key="header.search"/>">
					<button type="submit">
						<img src="images/icons8-find-30.png" alt="Search">
					</button>
				</form>


			</li>
		</ul>
	</div>
</nav>