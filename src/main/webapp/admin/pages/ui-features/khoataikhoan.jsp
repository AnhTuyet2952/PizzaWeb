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
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  

<!-- Tháº» nÃºt trong báº£ng -->


  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.html -->
       <jsp:include page="/admin/nav_bar.jsp" />
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.html -->
        
        <jsp:include page="/admin/fixed-top.jsp" />
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> ChÃºc báº¡n má»t ngÃ y tá»t lÃ nh </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="khoamotaikhoan.html">TrÆ°á»c</a></li>
                  <li class="breadcrumb-item"><a href="khoataikhoan.html">Sau</a></li>
                  
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-lg-12 grid-margin">
                <div class="card">
                  <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body">
                        <h4 class="card-title">Danh sÃ¡ch nhá»¯ng ngÆ°á»i dÃ¹ng</h4> <div class="search-container">
                          <input type="text" id="search" placeholder="Search...">
                          <button onclick="search()">Search</button>
                      </div>
                        <p class="card-description"> 
                        </p>
                        <div class="table-responsive">
                          <table class="table table-striped">
                            <thead>
                              <tr>
                                <th> User </th>
                                <th> First name </th>
                                <th> Progress </th>
                                <th> key </th>
                                <th> Date </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-1.png" alt="image" />
                                </td>
                                <td> Herman Beck </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                              
                                <td> May 15, 2015 </td>
                              </tr>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-2.png" alt="image" />
                                </td>
                                <td> Messsy Adam </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                                <td> July 1, 2015 </td>
                              </tr>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-3.png" alt="image" />
                                </td>
                                <td> John Richards </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                                <td> Apr 12, 2015 </td>
                              </tr>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-4.png" alt="image" />
                                </td>
                                <td> Peter Meggik </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                                <td> May 15, 2015 </td>
                              </tr>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-1.png" alt="image" />
                                </td>
                                <td> Edward </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                                <td> May 03, 2015 </td>
                              </tr>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-2.png" alt="image" />
                                </td>
                                <td> John Doe </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                                <td> April 05, 2015 </td>
                              </tr>
                              <tr>
                                <td class="py-1">
                                  <img src="../../assets/images/faces-clipart/pic-3.png" alt="image" />
                                </td>
                                <td> Henry Tom </td>
                                <td>
                                  <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td>
                                  <button type="button" class="btn btn-outline-warning btn-fw">KhÃ³a tÃ i khoáº£n</button>
                              </td>
                                <td> June 16, 2015 </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                  
         
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
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
  </body>
</html>