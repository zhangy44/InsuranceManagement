<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List,policy.PolicyDao,policy.PolicyBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Welcome to MyInsurance Management System</title>
  <!-- Favicon -->
  <link rel="icon" href="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Argon CSS -->
  <link rel="stylesheet" href="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/css/argon.css?v=1.2.0" type="text/css">
</head>
<body>


 
 
    <!-- Argon Scripts -->
  <body class="bg-default">
  <!-- Navbar -->
<nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
    <div class="container">
      
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse" id="navbar_global">
        
        
        <ul class="navbar-nav align-items-lg-center ml-lg-auto">
          
          <li class="nav-item d-none d-lg-block ml-lg-4">
            
            <a href="viewAllPolicies.jsp" target="_blank" class="btn btn-neutral btn-icon">
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
  <!-- Main content -->
  <div class="main-content">
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white">Employee Login Form</h1>
              
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
        
          <!-- login -->
          <div class="card bg-secondary border-0 mb-0" id="loginArea">
            <div class="card-header bg-transparent pb-5 pt-6"  style="border:none!important">
              <div class="text-center mt-2 mb-3">Please enter your credential</div>
              
            </div>
            <div class="card-body px-lg-5 py-lg-5 pt-0" style="border:none!important;padding-top:0!important">
              
              
              <form action="<%=request.getContextPath()%>/user/login" method="post" role="form" id="loginForm"$>
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control" placeholder="username" type="text" name="username">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password" name="password">
                  </div>
                </div>
                
                <div class="text-center">
                  <button type="button" class="btn btn-primary my-4" onClick="$('#loginForm').submit()">Sign in</button>
                  <button class="btn btn-secondary my-4" onClick="$('#loginArea').hide();$('#signupArea').show();return false;">Register</button>
                </div>
              </form>
            </div>
          </div>
          
          <!-- REGISITER -->
          
          <div class="card bg-secondary border-0 mb-0" id="signupArea" style="display:none">
            <div class="card-header bg-transparent pb-5 pt-6"  style="border:none!important">
              <div class="text-center mt-2 mb-3">Tell us a bit of yourself</div>
              
            </div>
            <div class="card-body px-lg-5 py-lg-5 pt-0" style="border:none!important;padding-top:0!important">
              
              
  
              <form action="<%= request.getContextPath() %>/register" method="post" role="form" id="signupForm">
                <div class="form-group mb-3">
                  <div class="input-group ">
                    <select class="form-control" name="type">
                    	<option value="">I want to be a new client/agent?</option>
				     	<option value="client">Client</option>
				     	<option value="agent">Agent</option>
				     </select>
                    
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="First Name" type="text" name="firstname">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="Last Name" type="text" name="lastname">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="Username" type="text" name="username">
                  </div>
                </div>
                
                
                <div class="form-group">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="Password" type="password" name="password">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    <select class="form-control" name="gender" value="client">
                    	<option value="">Gender</option>
				     	<option value="male">Male</option>
				     	<option value="female">Female</option>
				     </select>
                    
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="Email" type="text" name="email">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="Date of Birth" type="text" name="DOB" class="date" data-mask="00/00/0000">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="Country" type="text" name="country">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="State" type="text" name="state">
                  </div>
                </div>
                <div class="form-group mb-3">
                  <div class="input-group ">
                    
                    <input class="form-control" placeholder="City" type="text" name="city">
                  </div>
                </div>
                <div class="text-center">
                  <button type="button" class="btn btn-primary my-4" onClick="$('#signupForm').submit()">Register</button>
                  <button class="btn btn-secondary my-4" onClick="$('#loginArea').show();$('#signupArea').hide();return false;">Sign in</button>
                </div>
              </form>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
  <!-- Footer -->
  <footer class="py-5" id="footer-main">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
        <div class="col-xl-6">
          <div class="copyright text-center text-xl-left text-muted">
            &copy; 2020 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Yang Zhang</a>
          </div>
        </div>
        <div class="col-xl-6">
          <ul class="nav nav-footer justify-content-center justify-content-xl-end">
            
            <li class="nav-item">
              <a href="#" class="nav-link" target="_blank">MIT License</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>  
  <!-- Core -->
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Argon JS -->
  <script src="https://teamaqua.s3.us-east-2.amazonaws.com/insurance/assets/js/argon.js?v=1.2.0"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>	
    
</body>
</html>