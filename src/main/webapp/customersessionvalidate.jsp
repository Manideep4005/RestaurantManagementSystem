<%@page import="com.rms.cartfunction.CustomerAddItem"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-Cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // proxies



	Integer customerId = (Integer) session.getAttribute("customerId");
	
	Integer cartItems = CustomerAddItem.countItems(customerId);

	session.setAttribute("cartItems", cartItems);


if(session.getAttribute("customerId") == null) {

	

%>
	<c:redirect url="rms.jsp"></c:redirect>
	<!--<jsp:forward page="customersessionvalidate.jsp"></jsp:forward>
-->
<% }%>