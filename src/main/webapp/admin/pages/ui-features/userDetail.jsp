<%@page import="Model.Order"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>
<%@ page import="util.FormatCurrency"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Corona Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet" href="../../assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="../../assets/images/favicon.png" />
<style type="text/css">
/* CSS để làm đẹp bảng */
#dataTables-example {
	width: 98%; /* Đặt chiều rộng của bảng */
	margin: 0 auto; /* Căn giữa bảng bằng cách sử dụng margin */
	border-collapse: collapse;
	margin-top: 20px;
	max-height: 300px; /* Đặt chiều cao tối đa của bảng */
	overflow-y: auto;
	/* Cho phép cuộn nếu nội dung vượt quá chiều cao tối đa */
}

#dataTables-example th, #dataTables-example td {
	padding: 8px;
	text-align: center;
	vertical-align: middle;
}

/* CSS để làm đẹp link chi tiết */
#dataTables-example a {
	color: #007bff; /* Màu chữ là màu xanh dương */
	text-decoration: none; /* Loại bỏ đường gạch chân */
}

#dataTables-example a:hover {
	text-decoration: underline; /* Hiệu ứng gạch chân khi di chuột qua */
}

#dataTables-example td.address-column {
	text-align: left;
}
</style>
</head>
<body>
	<fmt:setLocale value="${sessionScope.language}" />
	<fmt:setBundle basename="lang.messages" var="bnd" />
	<jsp:useBean id="userDAO" class="Database.UserDAO" />
	<c:set var="userId" value="${param.id}" />
	<c:set var="user" value="${userDAO.selectById(userId)}" />
	<jsp:useBean id="orderDAO" class="Database.OrderDAO" />
	<jsp:useBean id="orderDetailDao" class="Database.OrderDetailDAO"></jsp:useBean>
	<jsp:useBean id="productDAO" class="Database.ProductDAO"></jsp:useBean>

	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->

		<jsp:include page="/admin/nav_bar.jsp" />
		<!-- partial -->
		<div
			class="content-wrapper full-page-wrad-flexpper  align-items-center auth login-bg"
			style="margin-top: 100px">
			<div class="container-fluid page-body-wrapper">
				<!-- partial:../../partials/_navbar.html -->

				<jsp:include page="/admin/fixed-top.jsp" />
				<!-- partial -->


				<div id="page-wrapper">
					<div id="page-inner">
						<div>
							<h1>${orderId}</h1>
							<div class="col-md-6" style="text-align: left; font-size: 22px">
								<!-- Thông tin khách hàng -->
								<h2>THÔNG TIN NGƯỜI DÙNG</h2>
								<label for="name"> Họ & tên: ${user.name}</label><br> <label
									for="name"> Giới tính : ${user.sexual}</label><br> <label
									for="email"> Email: ${user.email}</label><br> <label
									for="phone"> Số điện thoại:${user.phoneNumber}</label><br>
								<label for="email"> Ngày sinh:
									${customer.birthday.toString()}</label><br>

							</div>

							<div class="col-md-6" style="text-align: left; font-size: 22px">
								<!-- Thông tin đặt hàng -->
								<h2>LỊCH SỬ MUA HÀNG</h2>

								<c:forEach items="${userDAO.selectCustomer()}" var="customer">
									<c:if test="${customer.userId eq user.userId}">
										<c:set var="acceptOrders"
											value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'Accept')}" />
										<c:set var="processingOrders"
											value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'processing')}" />
										<c:set var="pendingOrders"
											value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'Request cancellation')}" />
										<c:set var="cancelOrders"
											value="${orderDAO.selectByCustomerIdAndStatus(customer.userId, 'Cancel')}" />

										<div class="full inner_elements margin_top_30">
											<div class="tab_style2">
												<div class="tabbar">
													<nav>
														<div class="nav nav-tabs" id="nav-tab" role="tablist">
															<a class="nav-item nav-link active" id="nav-home-tab"
																data-toggle="tab" href="#Accept" role="tab"
																aria-selected="true"><fmt:message bundle="${bnd}"
																	key="order.list.A" /></a><a class="nav-item nav-link"
																id="nav-profile-tab" data-toggle="tab"
																href="#processing" role="tab" aria-selected="false"><fmt:message
																	bundle="${bnd}" key="order.list.processing" /></a> <a
																class="nav-item nav-link" id="nav-profile-tab"
																data-toggle="tab" href="#pending" role="tab"
																aria-selected="false"><fmt:message bundle="${bnd}"
																	key="order.list.P" /></a> <a class="nav-item nav-link"
																id="nav-contact-tab" data-toggle="tab" href="#Cancel"
																role="tab" aria-selected="false"><fmt:message
																	bundle="${bnd}" key="order.list.C" /></a>

														</div>
													</nav>
													<div class="tab-content" id="nav-tabContent">
														<div class="tab-pane fade show active" id="Accept"
															role="tabpanel" aria-labelledby="nav-home-tab">
															<div class="msg_list_main">
																<ul class="msg_list">
																	<table
																		class="table table-striped table-bordered table-hover"
																		id="dataTables-example">
																		<thead>
																			<tr>
																				<th><b><fmt:message bundle="${bnd}"
																							key="order.id" /></b></th>
																				<th><b><fmt:message bundle="${bnd}"
																							key="order.inf" /></b></th>
																				<th><b><fmt:message bundle="${bnd}"
																							key="order.total" /></b></th>
																				<th><b><fmt:message bundle="${bnd}"
																							key="order.Note" /></b></th>
																				<th><b><fmt:message bundle="${bnd}"
																							key="order.status" /></b></th>
																				<th><b><fmt:message bundle="${bnd}"
																							key="order.detail" /></b></th>

																				<!-- Thêm các cột khác theo nhu cầu -->
																			</tr>
																		</thead>
																		<tbody>
																			<c:set var="orders" value="${acceptOrders}" />

																			<c:forEach var="order" items="${orders}">
																				<tr class="odd gradeX">
																					<td>${order.oderId}</td>
																					<td class="address-column"><fmt:message
																							bundle="${bnd}" key="order.name" />:
																						${order.nameConsignee}. <fmt:message
																							bundle="${bnd}" key="order.address" />
																						${order.address}. <fmt:message bundle="${bnd}"
																							key="order.phone" />: ${order.phoneConsignee}</td>

																					<c:set var="subtotal" value="0" />
																					<c:forEach var="item"
																						items="${orderDetailDao.selectByOrderId(order.oderId)}">
																						<c:set var="itemTotal"
																							value="${item.products.price * item.quantity}" />
																						<c:set var="subtotal"
																							value="${subtotal + itemTotal}" />
																					</c:forEach>

																					<td><c:out
																							value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
																					<td>${order.note}</td>
																					<td>${order.status}</td>
																					<td><a
																						href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																								bundle="${bnd}" key="order.de" /></a></td>


																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>
																</ul>
															</div>
														</div>
														<div class="tab-pane fade" id="processing" role="tabpanel"
															aria-labelledby="nav-profile-tab">
															<table
																class="table table-striped table-bordered table-hover"
																id="dataTables-example">
																<thead>
																	<tr>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.id" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.inf" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.total" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.Note" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.status" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.detail" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.cancel" /></b></th>

																	</tr>
																</thead>
																<tbody>
																	<c:set var="orders" value="${processingOrders}" />

																	<c:forEach var="order" items="${orders}">
																		<tr class="odd gradeX">
																			<td>${order.oderId}</td>
																			<td class="address-column"><fmt:message
																					bundle="${bnd}" key="order.name" />:
																				${order.nameConsignee}. <fmt:message bundle="${bnd}"
																					key="order.address" /> ${order.address}. <fmt:message
																					bundle="${bnd}" key="order.phone" />:
																				${order.phoneConsignee}</td>

																			<c:set var="subtotal" value="0" />
																			<c:forEach var="item"
																				items="${orderDetailDao.selectByOrderId(order.oderId)}">
																				<c:set var="itemTotal"
																					value="${item.products.price * item.quantity}" />
																				<c:set var="subtotal"
																					value="${subtotal + itemTotal}" />
																			</c:forEach>

																			<td><c:out
																					value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
																			<td>${order.note}</td>
																			<td>${order.status}</td>
																			<td><a
																				href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																						bundle="${bnd}" key="order.de" /></a></td>
																			<td>
																				<form
																					action="${pageContext.request.contextPath}/CancelOrder"
																					method="post">
																					<input type="hidden" name="orderId"
																						value="${order.oderId}"> <input
																						type="submit" name="action" value="Cancel"
																						onclick="cancelOrder('${order.oderId}')">
																				</form>
																			</td>

																			<!-- Thêm các cột khác theo nhu cầu -->
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														<div class="tab-pane fade" id="pending" role="tabpanel"
															aria-labelledby="nav-profile-tab">
															<table
																class="table table-striped table-bordered table-hover"
																id="dataTables-example">
																<thead>
																	<tr>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.id" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.inf" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.total" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.Note" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.status" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.detail" /></b></th>

																	</tr>
																</thead>
																<tbody>
																	<c:set var="orders" value="${pendingOrders}" />

																	<c:forEach var="order" items="${orders}">
																		<tr class="odd gradeX">
																			<td>${order.oderId}</td>
																			<td class="address-column"><fmt:message
																					bundle="${bnd}" key="order.name" />:
																				${order.nameConsignee}. <fmt:message bundle="${bnd}"
																					key="order.address" /> ${order.address}. <fmt:message
																					bundle="${bnd}" key="order.phone" />:
																				${order.phoneConsignee}</td>

																			<c:set var="subtotal" value="0" />
																			<c:forEach var="item"
																				items="${orderDetailDao.selectByOrderId(order.oderId)}">
																				<c:set var="itemTotal"
																					value="${item.products.price * item.quantity}" />
																				<c:set var="subtotal"
																					value="${subtotal + itemTotal}" />
																			</c:forEach>

																			<td><c:out
																					value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
																			<td>${order.note}</td>
																			<td>${order.status}</td>
																			<td><a
																				href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																						bundle="${bnd}" key="order.de" /></a></td>


																			<!-- Thêm các cột khác theo nhu cầu -->
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														<div class="tab-pane fade" id="Cancel" role="tabpanel"
															aria-labelledby="nav-contact-tab">
															<table
																class="table table-striped table-bordered table-hover"
																id="dataTables-example">
																<thead>
																	<tr>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.id" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.inf" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.total" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.Note" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.status" /></b></th>
																		<th><b><fmt:message bundle="${bnd}"
																					key="order.detail" /></b></th>
																		<!-- Thêm các cột khác theo nhu cầu -->
																	</tr>
																</thead>
																<tbody>
																	<c:set var="orders" value="${cancelOrders}" />

																	<c:forEach var="order" items="${orders}">
																		<tr class="odd gradeX">
																			<td>${order.oderId}</td>
																			<td class="address-column"><fmt:message
																					bundle="${bnd}" key="order.name" />:
																				${order.nameConsignee}. <fmt:message bundle="${bnd}"
																					key="order.address" /> ${order.address}. <fmt:message
																					bundle="${bnd}" key="order.phone" />:
																				${order.phoneConsignee}</td>

																			<c:set var="subtotal" value="0" />
																			<c:forEach var="item"
																				items="${orderDetailDao.selectByOrderId(order.oderId)}">
																				<c:set var="itemTotal"
																					value="${item.products.price * item.quantity}" />
																				<c:set var="subtotal"
																					value="${subtotal + itemTotal}" />
																			</c:forEach>

																			<td><c:out
																					value="${FormatCurrency.formatCurrency(subtotal)}" /></td>
																			<td>${order.note}</td>
																			<td>${order.status}</td>
																			<td><a
																				href="${pageContext.request.contextPath}/orderDetail2?orderId=${order.oderId}"><fmt:message
																						bundle="${bnd}" key="order.de" /></a></td>


																			<!-- Thêm các cột khác theo nhu cầu -->
																		</tr>
																	</c:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>



							</div>
						</div>

						<!-- /. PAGE INNER  -->
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
			<!-- partial:../../partials/_footer.html -->
			<footer class="footer">
				<div
					class="d-sm-flex justify-content-center justify-content-sm-between">
					<span
						class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
						Â© bootstrapdash.com 2020</span> <span
						class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
						Free <a
						href="https://www.bootstrapdash.com/bootstrap-admin-template/"
						target="_blank">Bootstrap admin templates</a> from
						Bootstrapdash.com
					</span>
				</div>
			</footer>

			<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>

			<script src="../../assets/js/off-canvas.js"></script>
			<script src="../../assets/js/hoverable-collapse.js"></script>
			<script src="../../assets/js/misc.js"></script>
			<script src="../../assets/js/settings.js"></script>
			<script src="../../assets/js/todolist.js"></script>
			<!-- endinject -->
</body>
</html>