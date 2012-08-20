<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ur Mesaages</title>
</head>
<body>
<c:choose>
	<c:when test="${not empty messages}">
	<h> You have ${fn:length(messages)} messages: </h>
	<br>
	<table border="1">
		<tr>
			<th> Sender </th>
			<th> Message </th>
		</tr>
	<c:forEach var="mapentry" items="${messages}" varStatus="status">
		
		<tr>
			<td>${mapentry.key}</td>
			<td>${mapentry.value}</td>
		</tr>
	</c:forEach>
	</table>
	</c:when>
	<c:otherwise>
	<h> No messages for you</c:otherwise>
</c:choose>
<FORM><INPUT TYPE="BUTTON" VALUE="Go Back" 
ONCLICK="history.go(-1)"></FORM>
</body>
</html>