<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List,policy.PolicyDao,policy.PolicyBean" %>
<!DOCTYPE html>
<html>
<head>
<% HttpSession s=request.getSession(false);  
        if(s!=null){  
        int id=(Integer)s.getAttribute("id");
        PolicyBean pb = (PolicyBean)s.getAttribute("pb");
        request.setAttribute("id", id);
        request.setAttribute("oldType", pb.getType());
        request.setAttribute("oldName", pb.getName());
        request.setAttribute("oldPrice", pb.getPrice());
        request.setAttribute("oldDuration", pb.getDuration());
        request.setAttribute("oldYI", pb.getYearInterest());
        }  %>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>MyInsurance Management System - Edit Policy</title>
  <!-- Favicon -->
  <link rel="icon" href="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <link href="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/css/font-awesome.css" rel="stylesheet" />
  <link href="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/css/argon-design-system.css?v=1.2.0" rel="stylesheet" />
</head>
<body>
<body class="profile-page">
  <nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
    <div class="container">
      <a class="navbar-brand mr-lg-5" href="../index.html">
        <img src="../assets/img/brand/white.png">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse" id="navbar_global">
        <div class="navbar-collapse-header">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="../../../index.html">
                <img src="../assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        
        <ul class="navbar-nav align-items-lg-center ml-lg-auto">
          
          <li class="nav-item d-none d-lg-block ml-lg-4">
            
            <a href="<%=request.getContextPath()%>/viewAllPolicies.jsp" target="_blank" class="btn btn-neutral btn-icon">
              <span class="btn-inner--icon">
                <i class="fa fa-cloud-download mr-2"></i>
              </span>
              <span class="nav-link-inner--text">View All Policies</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div class="wrapper">
    <section class="section-profile-cover section-shaped my-0" style="height:380px">
      <!-- Circles background -->
      <img class="bg-image" src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/img/pages/mohamed.jpg" style="width: 100%;">
      <!-- SVG separator -->
      <div class="separator separator-bottom separator-skew">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-secondary" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </section>
    <section class="section bg-secondary">
      <div class="container">
        <div class="card shadow mt--300">
          <div class="px-4">
            
            <div class="text-center mt-5">
              <h3>Edit Policy</h3>
              <div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i>Policy <c:out value='${id}' /></div>

            </div>
 <form action="<%= request.getContextPath() %>/policy/updatePolicy?id=<%= s.getAttribute("id") %>" method="post" id="editPolicyForm">
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">Type:</label>
			            <input type="text" class="form-control" name="type" value="${oldType}"/>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Name:</label>
			            <input type="text" class="form-control" name="name" value="${oldName}"/>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Price:</label>
			            <input type="text" class="form-control" name="price" value="${oldPrice}"/>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Duration:</label>
			            <input type="text" class="form-control" name="duration" value="${oldDuration}"/>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Year Interest:</label>
			            <input type="text" class="form-control" name="yi" value="${oldYI}"/>
			          </div>
			          
			          
			    	</form>
            <div class="mt-0 py-5 text-center">
            
              <div class="row justify-content-center">
                <div class="col-lg-12">
                
                <div class="mt-3 col-md-12">
			          	<button class="btn btn-primary" type="button" onClick="$('#editPolicyForm').submit()">Submit</button>
			          </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
   	<footer class="footer">
			      <div class="container">
			        
			        <div class="row align-items-center justify-content-md-between">
			          <div class="col-md-6">
			            <div class="copyright">
			              &copy; 2020 <a href="" target="_blank">Yang Zhang</a>.
			            </div>
			          </div>
			          <div class="col-md-6">
			            <ul class="nav nav-footer justify-content-end">
			              <li class="nav-item">
			                <a href="" class="nav-link" target="_blank">MIT Licence</a>
			              </li>
			              
			            </ul>
			          </div>
			        </div>
			      </div>
			    </footer>
  </div>


  
  <!--   Core JS Files   -->
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/plugins/moment.min.js"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/plugins/datetimepicker.js" type="text/javascript"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/plugins/bootstrap-datepicker.min.js"></script>
  <!-- Control Center for Argon UI Kit: parallax effects, scripts for the example pages etc -->
  <!--  Google Maps Plugin    -->
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurancem/assets/js/argon-design-system.min.js?v=1.2.0" type="text/javascript"></script>
</body>
</html>