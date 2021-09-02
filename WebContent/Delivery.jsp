<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivery Page</title>

<script>

	var statusFlag;

	function initiate()
	{
		var str = "accepted";
		loadRecord(str);
	}

	
	function loadMainSearchBar()
	{
		var cont = "<table id = 'mainSearchBarUserContainer'>";
		
        cont = cont + "<tr id = 'dateSearch'>";
		
		cont = cont + "<td id = 'daycont'>DD : <select id='day'>";
		cont = cont + "<option value='00'>NaN</option>";
		cont = cont + "<option value='01'>01</option>";
		cont = cont + "<option value='02'>02</option>";
		cont = cont + "<option value='03'>03</option>";
		cont = cont + "<option value='04'>04</option>";
		cont = cont + "<option value='05'>05</option>";
		cont = cont + "<option value='06'>06</option>";
		cont = cont + "<option value='07'>07</option>";
		cont = cont + "<option value='08'>08</option>";
		cont = cont + "<option value='09'>09</option>";
		cont = cont + "<option value='10'>10</option>";
		
		cont = cont + "<option value='11'>11</option>";
		cont = cont + "<option value='12'>12</option>";
		cont = cont + "<option value='13'>13</option>";
		cont = cont + "<option value='14'>14</option>";
		cont = cont + "<option value='15'>15</option>";
		cont = cont + "<option value='16'>16</option>";
		cont = cont + "<option value='17'>17</option>";
		cont = cont + "<option value='18'>18</option>";
		cont = cont + "<option value='19'>19</option>";
		cont = cont + "<option value='20'>20</option>";
		cont = cont + "<option value='21'>21</option>";
		
		cont = cont + "<option value='22'>22</option>";
		cont = cont + "<option value='23'>23</option>";
		cont = cont + "<option value='24'>24</option>";
		cont = cont + "<option value='25'>25</option>";
		cont = cont + "<option value='26'>26</option>";
		cont = cont + "<option value='27'>27</option>";
		cont = cont + "<option value='28'>28</option>";
		cont = cont + "<option value='29'>29</option>";
		cont = cont + "<option value='30'>30</option>";
		cont = cont + "<option value='31'>31</option>";
		cont = cont + "</select></td>";
		
		cont = cont + "<td id = 'monthcont'>MM : <select id='month'>";
		cont = cont + "<option value='00'>NaN</option>";
		cont = cont + "<option value='01'>Jan</option>";
		cont = cont + "<option value='02'>Feb</option>";
		cont = cont + "<option value='03'>Mar</option>";
		cont = cont + "<option value='04'>Apr</option>";
		cont = cont + "<option value='05'>May</option>";
		cont = cont + "<option value='06'>Jun</option>";
		cont = cont + "<option value='07'>Jul</option>";
		cont = cont + "<option value='08'>Aug</option>";
		cont = cont + "<option value='09'>Sep</option>";
		cont = cont + "<option value='10'>Oct</option>";
		cont = cont + "<option value='11'>Nov</option>";
		cont = cont + "<option value='12'>Dec</option>";
		cont = cont + "</select></td>";
		
		cont = cont + "<td id = 'yearcont'>YYYY : <select id='year'>";
		cont = cont + "<option value='2020'>2020</option>";
		cont = cont + "<option value='2019'>2019</option>";
		cont = cont + "<option value='2018'>2018</option>";
		cont = cont + "<option value='2017'>2017</option>";
		cont = cont + "<option value='2016'>2016</option>";
		cont = cont + "<option value='2015'>2015</option>";
		cont = cont + "<option value='2014'>2014</option>";
		cont = cont + "<option value='2013'>2013</option>";
		cont = cont + "<option value='2012'>2012</option>";
		cont = cont + "<option value='2011'>2011</option>";
		cont = cont + "<option value='2010'>2010</option>";
		cont = cont + "<option value='2009'>2009</option>";
		cont = cont + "<option value='2008'>2008</option>";
		cont = cont + "</select></td>";
		
		cont = cont + "<td><button id = 'search'>search</button></td>";
		cont = cont + "</tr>";
		
		cont = cont + "<tr><td colspan = '3'><select id = 'sortType'>";
		cont = cont + "<option value='accepted'>New Works</option>";
		cont = cont + "<option value='processing'>Works In Hand</option>";
		cont = cont + "<option value='completed'>Works Completed</option>";
		cont = cont + "</select></tr>";
		
		cont = cont + "</table>";	
	
		document.getElementById('searchout').innerHTML = cont;
		
		document.getElementById('search').addEventListener('click',searchByDate);
		document.getElementById('sortType').addEventListener('change',function(event){
			
			var str = event.target.value;
			window.alert("mode : " + str);
			loadRecord(str);
		});
	
	}
	
	
	function searchByDate()
	{
		window.alert("Searching by date");
	}
	
	
	

	function loadRecord(str)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				var i;
				
				window.alert("status flag : " + statusFlag);
				if(len == 0)
				{
					if(statusFlag == "accepted")
					{
						loadMainSearchBar();
						document.getElementById('dateSearch').style.display = "none";
					}
					else
					{
						document.getElementById('dateSearch').style.display = "none";
					}	
					
					document.getElementById('mainlist').innerHTML = "<h2>No Records Found</h2>";
				}
				else
				{
					if(statusFlag == "accepted")
					{
						loadMainSearchBar();
					}
					else
					{
						document.getElementById('dateSearch').style.display = "block";
					}	
					
					var cont = "<table id = 'recordContainer' border = '1'>";
					
					for(i=0;i<len;i++)
					{
						cont = cont + transform(jsonObj[i]);
					}
					
					cont = cont + "</table>";
					document.getElementById('mainlist').innerHTML = cont;
					addRecordContainerActions();
				}	
					
				
				//end of json Function
			}	
		};
		
		statusFlag = str;
		var actionstr = "loaddelrecord?status=" + str;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}
	
	
	function transform(order)
	{
		var cont = "<tr>";
		
		if(order.status == "accepted")
		{
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>UserID : " + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td>" + order.quantity + "</td>";
			cont = cont + "<td class = 'carry'>C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "<td><button class = 'process'>Process</button></td>";
			cont = cont + "<td><button class = 'userinfo'>UserInfo</button></td>";
			cont = cont + "</tr>";
			
		}
		else if(order.status == "processing")
		{
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>UserID : " + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td>" + order.quantity + "</td>";
			cont = cont + "<td class = 'carry'>C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "<td><button class = 'complete'>Complete</button><button class = 'partial'>Partial</button>";
			cont = cont + "<div class = 'partiallyCompleteContainer'></div></td>";
			cont = cont + "<td><button class = 'userinfo'>UserInfo</button></td>";
			cont = cont + "</tr>";
		}
		else if(order.status.substring(0,17) == "partiallyComplete")
		{
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>UserID : " + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td class = 'delivered'>Delivered : " + calculateDelivered(order) + "</td>";
			cont = cont + "<td class = 'remained'>Remained : " + order.quantity + "</td>";
			cont = cont + "<td class = 'carry'>C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'status'>" + order.status.substring(0,17) + "</td>";
			cont = cont + "<td><button class = 'complete'>Complete</button><button class = 'partial'>Partial</button></td>";
			//cont = cont + "<div class = 'partiallyCompleteContainer'></div></td>";
			cont = cont + "<td><button class = 'userinfo'>UserInfo</button></td>";
			cont = cont + "</tr>";
		}	
		else //completed
		{
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>UserID : " + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td>" + order.quantity + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "<td class = 'carry'>C-Rs." + order.carry + "</td>";
			//cont = cont + "<td><button class = 'process'>Process</button></td>";
			cont = cont + "<td><button class = 'userinfo'>UserInfo</button></td>";
			cont = cont + "</tr>";
			
		}
	return cont;	
	}
	
	
	function calculateDelivered(order)
	{
		var rm = order.quantity; //for partiallyComplete status, order.quantity stores the remained
		//so each time after partial clicked, remained is just subtracted by the done work amount entered in the input text
		var qt = order.status.substring(17); //status is appended with the actual quantity
		
		var remained = parseInt(rm);
		var quantity = parseInt(qt);
		
		quantity = quantity - remained;
	
	return quantity;	
	}
	
	

	function addRecordContainerActions()
	{
		var processbtns = document.getElementById('recordContainer').getElementsByClassName('process');
		var len1 = processbtns.length;
		var i;
		
		for(i=0;i<len1;i++)
		{
			processbtns[i].addEventListener('click',processOrder);
		}	
		
		var completebtns = document.getElementById('recordContainer').getElementsByClassName('complete');
		len1 = completebtns.length;
		
		for(i=0;i<len1;i++)
		{
			completebtns[i].addEventListener('click',completeOrder);
		}
		
		var userinfobtns = document.getElementById('recordContainer').getElementsByClassName('userinfo');
		len1 = userinfobtns.length;
		
		for(i=0;i<len1;i++)
		{
			userinfobtns[i].addEventListener('click',loadUserInfo);
		}
		
		var partialbtns = document.getElementById('recordContainer').getElementsByClassName('partial');
		len1 = partialbtns.length;
		
		for(i=0;i<len1;i++)
		{
			partialbtns[i].addEventListener('click',partialWorkSubmit);
		}
		
		
	}
	
	
	function partialWorkSubmit(event)
	{
		x = event.target.parentElement;
		x.innerHTML = "<input type class = 'qtText' placeholder = 'Done Quantity'><button class = 'submit'>Submit</button><button class = 'cancel'>Cancel</button>";
		x.getElementsByClassName('submit')[0].addEventListener('click',function(event){
		
			var doneQt = event.target.parentElement.getElementsByClassName('qtText')[0].value;
			//var status = event.target.parentElement.parentElement.parentElement.getElementsByClassName('status')[0].innerText;
			var userid = event.target.parentElement.parentElement.getElementsByClassName('userid')[0].innerText.substring(9);
			var orderid = event.target.parentElement.parentElement.getElementsByClassName('orderid')[0].innerText;
			
			window.alert("userid : " + userid  + " and orderid : " + orderid + " and done : " + doneQt);
		
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status == 200)
				{
					var result = this.responseText;
					var jsonObj = JSON.parse(result);
					
					if(jsonObj[0] == "successful")
					{
						window.alert("Successfully Submitted");
						var str = "processing";
						loadRecord(str);
					}
					else
					{
						window.alert("Submission failed");
					}	
				}	
			};
			
			var actionstr = "partialworksubmit?userid=" + userid + "&orderid=" + orderid + "&done=" + doneQt;
			xhttp.open("GET",actionstr,true);
			xhttp.send();
			
			//var str = "processing";
			//loadRecord(str);

			
		});
		
		x.getElementsByClassName('cancel')[0].addEventListener('click',function(event){
			
			window.alert("cancel clicked");
			event.target.parentElement.innerHTML = "<button class = 'complete'>Complete</button><button class = 'partial'>Partial</button>";
			addRecordContainerActions();
		});	
	
	}
	
	
	
	

	function processOrder(event)
	{
		var oid = event.target.parentElement.parentElement.getElementsByClassName('orderid')[0].innerText;
		var uid = event.target.parentElement.parentElement.getElementsByClassName('userid')[0].innerText.substring(9);
		window.alert("processing Order : orderid : " + oid + " and userid : " + uid);
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj[0] == "successful")
				{
					window.alert("Successfully accepted for processing");
					var str = "accepted";
					loadRecord(str);
				}
				else
				{
					window.alert("Acceptation failed");
				}	
				
			}	
		};
		
		var actionstr = "processorder?userid=" + uid + "&orderid=" + oid;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	function completeOrder(event)
	{
		var oid = event.target.parentElement.parentElement.getElementsByClassName('orderid')[0].innerText;
		var uid = event.target.parentElement.parentElement.getElementsByClassName('userid')[0].innerText.substring(9);
		window.alert("completing Order : orderid : " + oid + " and userid : " + uid);
	}
	
	function loadUserInfo(event)
	{
		//var oid = event.target.parentElement.parentElement.getElementsByClassName('orderid')[0].innerText;
		var uid = event.target.parentElement.parentElement.getElementsByClassName('userid')[0].innerText.substring(9);
		window.alert("Showing Info of userid : " + uid);
	}
	

</script>

</head>

<body onload = "initiate()">

	<p id = 'searchout'>Search bar will be printed here</p>
	<p id = "mainlist">the only one list that serves all will be printed here</p>


</body>
</html>