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
          
        out.print("Hello, "+name+" Welcome to Profile");  
        }  %>
<meta charset="UTF-8">
<title>Admin management page</title>
</head>

<body>

<div align="center">
        
            
  <h1>New Policy Register Form</h1>
  <form action="<%= request.getContextPath() %>/policy/insertPolicy" method="post">
   <table style="with: 80%">
    <tr>
     <td>Type</td>
     <td><input type="text" name="type" /></td>
    </tr>

    <tr>
     <td>Name</td>
     <td><input type="text" name="name" /></td>
    </tr>
    <tr>
     <td>Price</td>
     <td><input type="text" name="price" /></td>
    </tr>
    <tr>
     <td>Duration</td>
     <td><input type="text" name="duration" /></td>
    </tr>
    <tr>
     <td>Year Interest</td>
     <td><input type="text" name="yi" /></td>
    </tr>
    
   </table>
   <input type="submit" value="Submit" />
  </form>
 
 <table border="1" >
            <caption><h2>Policy Management</h2></caption>
        
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
                    <td><c:out value="${policy.getId()}" /></td>
                    <td><c:out value="${policy.getType()}" /></td>
                    <td><c:out value="${policy.getName()}" /></td>
                    <td><c:out value="${policy.getPrice()}" /></td>
                    <td><c:out value="${policy.getDuration()}" /></td>
                    <td><c:out value="${policy.getYearInterest()}" /></td>
                    <td>
                    	<a href="<%= request.getContextPath() %>/policy/editPolicy?id=<c:out value='${policy.getId()}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="<%= request.getContextPath() %>/policy/deletePolicy?id=<c:out value='${policy.getId()}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        
        
        <table border="1" >
            <caption><h2>New Agent</h2></caption>
        
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
	                    <td><c:out value="${agent.getProfileID()}" /></td>
	                    <td><c:out value="${agent.getFirstName()}" /></td>
	                    <td><c:out value="${agent.getLastName()}" /></td>
	                    
	                    <td>
	                    	<a href="<%= request.getContextPath() %>/user/approveAgent?id=<c:out value='${agent.getProfileID()}' />">Approve</a>
	                    	                   	
	                    </td>
	                </tr>
	            </c:forEach>
			</c:if>
	            
        </table>
        <table border="1" >
            <caption><h2>All Agent</h2></caption>
        
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
	            </tr>
	            
	            <c:forEach var="agent" items="${allAgents}">
	                <tr>
	                    <td><c:out value="${agent.getProfileID()}" /></td>
	                    <td><c:out value="${agent.getFirstName()}" /></td>
	                    <td><c:out value="${agent.getLastName()}" /></td>
	                    <td><c:out value="${agent.getEmail()}" /></td>
	                    <td><c:out value="${agent.getGender()}" /></td>
	                    <td>
	                    	<a href="<%= request.getContextPath() %>/user/deleteUser?id=<c:out value='${agent.getProfileID()}' />">Delete</a>
	                    	                   	
	                    </td>
	                
	                </tr>
	            </c:forEach>
			
	            
        </table>
        <table border="1" >
            <caption><h2>All Clients</h2></caption>
        
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
	            </tr>
	            
	            <c:forEach var="client" items="${allClients}">
	                <tr>
	                    <td><c:out value="${client.getProfileID()}" /></td>
	                    <td><c:out value="${client.getFirstName()}" /></td>
	                    <td><c:out value="${client.getLastName()}" /></td>
	                    <td><c:out value="${client.getEmail()}" /></td>
	                    <td><c:out value="${client.getGender()}" /></td>
	                    	                    <td>
	                    	<a href="<%= request.getContextPath() %>/user/deleteUser?id=<c:out value='${client.getProfileID()}' />">Delete</a>
	                    	                   	
	                    </td>
	                
	                </tr>
	            </c:forEach>
			
	            
        </table>
        
        
    </div>	
</body>
</html>