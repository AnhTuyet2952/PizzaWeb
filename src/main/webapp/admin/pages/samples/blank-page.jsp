<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../../assets/css/templatemo-cyborg-gaming.css">
   
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  <style>
    /* Style for the buttons */
    .action-button {
        background-color: #3498db; /* Blue */
        color: white; /* White text */
        border: none; /* No border */
        padding: 8px 12px; /* Reduced padding for smaller size */
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px; /* Smaller font size */
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px; /* Rounded corners */
        transition: background-color 0.3s; /* Smooth transition on hover */
    }

    /* Hover effect */
    .action-button:hover {
        background-color: #2980b9; /* Darker blue on hover */
    }
</style>
  <body>
   <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.html -->
      <jsp:include page="/admin/nav_bar.jsp" />
      <!-- partial -->
      <div class="col-lg-12 grid-margin stretch-card">
      <jsp:include page="/admin/fixed-top.jsp" />
        <div class="most-popular">
          <div class="row mb-4">
            <div class="col-12 text-center">
              <h2>Nhá»¯ng ná»i dung ÄÃ£ ÄÄng lÃªn</h2>
            </div>
          </div>
              <div  class="row offset-1" style="height: 141px; width: 950px;">
                <div class="col-lg-3 col-sm-1">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                  
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 3px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 3px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;" src="../../assets/images/learn/popular-01.jpg" alt="">
                    <h4>Fortnite<br><span>Sandbox</span></h4>
                    
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-1">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;" src="../../assets/images/learn/popular-02.jpg" alt="">
                    <h4>Fortnite<br><span>Sandbox</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-1">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;"src="../../assets/images/learn/popular-03.jpg" alt="">
                    <h4>Dota2<br><span>Steam-X</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-1">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;" src="../../assets/images/learn/popular-04.jpg" alt="">
                    <h4>CS-GO<br><span>Legendary</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;"src="../../assets/images/learn/popular-05.jpg" alt="">
                    <h4>Dota2<br><span>Steam-X</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                 
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;" src="../../assets/images/learn/popular-06.jpg" alt="">
                    <h4>CS-GO<br><span>Legendary</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                 
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;"src="../../assets/images/learn/popular-07.jpg" alt="">
                    <h4>Dota2<br><span>Steam-X</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                  <div style="background-color: #27292a;
                  padding: 20px 10px;
                  border-radius: 15px;
                  margin-bottom: 15px;
                  height: 95%;
                 
                margin: 0 auto; /* Canh giá»¯a */
                text-align: center;
                margin-left: 2px; /* Khoáº£ng cÃ¡ch giá»¯a hai khung */
                     margin-right: 2px;
                   ">
                    <img style="border-radius: 18px; width: 100%;
                    overflow: hidden;" src="../../assets/images/learn/popular-08.jpg" alt="">
                    <h4>CS-GO<br><span>Legendary</span></h4>
                    <div style="margin-top: 10px;">
                      <button class="action-button" onclick="addFunction()">Add</button>
                      <button class="action-button" onclick="editFunction()">Edit</button>
                      <button class="action-button" onclick="deleteFunction()">Delete</button>
                  </div>
                  </div>
                </div>
              </div>
                
                
        
      </div>
        <!-- ***** Most Popular End ***** -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.html -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
          <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
            <a class="navbar-brand brand-logo-mini" href="../../index.html"><img src="../../assets/images/logo-mini.svg" alt="logo" /></a>
          </div>
          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>
            <ul class="navbar-nav w-100">
              <li class="nav-item w-100">
                <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
                  <input type="text" class="form-control" placeholder="Search products">
                </form>
              </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
              <li class="nav-item dropdown d-none d-lg-block">
                <a class="nav-link btn btn-success create-new-button" id="createbuttonDropdown" data-toggle="dropdown" aria-expanded="false" href="#">+ Create New Project</a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="createbuttonDropdown">
                  <h6 class="p-3 mb-0">Projects</h6>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-file-outline text-primary"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject ellipsis mb-1">Software Development</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-web text-info"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject ellipsis mb-1">UI Development</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-layers text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject ellipsis mb-1">Software Testing</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <p class="p-3 mb-0 text-center">See all projects</p>
                </div>
              </li>
              <li class="nav-item nav-settings d-none d-lg-block">
                <a class="nav-link" href="#">
                  <i class="mdi mdi-view-grid"></i>
                </a>
              </li>
              <li class="nav-item dropdown border-left">
                <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                  <i class="mdi mdi-email"></i>
                  <span class="count bg-success"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                  <h6 class="p-3 mb-0">Messages</h6>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <img src="../../assets/images/faces/face4.jpg" alt="image" class="rounded-circle profile-pic">
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject ellipsis mb-1">Mark send you a message</p>
                      <p class="text-muted mb-0"> 1 Minutes ago </p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <img src="../../assets/images/faces/face2.jpg" alt="image" class="rounded-circle profile-pic">
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject ellipsis mb-1">Cregh send you a message</p>
                      <p class="text-muted mb-0"> 15 Minutes ago </p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <img src="../../assets/images/faces/face3.jpg" alt="image" class="rounded-circle profile-pic">
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject ellipsis mb-1">Profile picture updated</p>
                      <p class="text-muted mb-0"> 18 Minutes ago </p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <p class="p-3 mb-0 text-center">4 new messages</p>
                </div>
              </li>
              <li class="nav-item dropdown border-left">
                <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                  <i class="mdi mdi-bell"></i>
                  <span class="count bg-danger"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                  <h6 class="p-3 mb-0">Notifications</h6>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-calendar text-success"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Event today</p>
                      <p class="text-muted ellipsis mb-0"> Just a reminder that you have an event today </p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-settings text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Settings</p>
                      <p class="text-muted ellipsis mb-0"> Update dashboard </p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-link-variant text-warning"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Launch Admin</p>
                      <p class="text-muted ellipsis mb-0"> New admin wow! </p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <p class="p-3 mb-0 text-center">See all notifications</p>
                </div>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                  <div class="navbar-profile">
                    <img class="img-xs rounded-circle" src="../../assets/images/faces/face15.jpg" alt="">
                    <p class="mb-0 d-none d-sm-block navbar-profile-name">Henry Klein</p>
                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
                  <h6 class="p-3 mb-0">Profile</h6>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-settings text-success"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Settings</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-logout text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Log out</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>
                  <p class="p-3 mb-0 text-center">Advanced settings</p>
                </div>
              </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-format-line-spacing"></span>
            </button>
          </div>
        </nav>
        <!-- partial -->
       
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <script src="../../assets/js/settings.js"></script>
    <script src="../../assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>