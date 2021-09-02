<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<script>
	
	var uname,pass,con,addr;
	
	function initiate()
	{
		var cont = "<table border = '1'>";
		cont = cont + "<tr><td>Enter Username : </td>";
		cont = cont + "<td><input type = 'text' id = 'username' placeholder = 'no spaces'></td>";
		cont = cont + "<td><button id = 'back'><span style='color:blue'>back</span></button></td></tr>";
		cont = cont + "<tr><td>Enter Password : </td>";
		cont = cont + "<td><input type = 'text' id = 'password' placeholder = 'more than 6 letters'></td></tr>";
		cont = cont + "<tr><td>Enter Contact : </td>";
		cont = cont + "<td><input type = 'text' id = 'contact'></td></tr>";
		cont = cont + "<tr><td>Enter Address : </td>";
		cont = cont + "<td><textarea rows = '4' cols = '20' id = 'address'></textarea></td></tr>";
		cont = cont + "<tr><td colspan = '2'><button id = 'register'>Register</button></td>";
		cont = cont + "<td><button id = 'login'>Login Using This</button></td></tr>";
		cont = cont + "</table>";
		
		document.getElementById('setContent').innerHTML = cont;
		var x = document.getElementById('login');
		x.style.visibility = 'hidden';
		
		var x = document.referrer;
		window.alert("redirected from : " + x);
		
		setActions();
	}
	
	function setActions()
	{
		var rg = document.getElementById('register');
		var lg = document.getElementById('login');
		var bk = document.getElementById('back');
		
		rg.addEventListener('click',validate);
		lg.addEventListener('click',tohome);
		bk.addEventListener('click',goback);
	}
	
	function goback()
	{
		var actionstr = "index.jsp";
		location.href = actionstr;
	}
	
	function validate(event)
	{
		 uname = document.getElementById('username').value;
		 pass = document.getElementById('password').value;
		 con = document.getElementById('contact').value;
		 addr = document.getElementById('address').value;
		
		console.log(uname + " " + pass + " " + con + " " + addr);
		
		toregister(uname,pass,con,addr);
	}
	
	function toregister(funame,fpass,fcon,faddr)
	{
		console.log("In to register : " + funame + " " + fpass + " " + fcon + " " + faddr);
		var x = document.getElementById('login');
		x.style.visibility = 'visible';
		//var actionstr = "register?username="funame + "&password=" + fpass + "&contact=" + fcon + "&address=" + faddr;
		//location.href = actionstr;
	}

	function tohome(event)
	{
		sessionStorage.setItem("username",uname);
		sessionStorage.setItem("password",pass);
		sessionStorage.setItem("contact",con);
		sessionStorage.setItem("address",addr);
		
		
		window.alert("Redirecting to Home Page");
		var actionstr = "HomePage.jsp";
		location.href = actionstr;
		
		
	}

</script>


</head>
<body>
	<p id = "setContent" ></p>
	
	<script>
		initiate();
	</script>
	
</body>
</html>