<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/ChatServer/js/jquery.js"></script>
	        <script type="text/javascript">
	        function doAjaxPost() {
        // get the form values
	        var name = $('#Name').val();
       	    $.ajax({
	        type: "POST",
	        url: "/ChatServer/Login.html",
	        data: "name=" + name,
	        success: function(response){
	        // we have the response
	        $('#info').html(response);
	        $('#Name').val('');
	         },
	        error: function(e){
	        alert('Error: ' + e);
	        }
        });
	        }
	        </script>
<title>Login</title>
</head>
<body>
	<form action="chat.html" method="GET" >
		 Name: <input type="text" name="Name" id="Name" /> <br>
		 <input	type="submit" value="login" />
		 <% request.setAttribute("name","Name"); %>
		 <input type="button" value="Add User" onclick="doAjaxPost()" />
		 <div id="info" style="color: green;"></div>
	</form>
</body>

</html>