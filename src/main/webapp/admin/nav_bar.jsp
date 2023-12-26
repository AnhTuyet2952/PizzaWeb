<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div
		class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
		<a class="navbar-brand" href="index.jsp"><span
			class="flaticon-pizza-1 mr-1"></span>Pizza<br> <small>Delicous</small></a>
		<a class="sidebar-brand brand-logo-mini" href="index.jsp"><img
			src="assets/images/logo-mini.svg" alt="logo" /></a>
	</div>
	<ul class="nav">
		
		<li class="nav-item nav-category"><span class="nav-link">Các
				Chức Năng</span></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="/pizza_web/admin/index.jsp"> <span class="menu-icon">
					<i class="mdi mdi-speedometer"></i>
			</span> <span class="menu-title">Thống Kê</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			data-toggle="collapse" href="#user-management" aria-expanded="false"
			aria-controls="user-management"> <span class="menu-icon"><i
					class="mdi mdi-laptop"></i></span> <span class="menu-title">Quản lý
					người dùng</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="user-management">
				<ul class="nav flex-column sub-menu">
				    <li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/ui-features/listUser.jsp">Danh sách người dùng</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/ui-features/datlaimatkhau.jsp">Đặt
							lại mật khẩu</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/ui-features/khoamotaikhoan.jsp">Khóa
							hoặc mở tài khoản</a></li>
				</ul>
			</div></li>

		<li class="nav-item menu-items"><a class="nav-link"
			data-toggle="collapse" href="#product-management"
			aria-expanded="false" aria-controls="product-management"> <span
				class="menu-icon"><i class="mdi mdi-laptop"></i></span> <span
				class="menu-title">Quản lý sản phẩm</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="product-management">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/product-features/them.jsp">Thêm</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/product-features/listProduct.jsp">Danh sách sản phẩm</a></li>
							
				</ul>
			</div></li>

		
		<li class="nav-item menu-items"><a class="nav-link"
			href="/pizza_web/admin/pages/tables/basic-table.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-table-large"></i>
			</span> <span class="menu-title">Đơn đã mua</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="/pizza_web/admin/pages/charts/chartjs.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-chart-bar"></i>
			</span> <span class="menu-title">Báo cáo hoạt động</span>
		</a></li>
		
		<li class="nav-item menu-items"><a class="nav-link"
			data-toggle="collapse" href="#auth" aria-expanded="false"
			aria-controls="auth"> <span class="menu-icon"> <i
					class="mdi mdi-security"></i>
			</span> <span class="menu-title">Khác</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/samples/error-404.html"> 404 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/samples/error-500.html"> 500 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/samples/login.jsp"> Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/pizza_web/admin/pages/samples/register.jsp"> Register
					</a></li>
				</ul>
			</div></li>
		<li class="nav-item menu-items"><span class="menu-icon"> <i
				class="mdi mdi-file-document-box"></i>
		</span> <span class="menu-title">Quản lý giao diện</span></li>
	</ul>
</nav>

<!-- partial -->
