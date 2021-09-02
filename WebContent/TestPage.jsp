<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test Page</title>


<%@page import="java.util.ArrayList"%>
<%@page import="bean.UserBean"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>

<script>

	function initiate()
	{			
		<% ArrayList<UserBean>obj1 = (ArrayList<UserBean>)request.getAttribute("user"); %>
		var obj=<%=new ObjectMapper().writeValueAsString(obj1)%>;
		
		var cont = "<table id = 'content'>";
		cont = cont + "<tr><td> UserId : " + obj[0].userid + "</td></tr>";
		cont = cont + "<tr><td> UserName : " + obj[0].username + "</td></tr>";
		cont = cont + "<tr><td> Contact : " + obj[0].contact + "</td></tr>";
		cont = cont + "<tr><td> Address : " + obj[0].address + "</td></tr></table>";
		
		document.getElementById('output').innerHTML = cont;
	}

</script>

</head>
<body onload = "initiate()">

	<p id = 'output'>Output will be printed here</p>
</body>
</html>