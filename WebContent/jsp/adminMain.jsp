<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List,policy.PolicyDao,policy.PolicyBean,login.LoginDao,login.LoginBean" %>
<!DOCTYPE html>
<html>
	<head>
		<% HttpSession s=request.getSession(false);  
			if(s!=null){  
			String name=(String)s.getAttribute("username");  
			  
			//out.print("Hello, "+name+" Welcome to Profile");  
			}  %>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
		<meta name="author" content="Creative Tim">
		<title>MyInsurance Management System - Admin management page</title>
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
					<a class="navbar-brand mr-lg-5" href="#">
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
								<button type="button" class="btn btn-neutral" data-toggle="modal" data-target="#newPolicyModal">Create New Policy</button>
								
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
						<div class="card card-profile shadow mt--300">
							<div class="px-4">
								<ul class="nav nav-pills mb-0 mt-4" id="pills-tab" role="tablist" style="justify-content:center">
									<li class="nav-item">
										<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Policy Management</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Approve Agents</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">All Agents</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="pills-all-clients-tab" data-toggle="pill" href="#pills-all-clients" role="tab" aria-controls="pills-all-clients" aria-selected="false">All Clients</a>
									</li>
									
								</ul>
								<div class="tab-content" id="pills-tabContent">
									<div class="tab-pane fade show active col-lg-12" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
										<!-- View All Policy -->
										<div class="text-center mt-5">
											<h3>
												<c:out value="${username}" />
											</h3>
											<div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i>Policy Management</div>
										</div>
										<div class="mt-0 py-5 text-center">
											<div class="row justify-content-center">
												<div class="col-lg-12">
													<table class="table">
														
														<%PolicyDao pd = new PolicyDao();
															List<PolicyBean> listPolicies = pd.selectAllPolicies();
															request.setAttribute("listPolicies", listPolicies);
															%>
														<tr>
															<th>ID</th>
															<th>Type</th>
															<th>Name</th>
															<th>Price</th>
															<th>Duration</th>
															<th>Year Interest</th>
															<th>Action</th>
														</tr>
														<c:forEach var="policy" items="${listPolicies}">
															<tr>
																<td>
																	<c:out value="${policy.getId()}" />
																</td>
																<td>
																	<c:out value="${policy.getType()}" />
																</td>
																<td>
																	<c:out value="${policy.getName()}" />
																</td>
																<td>
																	<c:out value="${policy.getPrice()}" />
																</td>
																<td>
																	<c:out value="${policy.getDuration()}" />
																</td>
																<td>
																	<c:out value="${policy.getYearInterest()}" />
																</td>
																<td>
																	<a href="<%= request.getContextPath() %>/policy/editPolicy?id=<c:out value='${policy.getId()}' />">Edit</a>
																	&nbsp;&nbsp;&nbsp;&nbsp;
																	<a href="<%= request.getContextPath() %>/policy/deletePolicy?id=<c:out value='${policy.getId()}' />">Delete</a>                    	
																</td>
															</tr>
														</c:forEach>
													</table>
				
												</div>
											</div>
										</div>
										<!-- END View All Policy -->
									</div>
									<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
										<!-- View All Policy -->
										<div class="text-center mt-5">
											<h3>
												<c:out value="${username}" />
											</h3>
											<div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i>Approve Agent</div>
										</div>
										<div class="mt-0 py-5 text-center">
											<div class="row justify-content-center">
												<div class="col-lg-12">
													<table class="table" >
														
														<%
															LoginDao ld = new LoginDao();
															List<LoginBean> newAgents = ld.ValidateAgent();
															request.setAttribute("newAgents", newAgents);
															%>
														<c:if test = "${!newAgent.isEmpty()}">
															<tr>
																<th>ID</th>
																<th>First Name</th>
																<th>Last Name</th>
																<th>Action</th>
															</tr>
															<c:forEach var="agent" items="${newAgents}">
																<tr>
																	<td>
																		<c:out value="${agent.getProfileID()}" />
																	</td>
																	<td>
																		<c:out value="${agent.getFirstName()}" />
																	</td>
																	<td>
																		<c:out value="${agent.getLastName()}" />
																	</td>
																	<td>
																		<a href="<%= request.getContextPath() %>/user/approveAgent?id=<c:out value='${agent.getProfileID()}' />">Approve</a>
																	</td>
																</tr>
															</c:forEach>
														</c:if>
													</table>
				
												</div>
											</div>
										</div>
										<!-- END View All Policy -->
									</div>
									<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
										<!-- View All Policy -->
										<div class="text-center mt-5">
											<h3>
												<c:out value="${username}" />
											</h3>
											<div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i>All Agent</div>
										</div>
										<div class="mt-0 py-5 text-center">
											<div class="row justify-content-center">
												<div class="col-lg-12">
													<table class="table" >
														
														<%
															List<LoginBean> agents = ld.allClients("agent");
															request.setAttribute("allAgents", agents);
															%>
														<tr>
															<th>ID</th>
															<th>First Name</th>
															<th>Last Name</th>
															<th>Email</th>
															<th>Gender</th>
															<th>Action</th>
														</tr>
														<c:forEach var="agent" items="${allAgents}">
															<tr>
																<td>
																	<c:out value="${agent.getProfileID()}" />
																</td>
																<td>
																	<c:out value="${agent.getFirstName()}" />
																</td>
																<td>
																	<c:out value="${agent.getLastName()}" />
																</td>
																<td>
																	<c:out value="${agent.getEmail()}" />
																</td>
																<td>
																	<c:out value="${agent.getGender()}" />
																</td>
																<td>
																	<a href="<%= request.getContextPath() %>/user/deleteUser?id=<c:out value='${agent.getProfileID()}' />">Delete</a>
																</td>
															</tr>
														</c:forEach>
													</table>
				
												</div>
											</div>
										</div>
										<!-- END View All Policy -->
									</div>
									<div class="tab-pane fade" id="pills-all-clients" role="tabpanel" aria-labelledby="pills-all-clients-tab">
										<!-- View All Policy -->
										<div class="text-center mt-5">
											<h3>
												<c:out value="${username}" />
											</h3>
											<div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i>All Clients</div>
										</div>
										<div class="mt-0 py-5 text-center">
											<div class="row justify-content-center">
												<div class="col-lg-12">
													<table class="table" >
														<%
															List<LoginBean> clients = ld.allClients("client");
															request.setAttribute("allClients", clients);
															%>
														<tr>
															<th>ID</th>
															<th>First Name</th>
															<th>Last Name</th>
															<th>Email</th>
															<th>Gender</th>
															<th>Action</th>
														</tr>
														<c:forEach var="client" items="${allClients}">
															<tr>
																<td>
																	<c:out value="${client.getProfileID()}" />
																</td>
																<td>
																	<c:out value="${client.getFirstName()}" />
																</td>
																<td>
																	<c:out value="${client.getLastName()}" />
																</td>
																<td>
																	<c:out value="${client.getEmail()}" />
																</td>
																<td>
																	<c:out value="${client.getGender()}" />
																</td>
																<td>
																	<a href="<%= request.getContextPath() %>/user/deleteUser?id=<c:out value='${client.getProfileID()}' />">Delete</a>
																</td>
															</tr>
														</c:forEach>
													</table>
				
												</div>
											</div>
										</div>
										<!-- END View All Policy -->
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
			
			<div class="modal fade" id="newPolicyModal" tabindex="-1" role="dialog" aria-labelledby="newPolicyLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">New Policy Register Form</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form action="<%= request.getContextPath() %>/policy/insertPolicy" method="post" id="newPolicyForm">
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label">Type:</label>
			            <input type="text" class="form-control" id="recipient-name" name="type">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Name:</label>
			            <textarea class="form-control" id="message-text" name="name"></textarea>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Price:</label>
			            <textarea class="form-control" id="message-text" name="price"></textarea>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Duration:</label>
			            <textarea class="form-control" id="message-text" name="duration"></textarea>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Year Interest:</label>
			            <textarea class="form-control" id="message-text" name="yi"></textarea>
			          </div>
			          
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" onClick="$('#newPolicyForm').submit()">Send message</button>
			      </div>
			    </div>
			  </div>
			  
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