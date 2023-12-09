<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:setBundle basename="lang.messages" var="bnd"/>
<div class="overlay"></div>
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-3 col-md-6 mb-5 mb-md-5">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2"><fmt:message bundle="${bnd}" key="footer.aboutUs"/></h2>
						<p style="text-align: justify;"><fmt:message bundle="${bnd}" key="footer.aboutUs.content"/></p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-5 mb-md-5">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2"><fmt:message bundle="${bnd}" key="footer.blog"/></h2>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_1.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#"><fmt:message bundle="${bnd}" key="footer.blog.title_1"/></a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> Sept 15,
											2018</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_2.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#"><fmt:message bundle="${bnd}" key="footer.blog.title_2"/></a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> Sept 15,
											2018</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-md-5">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2"><fmt:message bundle="${bnd}" key="footer.services"/></h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block"><fmt:message bundle="${bnd}" key="footer.se.order"/></a></li>
							<li><a href="#" class="py-2 d-block"><fmt:message bundle="${bnd}" key="footer.se.deliver"/></a></li>
							<li><a href="#" class="py-2 d-block"><fmt:message bundle="${bnd}" key="footer.se.qualityfood"/></a></li>
							<li><a href="#" class="py-2 d-block"><fmt:message bundle="${bnd}" key="footer.se.mixes"/></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mb-5 mb-md-5">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2"><fmt:message bundle="${bnd}" key="footer.question"/></h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text"><fmt:message bundle="${bnd}" key="footer.address"/></span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text"><fmt:message bundle="${bnd}" key="footer.phone"/></span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text"><fmt:message bundle="${bnd}" key="footer.email"/></span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>