<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script  type="text/javascript"
	src="/ChatServer/js/	jquery.js"></script>
<script type="text/javascript">
function doAjaxPost() {
        	var message = $('#message').val();
	        var sendTo = $('#sendTo').val();
	       	$.ajax({
	        type: "POST",	
	        url: "/chat.html",
	        data: 'message=' + message + '&sendTo=' + sendTo,
	        success: function(response){
	        // we have the response
	        $('#info').html(response);
	        $('#message').val('');
	         },
	        error: function(e){
	        alert('Error: ' + e);
	        }
        });
	  }
	       
	        </script>
	        <title>Chat</title>	
</head>
<body>
<a href="check.html?Name=${user.name}">Check Messages</a>
<p>
<textarea rows="3" cols="30" readonly = "readonly" id="info" name="info"></textarea>
<p>
<form id="form" method="POST"><input type=hidden name="Name"
	value="<%=request.getParameter("Name") %>" /> Send Message : <br>
To: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
	type="text" name="sendTo" id="sendTo" /> <br>
Message : <textarea rows="2" cols="20" name="message" id="message"></textarea>
<br>
<input type="button" name="submit" id="submit_btn" value="Send" onclick="doAjaxPost()"/></form>
</body>
</html>