<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>




<script>
	
	var f = "hide";
	
	function loadContent()
	{
		var x = document.referrer;
		//window.alert("redirected from : " + x);
		
		var y = x.substring(38,43);
		 
		if(y == "login" || y == "index")
		{
			window.alert("Wrong credentials, Try Again");
		}	
		
		
		show();
	}
	
	function show()
	{
		//alert("Setting Content");
		var cont = "<table id = 'contTable' border = '1'>";
		cont = cont + "<tr><td>Enter UserID : </td>";
		cont = cont + "<td><input type = 'text' id = 'username'></td></tr>";
		
		cont = cont + "<tr><td>Enter Your Contact : </td>";
		cont = cont + "<td id = 'rep'><input type = 'password' id = 'pass'></td>";
		cont = cont + "<td><button id = 'vis'>show</button></td></tr>";
		
		cont = cont + "<tr><td></td><td><button style='margin:5px;' id = 'login'>login</button>";
		cont = cont + "<button style='margin:5px;' id = 'register'>register</button></td>";
		cont = cont + "<td>${RequestScope['msg']}</td>";
		cont = cont + "</tr></table>";
		
		document.getElementById('cont').innerHTML = cont;
		
		initiate();
	}
	
	function initiate()
	{
		var sh = document.getElementById('vis');
		var lg = document.getElementById('login');
		var rg = document.getElementById('register');
		
		sh.addEventListener('click',showtext);
		lg.addEventListener('click',validate);
		rg.addEventListener('click',toregister);
	}
	
	function showtext(event)
	{
		event.preventDefault();
		
		if(f == "hide")
		{
			f = "show";
			var str = document.getElementById('pass').value;
			var c = document.getElementById('rep');
			var cont = "<input type = 'text' id = 'pass'>";
			document.getElementById('vis').innerText = "hide";
			c.innerHTML = cont;
			document.getElementById('pass').value = str;
		}
		else
		{
			f = "hide";
			var str = document.getElementById('pass').value;
			var c = document.getElementById('rep');
			var cont = "<input type = 'password' id = 'pass'>";
			document.getElementById('vis').innerText = "show";
			c.innerHTML = cont;
			document.getElementById('pass').value = str;
			
		}
	}
	
	function validate(event)
	{
		var uname = document.getElementById('username').value;
		var pass = document.getElementById('pass').value;
		
		console.log("username : " + uname + " and password : " + pass);
		
		if(uname == "")
		{
			window.alert("Fill the Username");
		}
		else if(pass == "")
		{
			window.alert("Cant leave password blank");
		}
		else if(pass.length < 3)
		{
			window.alert("Not Sufficiently long password");
			
		}	
		else
		{
			window.alert("redirecting to login");
			var actionstr = "login?username=" + uname + "&password=" + pass;
			location.href = actionstr;
		}	
		
		
	}
	
	function toregister(event)
	{
		window.alert("redirecting to the register page");
		var actionstr = "RegisterPage.jsp";
		location.href = actionstr;
	}

</script>

</head>

<body>

	<p id = "cont">The Content Will be Loaded Here</p>
	<script>
		loadContent();
	</script>

</body>
</html>