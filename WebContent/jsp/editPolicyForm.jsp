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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Please edit policy <c:out value='${id}' /></h1>

  <form action="<%= request.getContextPath() %>/policy/updatePolicy?id=<%= s.getAttribute("id") %>" method="post">
   <table style="with: 80%">
    <tr>
     <td>Type</td>
     <td><input type="text" name="type" value="${oldType}"/></td>
    </tr>

    <tr>
     <td>Name</td>
     <td><input type="text" name="name" value="${oldName}"/></td>
    </tr>
    <tr>
     <td>Price</td>
     <td><input type="text" name="price" value="${oldPrice}"/></td>
    </tr>
    <tr>
     <td>Duration</td>
     <td><input type="text" name="duration" value="${oldDuration}"/></td>
    </tr>
    <tr>
     <td>Year Interest</td>
     <td><input type="text" name="yi" value="${oldYI}"/></td>
    </tr>
    
   </table>
   <input type="submit" value="Submit" />
  </form>
</body>
</html>