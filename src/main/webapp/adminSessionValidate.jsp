<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
response.setHeader("Pragma", "no-Cache"); // HTTP 1.0
response.setHeader("Expires", "0"); // proxies

if(session.getAttribute("adminId") == null) {

	

%>
	<c:redirect url="adminlogin.jsp"></c:redirect>
-->
<% }%>