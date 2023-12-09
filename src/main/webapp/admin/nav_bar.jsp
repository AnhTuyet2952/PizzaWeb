<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div
		class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
		<a class="navbar-brand" href="index.html"><span
			class="flaticon-pizza-1 mr-1"></span>Pizza<br> <small>Delicous</small></a>
		<a class="sidebar-brand brand-logo-mini" href="index.jsp"><img
			src="assets/images/logo-mini.svg" alt="logo" /></a>
	</div>
	<ul class="nav">
		<li class="nav-item profile">
			<div class="profile-desc">
				<div class="profile-pic">
					<div class="count-indicator">
						<img class="img-xs rounded-circle "
							src="assets/images/faces/face15.jpg" alt=""> <span
							class="count bg-success"></span>
					</div>
					<div class="profile-name">
						<h5 class="mb-0 font-weight-normal">Admin</h5>
						<span>Gold Member</span>
					</div>
				</div>
				<a href="#" id="profile-dropdown" data-toggle="dropdown"><i
					class="mdi mdi-dots-vertical"></i></a>
				<div
					class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
					aria-labelledby="profile-dropdown">
					<a href="#" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-settings text-primary"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">Account
								settings</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-onepassword  text-info"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">Change
								Password</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-calendar-today text-success"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">To-do
								list</p>
						</div>
					</a>
				</div>
			</div>
		</li>
		<li class="nav-item nav-category"><span class="nav-link">Các
				Chức Năng</span></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="/Pizza/admin/index.jsp"> <span class="menu-icon">
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
						href="/Pizza/admin/pages/ui-features/them.jsp">Thêm</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/ui-features/xoa.jsp">Xóa</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/ui-features/datlaimatkhau.jsp">Đặt
							lại mật khẩu</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/ui-features/khoamotaikhoan.jsp">Khóa
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
						href="/Pizza/admin/pages/product-features/them.jsp">Thêm</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/product-features/listProduct.jsp">Danh sách sản phẩm</a></li>
							
				</ul>
			</div></li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="/Pizza/admin/pages/forms/basic_elements.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-playlist-play"></i>
			</span> <span class="menu-title">Thêm nội dung</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="/Pizza/admin/pages/tables/basic-table.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-table-large"></i>
			</span> <span class="menu-title">Đơn đã mua</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="/Pizza/admin/pages/charts/chartjs.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-chart-bar"></i>
			</span> <span class="menu-title">Báo cáo hoạt động</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="/Pizza/admin/pages/icons/mdi.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-contacts"></i>
			</span> <span class="menu-title">Icons</span>
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
						href="/Pizza/admin/pages/samples/blank-page.jsp"> Blank
							Page </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/samples/error-404.html"> 404 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/samples/error-500.html"> 500 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/samples/login.jsp"> Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Pizza/admin/pages/samples/register.jsp"> Register
					</a></li>
				</ul>
			</div></li>
		<li class="nav-item menu-items"><span class="menu-icon"> <i
				class="mdi mdi-file-document-box"></i>
		</span> <span class="menu-title">Quản lý giao diện</span></li>
	</ul>
</nav>

<!-- partial -->