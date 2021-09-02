<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Business Page</title>

<style>

	#day,#month,#year
	{	
	   width: 60px;
	}



	#usersearch{
	
	          background-color: #1C8869; /* blue */
			  border: none;
			  color: white;
			  padding: 10px 30px;
			  text-align: center;
			  text-decoration: none;
			  display: inline;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
	          
	          width: 100px;
	
	
	
	}
	
	#payments,#transactions,#userrequested,#accepted,#processing,#completed,#requested,#purchase,#payment,#searchbydate,#addProd
	{
		background-color: #555555; /* black */
			  border: none;
			  color: white;
			  padding: 10px 24px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
			  width: 110px;
			  
	}
	
	
	#acceptedUser,#processingUser,#completedUser,#requestedUser,#purchaseUser,#paymentUser,#searchbydateUser,#makePayment,#confirmPayment
	{
		background-color: #555555; /* black */
			  border: none;
			  color: white;
			  padding: 10px 24px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
			  width: 110px;
			  
	}
	
	#transactionUser
	{
		
		
			 background-color: #C70039; /* black */
			  border: none;
			  color: white;
			  padding: 10px 24px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
			  width: 110px;
			  
	}
	
	
	
	
		
	.go {
			  background-color: #008CBA; /* blue */
			  border: none;
			  color: white;
			  padding: 10px 24px;
			  text-align: center;
			  text-decoration: none;
			  display: inline;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
			  width: 100px;
			}
			
	.acceptrequest,.editProd:hover{
			  background-color: #008CBA; /* blue */
			  border: none;
			  color: white;
			  padding: 10px 24px;
			  text-align: center;
			  text-decoration: none;
			  display: inline;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
			  width: 100px;
			}		

	
	.acceptrequest:hover,.editProd{
			  background-color: #CA5941;
			  border: none;
			  color: white;
			  padding: 10px 24px;
			  text-align: center;
			  text-decoration: none;
			  display: inline;
			  font-size: 16px;
			  border-radius: 12px;
			  cursor: pointer;
			  width: 100px;
			}
	
	
	#userslist{
	
		position: absolute;
        left: 10px;
        top: 150px;
	}
	
	#allrecordsSearchbar
	{
		position: absolute;
		left: 450px;
		top: 145px;
	}
	

	#allrecords
	{
		position: absolute;
		left: 450px;
		top: 250px;
	}
	
	#recordsum
	{
		position: absolute;
		left: 457px;
		top: 70px;
		background-color: #2BD5A4;
        width: 730px;
        text-align: center;
	
	}
	
	#allproducts
	{
		position: absolute;
		left: 450px;
		top: 530px;
	
	}
	
	#userbtns{
	
		position: absolute;
        left: 1180px;
        top: 470px;
	}

	#userprofile{
	
		position: absolute;
        left: 1250px;
        top: 150px;
        background-color: #D5E1DD;
        width: 614px;
        
	}
	
	#userrecords{
	
		position: absolute;
        left: 1250px;
        top: 580px;
        background-color: #D5E1DD;
        
	}
	
	/*#profileinfo{
	
	    animation: mymove 3s;
        animation-fill-mode: forwards;
	
	}
	
	
	@keyframes mymove {
        from {top: 0px; left: 1000px;}
        to {top: 150px; left: 1000px;}
      }*/
	
	#userid{
	
		background-color: #DDB88A;
		color: #382207;
		padding-top: 6px;
		padding-bottom: 6px;
		text-align: center;
	}
	
	#userslistContainer
	{
		background-color: #DAF7A6;
		border-collapse: collapse;
        width: 120%;
	
	}
	
	#mainSearchBarContainer
	{
		background-color: #D5E1DD;
		border-collapse: collapse;
	}
	
	#mainSearchBarUserContainer
	{
	    background-color: #F1AFAF;
		border-collapse: collapse;
	
	}
	
	#paymentText,#productnameTxt,#priceTxt,#nameTxt,#prTxt
	{
		height : 30px;
		width : 170px;
	}
	
	#userlistSearchText
	{
		height : 28px;
		width : 280px;
		border-radius: 15px; 
	}
	
	#userrecordContainer
	{
		border-collapse: collapse;
			
	}
	
	
	#allRecordsContainer,#productContainer
	{
	  padding-top: 6px;
	  padding-bottom: 6px;
	  text-align: center;
	  background-color: #D1D54A;
	  color: black;
	  border-collapse: collapse;
	}
	
	
	#userslistContainer th,#productContainer th 
	{
	  padding-top: 6px;
	  padding-bottom: 6px;
	  text-align: center;
	  background-color: #4CAF50;
	  color: white;
	}
	
	#userslistContainer tr,td 
	{
	  padding-top: 6px;
	  padding-bottom: 6px;
	  padding-left: 6px;
	  padding-right: 6px;
	  text-align: center;
	}
	
	#userslistContainer tr:hover 
	{
		background-color: #B2EDC4;	
	}


</style>






<script>

	var userslistflag; //keeps the track whether userlist is sorted by recent or by default

	
	//keeps the track of the filters applied
	var searchbydateFlag = "unclicked";
	var requestedFlag = "unclicked";
	var paymentFlag = "unclicked";
	var completedFlag = "unclicked";
	var acceptedFlag = "unclicked";
	var purchaseFlag = "unclicked";
	var processingFlag = "unclicked";
	
	
	var searchbydateFlagUser = "unclicked";
	var requestedFlagUser = "unclicked";
	var paymentFlagUser = "unclicked";
	var completedFlagUser = "unclicked";
	var acceptedFlagUser = "unclicked";
	var purchaseFlagUser = "unclicked";
	var processingFlagUser = "unclicked";
	
	
	
	function unclickAllUserFlag()
	{
		searchbydateFlagUser = "unclicked";
		requestedFlagUser = "unclicked";
		paymentFlagUser = "unclicked";
		completedFlagUser = "unclicked";
		acceptedFlagUser = "unclicked";
		purchaseFlagUser = "unclicked";
		processingFlagUser = "unclicked";
	}
	
	

	function initiate()
	{
		var str1 = "userslist";
		
		loaduserslist(str1);
		//loadheader
		loadmainrecord();
		//load empty profile panel of right
		loadProductList();
		
	}
	
	
	function loadProductList()
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function()
		{
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				var i;
				
				if(len > 0)
				{
					cont = "<div id = 'addProductContainer'><input type ='text' id = 'productnameTxt' placeholder = 'Enter ProductName'>";
					cont = cont + "<input type = 'text' id = 'priceTxt' placeholder = 'Enter Product Price'><button id = 'addProd'>Add</button></div>";
				    cont = cont + "<table id = 'productContainer'>";
					cont = cont + "<th>ProductID</th><th>ProductName</th><th>Price</th><th></th>";
					
					for(i=0;i<len;i++)
					{
						cont = cont + "<tr class = 'item'>";
						cont = cont + "<td class = 'productid'>" + jsonObj[i].productid + "</td>";
						cont = cont + "<td class = 'productname'>" + jsonObj[i].productname + "</td>";
						cont = cont + "<td class = 'price'>" + jsonObj[i].price + "</td>";
						cont = cont + "<td><button class = 'editProd'>Edit</button><div class = 'cancelCont'></div></td>";
						cont = cont + "</tr>";
					}
					
					cont = cont + "</table>";
					
					document.getElementById('allproducts').innerHTML = cont;
					
					document.getElementById('addProd').addEventListener('click',function(event){
					
						var pname = document.getElementById('productnameTxt').value;
						var price = document.getElementById('priceTxt').value;
						
						window.alert("Adding new product pname : " + pname + " and price : " + price);
						
						
						loadProductList();
					});
					
					
					var x = document.getElementById('productContainer');
					var editbtns = x.getElementsByClassName('editProd');
					var len1 = editbtns.length;
					
					for(i=0;i<len1;i++)
					{
						editbtns[i].addEventListener('click',function(event){
							
							if(event.target.innerText == "Edit")
							{
								var y = event.target.parentElement.parentElement;
								
								var pnameContainer = y.getElementsByClassName('productname')[0];
								var priceContainer = y.getElementsByClassName('price')[0];
								
								var pname = pnameContainer.innerText;
								var price = priceContainer.innerText;
								
								pnameContainer.innerHTML = "<input type = 'text' class = 'nametxt' value='" + pname + "'>";
								priceContainer.innerHTML = "<input type = 'text' class = 'prtxt' value='" + price + "'>";
								event.target.innerText = "Save";
								event.target.parentElement.getElementsByClassName('cancelCont')[0].innerHTML = "<button class = 'cancel'>cancel</button>"
								
								event.target.parentElement.getElementsByClassName('cancel')[0].addEventListener('click',function(){
									
									loadProductList();
									
								});
								
							}
							else
							{
								var y = event.target.parentElement.parentElement;
								var pname = y.getElementsByClassName('nametxt')[0].value;
								var price = y.getElementsByClassName('prtxt')[0].value;
								var pid = y.getElementsByClassName('productid')[0].innerText;
								
								window.alert("Saving for productID : " + pid + " ProdName : " + pname + " Price : " + price);
								loadProductList();
							}	
							
							
							
						});
					}	
					
					
				}	
				
				
				
			}	
		};
		
		var actionstr = "loadproduct";
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	
	
	function loadmainrecord()
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				
				if(len == 0)
				{
					document.getElementById('allrecords').innerHTML = "No Record Found";
				}
				else
				{
					
					var cont = "<table id = 'allRecordsContainer' border = '1'>";
					var i;
					
					for(i=0;i<len;i++)
					{
						cont = cont + transformMain(jsonObj[i]);
					}	
					
					cont = cont + "</table>";
					document.getElementById('allrecords').innerHTML = cont;
					loadmainsearchbar();
					
					var acceptbtns = document.getElementById('allRecordsContainer').getElementsByClassName('acceptrequest');
					var len1 = acceptbtns.length;
					
					for(i=0;i<len1;i++)
					{
						acceptbtns[i].addEventListener('click',acceptRequest);
					}	
					
					
					
				}	
				
				
			}	
		};
		
		var actionstr = "loadallrecord";
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	
	function acceptRequest(event)
	{
		var x = event.target.parentElement.parentElement;
		//var uid = x.getElementsByClassName('userid')[0].innerText;
		//var oid = x.getElementsByClassName('orderid')[0].innerText.substring(10);
		//var tot = x.getElementsByClassName('total')[0].innerText.substring(3);
		
		var btnContainer = event.target.parentElement; //the td that contains the button
		
		cont = "<div>Rs.<input type = 'text' class = 'carryingCharge' placeholder = 'Carrying Charge'>";
		cont = cont + "<button class = 'save'>Save and accept</button><button class = 'cancel'>cancel</button></div>";
		btnContainer.innerHTML = cont;
		
		btnContainer.getElementsByClassName('save')[0].addEventListener('click',function(event){
			
			var carry = event.target.parentElement.getElementsByClassName('carryingCharge')[0].value;
			var tot = event.target.parentElement.parentElement.parentElement.getElementsByClassName('total')[0].innerText.substring(3);
			var uid = event.target.parentElement.parentElement.parentElement.getElementsByClassName('userid')[0].innerText;
			var oid = event.target.parentElement.parentElement.parentElement.getElementsByClassName('orderid')[0].innerText.substring(10);
			
			//acceptUserOrderWithTotalAndCarry(uid,oid,tot,carry);
			window,alert("userid : " + uid + " orderid : " + oid + " total : " + tot + " carry : " + carry);
			acceptUserOrderWithTotalAndCarryM(uid,oid,tot,carry);
			//loadmainrecord();
		});
		
        btnContainer.getElementsByClassName('cancel')[0].addEventListener('click',function(event){
			
        	var x = event.target.parentElement.parentElement; 
			x.innerHTML = "<button class = 'acceptrequest'>accept</button>";
			
			x.getElementsByClassName('acceptrequest')[0].addEventListener('click',acceptRequest);
			
		});
        
        
		
	//end of accept request	
	}
	
	
	
	
	function acceptUserOrderWithTotalAndCarryM(uid,oid,tot,carry)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj[0] == "successful")
				{
					window.alert("Successfully Accepted");
					loadmainrecord();
				}
				else
				{
					window.alert("Acceptation Failed");
				}	
				
			}
		};
		
		var actionstr = "acceptorder?userid=" + uid + "&orderid=" + oid + "&total=" + tot + "&carry=" + carry;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}
	
	
	
	
	
	function transformMain(order)
	{
         var cont = "<tr>";
		
		if(order.status == "payment")
		{
			//orderid total date 
			//for userpage userid and username are not required
			
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'> OrderID : " + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>UserID : " + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td class = 'total'>Rs." + order.total + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "</tr>";
			
		}
		else if(order.status == "purchase")
		{
			//cont = cont + "<tr>";
			//cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			//cont = cont + "<td> username : Businessman</td>"; 
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td> Qt : " + order.quantity + "</td>";
			cont = cont + "<td class = 'total'> Rs." + order.total + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "</tr>";
		}
		else if(order.status == "requested")
		{
			
			//as it is for customer page so user info is not necessary
			//it will be necessary for the businessman page
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'>OrderID : " + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>" + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td> Qt : " + order.quantity + "</td>";
			cont = cont + "<td class = 'total'> Rs." + order.total + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "<td><button class = 'acceptrequest'>accept</button></td>";
			cont = cont + "</tr>";
		}
		else if(order.status.substring(0,17) == "partiallyComplete")
		{
			cont = cont + "<td class = 'orderid'>OrderID : " + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>" + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td class = 'delivered'>Delivered : " + calculateDelivered(order) + "</td>";
			cont = cont + "<td class = 'remained'>Remained : " + order.quantity + "</td>";
			cont = cont + "<td class = 'total'> Rs." + order.total + "</td>";
			cont = cont + "<td class = 'carry'>C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status.substring(0,17) + "</td>";
			//cont = cont + "<td><button class = 'complete'>Complete</button><button class = 'partial'>Partial</button></td>";
			//cont = cont + "<div class = 'partiallyCompleteContainer'></div></td>";
			//cont = cont + "<td><button class = 'userinfo'>UserInfo</button></td>";
			cont = cont + "</tr>";
		}
		else
		{
			//oid,pid,pname,qt,date,st,tot
			
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'>OrderID : " + order.orderid + "</td>";
			cont = cont + "<td class = 'userid'>" + order.userid + "</td>";
			cont = cont + "<td>" + order.username + "</td>";
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td> Qt : " + order.quantity + "</td>";
			cont = cont + "<td class = 'total'> Rs." + order.total + "</td>";
			cont = cont + "<td class = 'carry'> C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			//cont = cont + "<td><button class = 'cancelrequest'>cancel</button></td>";
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
	
	
	//it only executes when the main record is non empty
	function loadmainsearchbar()
	{
		//userlist with dues will be uploaded in the by default user list fired from the button on the header bar
		//time searchbar with search button
		//requested, completed, payment, accepted, purchase, processing
		
		var cont = "<table id = 'mainSearchBarContainer'>";
		
         cont = cont + "<tr>";
		
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
		
		cont = cont + "<td><button id = 'searchbydate'>search</button></td>";
		cont = cont + "</tr>";
		cont = cont + "<tr>";
		
		cont = cont + "<td><button id = 'requested'>requested</button></td>";
		cont = cont + "<td><button id = 'payment'>payment</button></td>";
		cont = cont + "<td><button id = 'completed'>completed</button></td>";
		cont = cont + "<td><button id = 'accepted'>accepted</button></td>";
		cont = cont + "<td><button id = 'purchase'>purchase</button></td>";
		cont = cont + "<td><button id = 'processing'>processing</button></td></tr>";
		
		cont = cont + "<table>";

		document.getElementById('allrecordsSearchbar').innerHTML = cont;
		
		var sd = document.getElementById('searchbydate');
		var rq = document.getElementById('requested');
		var pm = document.getElementById('payment');
		var cm = document.getElementById('completed');
		var ac = document.getElementById('accepted');
		var pr = document.getElementById('purchase');
		var po = document.getElementById('processing');
		
		
		makeAllRecordsVisible();
		
		
		
		sd.addEventListener('click',function(event){
			
			//unclickAll();
			
			if(searchbydateFlag == "unclicked")
			{
				searchbydateFlag = "clicked";
				event.target.style.backgroundColor = "#D288EE"; //#555555
			}
			else
			{
				searchbydateFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
				makeAllRecordsVisible();
			}	
			
			applyFilter();
			
		});
		
		
		
           rq.addEventListener('click',function(event){
			
			if(requestedFlag == "unclicked")
			{
				unclickAll();
				requestedFlag = "clicked";
				event.target.style.backgroundColor = "#D288EE"; //#555555
			}
			else
			{
				requestedFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
				
			}	
			
			applyFilter();
			
		});
		
           
           pm.addEventListener('click',function(){
   			
   			if(paymentFlag == "unclicked")
   			{
   				unclickAll();
   				paymentFlag = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   				paymentFlag = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilter();
   			
   		});   
           
           
           cm.addEventListener('click',function(event){
   			
   			if(completedFlag == "unclicked")
   			{
   				unclickAll();
   				completedFlag = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   				completedFlag = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilter();
   			
   		});  
           
           
           ac.addEventListener('click',function(event){
   			
   			if(acceptedFlag == "unclicked")
   			{
   				unclickAll();
   				acceptedFlag = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   			    acceptedFlag = "unclicked";
   			 event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilter();
   			
   		});   
           
           
           pr.addEventListener('click',function(event){
   			
   			if(purchaseFlag == "unclicked")
   			{
   				unclickAll();
   				purchaseFlag = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   				
   			}
   			else
   			{
   				purchaseFlag = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilter();
   			
   		});   
           
         
           po.addEventListener('click',function(event){
   			
   			if(processingFlag == "unclicked")
   			{
   				unclickAll();
   				processingFlag = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   				processingFlag = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilter();
   			
   		});
           
	}
	
	
	function applyFilter()
	{
		makeAllRecordsVisible();
		
		
		if(searchbydateFlag == "clicked")
		{
			var dd = document.getElementById('day').value;
			var mm = document.getElementById('month').value;
			var yy = document.getElementById('year').value;
			
			if(dd != "00" && mm == "00")
			{
				window.alert("not a valid date, so failed to apply the date filter");
				searchbydateFlag = "unclicked";
				document.getElementById('searchbydate').style.backgroundColor = "#555555";
				
			}
			else
			{
				var str = dd + "." + mm + "." + yy;
				applyDateFilter(str);
			}
			
			
			
		}	
		
		if(requestedFlag == "clicked")
		{
			var str = "requested";
			applyStatusFilter(str);
		}	
		
		if(paymentFlag == "clicked")
		{
			var str = "payment";
			applyStatusFilter(str);
		}
		
		if(completedFlag == "clicked")
		{
			var str = "completed";
			applyStatusFilter(str);
		}
		
		if(acceptedFlag == "clicked")
		{
			var str = "accepted";
			applyStatusFilter(str);
		}
		
		if(purchaseFlag == "clicked")
		{
			var str = "purchase";
			applyStatusFilter(str);
		}
		
		if(processingFlag == "clicked")
		{
			var str = "processing";
			applyStatusFilter(str);
		}
		
		
	}
	
	function applyDateFilter(str)
	{
		window.alert("applying date filter : " + str);
		var dd = str.substring(0,2);
		var mm = str.substring(3,5);
		var yy = str.substring(6);
		
		var x = document.getElementById('allRecordsContainer');
		var dateStrs = x.getElementsByClassName('date');
		var len = dateStrs.length;
		var i;
		
		if(dd == "00" && mm != "00")
		{
			for(i=0;i<len;i++)
			{
				var mm1 = dateStrs[i].innerText.substring(3,5);
				var yy1 = dateStrs[i].innerText.substring(6);
				
				if(dateStrs[i].parentElement.style.display == "block" && (mm != mm1 || yy != yy1))
				{
					dateStrs[i].parentElement.style.display = "none";
				}	
					
			}
		}
		else if(dd == "00" && mm == "00")
		{
			for(i=0;i<len;i++)
			{
				//var mm1 = dateStrs[i].innerText.substring(3,5);
				var yy1 = dateStrs[i].innerText.substring(6);
				
				if(dateStrs[i].parentElement.style.display == "block" && yy != yy1)
				{
					dateStrs[i].parentElement.style.display = "none";
				}	
					
			}
		}
		else
		{
			for(i=0;i<len;i++)
			{
				var dd1 = dateStrs[i].innerText.substring(0,2);
				var mm1 = dateStrs[i].innerText.substring(3,5);
				var yy1 = dateStrs[i].innerText.substring(6);
				
				if(dateStrs[i].parentElement.style.display == "block" && (dd != dd1 || mm != mm1 || yy != yy1))
				{
					dateStrs[i].parentElement.style.display = "none";
				}	
					
			}
			
		}	
		
	}
	
	function applyStatusFilter(statusStr)
	{
		window.alert("Applying Status Filter : " + statusStr);
		
		var x = document.getElementById('allRecordsContainer');
		var statusStrs = x.getElementsByClassName('status');
		var len = statusStrs.length;
		var i;
		
		if(statusStr != "processing")
		{
			for(i=0;i<len;i++)
			{
				
				if(statusStrs[i].parentElement.style.display == "block" && statusStrs[i].innerText != statusStr)
				{
					statusStrs[i].parentElement.style.display = "none";
				}	
					
			}
		}
		else
		{
			for(i=0;i<len;i++)
			{
				
				if(statusStrs[i].parentElement.style.display == "block" && statusStrs[i].innerText != statusStr && statusStrs[i].innerText != "partiallyComplete")
				{
					statusStrs[i].parentElement.style.display = "none";
				}	
					
			}
			
		}	
			
			
			var finaltotal = 0;
			for(i=0;i<len;i++)
			{
				if(statusStrs[i].parentElement.style.display == "block")
				{
					var totTxt = statusStrs[i].parentElement.getElementsByClassName('total')[0].innerText.substring(3);
					var t = parseInt(totTxt);
					finaltotal = finaltotal + t;
				}	
			}
			
	    x = "<div><h2 id = 'finalTotal'>" + statusStr + " of total : Rs." + finaltotal + "</h2></div>";
	    document.getElementById('recordsum').innerHTML = x;

	}
	
	
	
	
	
	
	function unclickAll()
	{
		//searchbydateFlag = "unclicked";
		requestedFlag = "unclicked";
		paymentFlag = "unclicked";
		completedFlag = "unclicked";
		acceptedFlag = "unclicked";
		purchaseFlag = "unclicked";
		processingFlag = "unclicked";
		  
		
		document.getElementById('requested').style.backgroundColor = "#555555";
		document.getElementById('payment').style.backgroundColor = "#555555";
		document.getElementById('completed').style.backgroundColor = "#555555";
		document.getElementById('accepted').style.backgroundColor = "#555555";
		document.getElementById('purchase').style.backgroundColor = "#555555";
		document.getElementById('processing').style.backgroundColor = "#555555";
			
		makeAllRecordsVisible();
	
	}
	
	function makeAllRecordsVisible()
	{
		var x = document.getElementById('allRecordsContainer');
		var statusStrs = x.getElementsByClassName('status');
        var len = statusStrs.length;
        var i;
        
        for(i=0;i<len;i++)
        {
        	statusStrs[i].parentElement.style.display = "block";
        }	
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//filter for userRecords Search list
	
	function loadmainsearchbarUser()
	{
		//userlist with dues will be uploaded in the by default user list fired from the button on the header bar
		//time searchbar with search button
		//requested, completed, payment, accepted, purchase, processing
		
		var cont = "<table id = 'mainSearchBarUserContainer'>";
		
         cont = cont + "<tr>";
		
		cont = cont + "<td id = 'daycont'>DD : <select id='dayUser'>";
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
		
		cont = cont + "<td id = 'monthcont'>MM : <select id='monthUser'>";
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
		
		cont = cont + "<td id = 'yearcont'>YYYY : <select id='yearUser'>";
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
		
		cont = cont + "<td><button id = 'searchbydateUser'>search</button></td>";
		cont = cont + "</tr>";
		cont = cont + "<tr>";
		
		cont = cont + "<td><button id = 'requestedUser'>requested</button></td>";
		cont = cont + "<td><button id = 'paymentUser'>payment</button></td>";
		cont = cont + "<td><button id = 'completedUser'>completed</button></td>";
		cont = cont + "<td><button id = 'acceptedUser'>accepted</button></td>";
		cont = cont + "<td><button id = 'processingUser'>processing</button></td>";
		cont = cont + "<td><button id = 'transactionUser'>transactions</button></td></tr>";
		
		cont = cont + "<table>";

		document.getElementById('userbtns').innerHTML = cont;
		
		var sd = document.getElementById('searchbydateUser');
		var rq = document.getElementById('requestedUser');
		var pm = document.getElementById('paymentUser');
		var cm = document.getElementById('completedUser');
		var ac = document.getElementById('acceptedUser');
		var tr = document.getElementById('transactionUser');
		var po = document.getElementById('processingUser');
		
		//pr.style.display = "none";
		
		makeAllRecordsVisibleUser();
		
		
		
		sd.addEventListener('click',function(event){
			
			//unclickAll();
			
			if(searchbydateFlagUser == "unclicked")
			{
				searchbydateFlagUser = "clicked";
				event.target.style.backgroundColor = "#D288EE"; //#555555
			}
			else
			{
				searchbydateFlagUser = "unclicked";
				event.target.style.backgroundColor = "#555555";
				makeAllRecordsVisibleUser();
			}	
			
			applyFilterUser();
			
		});
		
		
		
           rq.addEventListener('click',function(event){
			
			if(requestedFlagUser == "unclicked")
			{
				unclickAllUser();
				requestedFlagUser = "clicked";
				event.target.style.backgroundColor = "#D288EE"; //#555555
			}
			else
			{
				requestedFlagUser = "unclicked";
				event.target.style.backgroundColor = "#555555";
				
			}	
			
			applyFilterUser();
			
		});
		
           
           pm.addEventListener('click',function(){
   			
   			if(paymentFlagUser == "unclicked")
   			{
   				unclickAllUser();
   				paymentFlagUser = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   				paymentFlagUser = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilterUser();
   			
   		});   
           
           
           cm.addEventListener('click',function(event){
   			
   			if(completedFlagUser == "unclicked")
   			{
   				unclickAllUser();
   				completedFlagUser = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   				completedFlagUser = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilterUser();
   			
   		});  
           
           
           ac.addEventListener('click',function(event){
   			
   			if(acceptedFlagUser == "unclicked")
   			{
   				unclickAllUser();
   				acceptedFlagUser = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   			    acceptedFlagUser = "unclicked";
   			 event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilterUser();
   			
   		});   
           
           
           tr.addEventListener('click',function(event){
   			
        	var xhttp = new XMLHttpRequest();
        	xhttp.onreadystatechange = function(){
        		
        		if(this.readyState == 4 && this.status == 200)
        		{
        			var result = this.responseText;
        			var jsonObj = JSON.parse(result);
        			var len = jsonObj.length;
        			
        			if(len == 0)
        			{
        				window.alert("No Transactions is made");
        			}
        			else
        			{
        				var temp = 0;
        				var i;
        				
        				cont1 = "<div><button id = 'defaultUserView'>Default View</button></div>";
        				cont2 = "</table>";
        				
        				for(i=len-1;0<=i;i--)
        				{
        					var contTemp = "<tr>";
        					var tot = parseInt(jsonObj[i].total);
        					var car = parseInt(jsonObj[i].carry);
        					tot = tot + car;
        					
	        					if(jsonObj[i].status == "completed")
	        					{
	        						temp = temp + tot;
	        						
	        						contTemp = contTemp + "<td>" + jsonObj[i].orderid + "</td>";
	        						//contTemp = contTemp + "<td>" + jsonObj[i].username + "</td>";
	        						contTemp = contTemp + "<td>" + jsonObj[i].productname + "</td>";
	        						contTemp = contTemp + "<td> Qt : " + jsonObj[i].quantity + "</td>";
	        						contTemp = contTemp + "<td> Rs." + jsonObj[i].total + "</td>";
	        						contTemp = contTemp + "<td> C-Rs." + jsonObj[i].carry + "</td>";
	        						contTemp = contTemp + "<td>" + jsonObj[i].date + "</td>";
	        						contTemp = contTemp + "<td>" + jsonObj[i].status + "</td>";
	        						contTemp = contTemp + "<td> Dues: Rs. " + temp + "</td>";
	        					}
	        					else
	        					{
	                                temp = temp - tot;
	        						
	        						contTemp = contTemp + "<td>" + jsonObj[i].orderid + "</td>";
	        						//contTemp = contTemp + "<td>" + jsonObj[i].username + "</td>";
	        						//contTemp = contTemp + "<td>" + jsonObj[i].productname + "</td>";
	        						//contTemp = contTemp + "<td> Qt : " + jsonObj[i].quantity + "</td>";
	        						contTemp = contTemp + "<td> Rs." + jsonObj[i].total + "</td>";
	        						contTemp = contTemp + "<td>" + jsonObj[i].date + "</td>";
	        						contTemp = contTemp + "<td>" + jsonObj[i].status + "</td>";
	        						contTemp = contTemp + "<td> Dues: Rs. " + temp + "</td>";
	        						
	        					}
        					
        					contTemp = contTemp + "</tr>";
							cont2 = contTemp + cont2;	        					
        				}	
        				
        				cont2 = "<table>" + cont2;
        				var cont = cont1 + cont2;
        				
        				document.getElementById('userbtns').innerHTML = cont;
        				document.getElementById('userrecords').innerHTML = "";
        				document.getElementById('defaultUserView').addEventListener('click',function(event){
        					
        					var uid = document.getElementById('userid').innerText.substring(9);
        					
        					uploadUserByUserId(uid);
        					
        				});
        				
        				
        			}	
        			
        			
        			//end of json function
        		}	
        	};
        	
        	var uid = document.getElementById('userid').innerText.substring(9);
        	var actionstr = "usertransaction?userid=" + uid;
        	xhttp.open("GET",actionstr,true);
        	xhttp.send();
        	

   			
   		});   
           
         
           po.addEventListener('click',function(event){
   			
   			if(processingFlagUser == "unclicked")
   			{
   				unclickAllUser();
   				processingFlagUser = "clicked";
   				event.target.style.backgroundColor = "#D288EE"; //#555555
   			}
   			else
   			{
   				processingFlagUser = "unclicked";
   				event.target.style.backgroundColor = "#555555";
   			}	
   			
   			applyFilterUser();
   			
   		});
           
	}
	
	
	function applyFilterUser()
	{
		makeAllRecordsVisibleUser();
		
		
		if(searchbydateFlagUser == "clicked")
		{
			var dd = document.getElementById('dayUser').value;
			var mm = document.getElementById('monthUser').value;
			var yy = document.getElementById('yearUser').value;
			
			if(dd != "00" && mm == "00")
			{
				window.alert("not a valid date, so failed to apply the date filter");
				searchbydateFlagUser = "unclicked";
				document.getElementById('searchbydateUser').style.backgroundColor = "#555555";
				
			}
			else
			{
				var str = dd + "." + mm + "." + yy;
				applyDateFilterUser(str);
			}
			
			
			
		}	
		
		if(requestedFlagUser == "clicked")
		{
			var str = "requested";
			applyStatusFilterUser(str);
		}	
		
		if(paymentFlagUser == "clicked")
		{
			var str = "payment";
			applyStatusFilterUser(str);
		}
		
		if(completedFlagUser == "clicked")
		{
			var str = "completed";
			applyStatusFilterUser(str);
		}
		
		if(acceptedFlagUser == "clicked")
		{
			var str = "accepted";
			applyStatusFilterUser(str);
		}
		
		if(purchaseFlagUser == "clicked")
		{
			var str = "purchase";
			applyStatusFilterUser(str);
		}
		
		if(processingFlagUser == "clicked")
		{
			var str = "processing";
			applyStatusFilterUser(str);
		}
		
		
	}
	
	function applyDateFilterUser(str)
	{
		window.alert("applying date filter : " + str);
		var dd = str.substring(0,2);
		var mm = str.substring(3,5);
		var yy = str.substring(6);
		
		var x = document.getElementById('userrecords');
		var dateStrs = x.getElementsByClassName('date');
		var len = dateStrs.length;
		var i;
		
		if(dd == "00" && mm != "00")
		{
			for(i=0;i<len;i++)
			{
				var mm1 = dateStrs[i].innerText.substring(3,5);
				var yy1 = dateStrs[i].innerText.substring(6);
				
				if(dateStrs[i].parentElement.style.display == "block" && (mm != mm1 || yy != yy1))
				{
					dateStrs[i].parentElement.style.display = "none";
				}	
					
			}
		}
		else if(dd == "00" && mm == "00")
		{
			for(i=0;i<len;i++)
			{
				//var mm1 = dateStrs[i].innerText.substring(3,5);
				var yy1 = dateStrs[i].innerText.substring(6);
				
				if(dateStrs[i].parentElement.style.display == "block" && yy != yy1)
				{
					dateStrs[i].parentElement.style.display = "none";
				}	
					
			}
		}
		else
		{
			for(i=0;i<len;i++)
			{
				var dd1 = dateStrs[i].innerText.substring(0,2);
				var mm1 = dateStrs[i].innerText.substring(3,5);
				var yy1 = dateStrs[i].innerText.substring(6);
				
				if(dateStrs[i].parentElement.style.display == "block" && (dd != dd1 || mm != mm1 || yy != yy1))
				{
					dateStrs[i].parentElement.style.display = "none";
				}	
					
			}
			
		}	
		
	}
	
	function applyStatusFilterUser(statusStr)
	{
		window.alert("Applying Status Filter : " + statusStr);
		
		var x = document.getElementById('userrecords');
		var statusStrs = x.getElementsByClassName('status');
		var len = statusStrs.length;
		var i;
		
		if(statusStr != "processing")
		{
			for(i=0;i<len;i++)
			{
				
				if(statusStrs[i].parentElement.style.display == "block" && statusStrs[i].innerText != statusStr)
				{
					statusStrs[i].parentElement.style.display = "none";
				}	
					
			}
		}
		else
		{
			for(i=0;i<len;i++)
			{
				
				if(statusStrs[i].parentElement.style.display == "block" && statusStrs[i].innerText != statusStr && statusStrs[i].innerText != "partiallyComplete")
				{
					statusStrs[i].parentElement.style.display = "none";
				}	
					
			}
			
		}

	}
	
	
	
	
	
	
	function unclickAllUser()
	{
		//searchbydateFlag = "unclicked";
		requestedFlagUser = "unclicked";
		paymentFlagUser = "unclicked";
		completedFlagUser = "unclicked";
		acceptedFlagUser = "unclicked";
		purchaseFlagUser = "unclicked";
		processingFlagUser = "unclicked";
		  
		
		document.getElementById('requestedUser').style.backgroundColor = "#555555";
		document.getElementById('paymentUser').style.backgroundColor = "#555555";
		document.getElementById('completedUser').style.backgroundColor = "#555555";
		document.getElementById('acceptedUser').style.backgroundColor = "#555555";
		//document.getElementById('purchaseUser').style.backgroundColor = "#555555";
		document.getElementById('processingUser').style.backgroundColor = "#555555";
			
		makeAllRecordsVisibleUser();
	
	}
	
	function makeAllRecordsVisibleUser()
	{
		var x = document.getElementById('userrecords');
		var statusStrs = x.getElementsByClassName('status');
        var len = statusStrs.length;
        var i;
        
        for(i=0;i<len;i++)
        {
        	statusStrs[i].parentElement.style.display = "block";
        }	
	}
	
	
// End Of user records search list
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function loaduserslist(str)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				
				if(len > 0)
				{
					var cont = "<table id = 'userslistContainer'border = '1'>";
					
					var i;
					
					/*if(userslistflag == "userslist")
					{
						cont = cont + "<tr><td colspan='3'><button id =  'recentsort'>Recent</button></td>";
					}
					else
					{
						cont = cont + "<tr><td colspan='3'><button id =  'recentsort'>Default</button></td>";
					}*/
					
					cont = cont + "<tr><td colspan = '3'><input type = 'text' id = 'userlistSearchText' placeholder = 'Type a name'></td></tr>";
					cont = cont + "<tr><td colspan = '2'>Sort By : <select id = 'searchType'>";
					cont = cont + "<option value='recent'>Recent</option>";
					cont = cont + "<option value='dues'>Dues</option>";
					cont = cont + "<option value='default'>Default</option>";
					cont = cont + "</select></td>";
					
					cont = cont + "<td><button id = 'usersearch'>Search</td><tr>";
					
					
					
					
					
					
					cont = cont + "<tr><th>UserID</th><th colspan = '2'>UserName</th></tr>";
					
					
					for(i=0;i<len;i++)
					{
						cont = cont + "<tr class = 'itemUser'>";
						cont = cont + "<td class = 'userid'>" + jsonObj[i].userid + "</td>";
						cont = cont + "<td class = 'username'><font face = 'georgia' color = 'blue'>" + jsonObj[i].username + "</font></td>";
						cont = cont + "<td><button class = 'go'>Go</button></td>";
						cont = cont + "</tr>";
					}	
					
					cont = cont + "</table>";
					
					document.getElementById('userslist').innerHTML = cont;
					
					var gobtns = document.getElementById('userslistContainer').getElementsByClassName('go');
					
					for(i=0;i<len;i++)
					{
						gobtns[i].addEventListener('click',uploaduser);
					}
					
					var recentbtn = document.getElementById('usersearch');
					var st = document.getElementById('userlistSearchText');
					
					
					//var defbtn = document.getElementById('default');
					
					/*if(userslistflag == "userslist")
					{
						defbtn.style.display = "none";
						recentbtn.style.display = "block";
					}
					else
					{
						defbtn.style.display = "block";
						recentbtn.style.display = "none";
					}*/	
					
					
					recentbtn.addEventListener('click',sortbyCategory);
					st.addEventListener('keyup',searchByUserName);
					
				//if len > 0 ends	
				}	
				
				//end of inside json function
			}	
		};
		
		
		//str = userslist
		
		userslistflag = str;
		
		var actionstr = str;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}
	
	
	function searchByUserName(event)
	{
		var child = event.target.value;
		var x = document.getElementById('userslistContainer');
		var users = x.getElementsByClassName('itemUser');
		var len = users.length;
		var i;
		
		
		if(child == "")
		{
			for(i=0;i<len;i++)
			{
				users[i].style.display = "block";
			}	
		}
		else
		{
				child = child.toLowerCase();
				
				for(i=0;i<len;i++)
				{
					var mother = users[i].getElementsByClassName('username')[0].innerText;
					//console.log(mother);
					
					mother = mother.toLowerCase();
					
					if(mother.indexOf(child) == 0)
					{
						users[i].style.display = "block";
					}
					else{

						users[i].style.display = "none";
					}	
					
				}
			
		}	
	}
	
	
	function sortbyCategory(event)
	{
		var btntxt = document.getElementById('searchType').value;
		
		if(btntxt == "recent")
		{
			var str = "recentsorteduserslist";
			loaduserslist(str);
		}
		else if(btntxt == "default")
		{
			var str = "userslist";
			loaduserslist(str);
			
		}
		else
		{
			window.alert("right now directing to default, later on servlet will be connected");
			//var str = "duessorteduserslist";
			
			var str = "userslist";
			loaduserslist(str);
		}	
		
		
	}
	
	function uploaduser(event)
	{
		var userid = event.target.parentElement.parentElement.getElementsByClassName('userid')[0].innerText;
		window.alert("profile of userid : " + userid + " will be loaded");
		
		
		//those three functions defines the total upload user function
		uploadUserByUserId(userid);		
	}
	
	
	
	//this is a helpful function to upload user anywhere
	function uploadUserByUserId(str)
	{
		uploadprofileinfo(str);
		//uploadprofiledues(userid);
		uploadprofilerecord(str);
		
	}
	
	/*function uploadUserRecordSearchButtons()
	{
		//requested
		//dues calculation
		//payments
		//accepted
		//processing
		//completed
		
		var cont = "<div id = 'userbtnContainer'>";
		cont = cont + "<button id = 'userrequested'>Requested</button>";
		cont = cont + "<button id = 'transactions'>Transactions</button>";
		cont = cont + "<button id = 'payments'>Payments</button>";
		cont = cont + "<button id = 'accepted'>Accepted</button>";
		cont = cont + "<button id = 'processing'>Processing</button>";
		cont = cont + "<button id = 'completed'>Completed</button></div>";
		
		document.getElementById('userbtns').innerHTML = cont;
		
	}
	
	function uploadprofiledues(str)
	{
		cont = "<div><h3>Dues</h3>";
		cont = cont + "<h1>Rs. 0.0</h1></div>";
		
		document.getElementById('userdues').innerHTML = cont;
		
		
	}*/
	
	function uploadprofilerecord(str)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
		
		if(this.readyState == 4 && this.status == 200)
		{
			var result = this.responseText;
			var jsonObj = JSON.parse(result);
			var len = jsonObj.length;
			
			if(len == 0)
			{
				document.getElementById('userrecords').innerHTML = "<div><h2>No Records Found</h2></div>";
			}
			else
			{
				var i;
				cont = "<table id ='userrecordContainer' border = '1'>";
				for(i=0;i<len;i++)
				{
					cont = cont + transformuserorder(jsonObj[i]);
				}	
				
				cont = cont + "</table>";
				document.getElementById('userrecords').innerHTML = cont;
				
				var x = document.getElementById('userrecordContainer');
				
				unclickAllUserFlag();
				loadmainsearchbarUser();
				
				
				
				var acceptbtns = x.getElementsByClassName('acceptrequest');
				var len1 = acceptbtns.length;
				
				for(i=0;i<len1;i++)
				{
					acceptbtns[i].addEventListener('click',acceptUserRequest);
				}	
				
			}
		}
	};
		
		//"loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid=" + uid;
		var actionstr = "loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid=" + str;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	
	function acceptUserRequest(event)
	{
		var x = event.target.parentElement.parentElement;
		//var uid = x.getElementsByClassName('userid')[0].innerText;
		//var oid = x.getElementsByClassName('orderid')[0].innerText.substring(10);
		//var tot = x.getElementsByClassName('total')[0].innerText.substring(3);
		
		var btnContainer = event.target.parentElement; //the td that contains the button
		
		cont = "<div>Rs.<input type = 'text' class = 'carryingCharge' placeholder = 'Carrying Charge'>";
		cont = cont + "<button class = 'save'>Save and accept</button><button class = 'cancel'>cancel</button></div>";
		btnContainer.innerHTML = cont;
		
		btnContainer.getElementsByClassName('save')[0].addEventListener('click',function(event){
			
			var carry = event.target.parentElement.getElementsByClassName('carryingCharge')[0].value;
			var tot = event.target.parentElement.parentElement.parentElement.getElementsByClassName('total')[0].innerText.substring(3);
			var uid = document.getElementById('userid').innerText.substring(9);
			var oid = event.target.parentElement.parentElement.parentElement.getElementsByClassName('orderid')[0].innerText;
			
			window,alert("userid : " + uid + " orderid : " + oid + " total : " + tot + " carry : " + carry);
			//loadmainrecord();
			acceptUserOrderWithTotalAndCarryU(uid,oid,tot,carry);
			
		});
		
        btnContainer.getElementsByClassName('cancel')[0].addEventListener('click',function(event){
			
        	var x = event.target.parentElement.parentElement; 
			x.innerHTML = "<button class = 'acceptrequest'>accept</button>";
			
			x.getElementsByClassName('acceptrequest')[0].addEventListener('click',acceptUserRequest);
			
		});
		
		
		
	//end of accept request
		
		
	}
	
	
	function acceptUserOrderWithTotalAndCarryU(uid,oid,tot,carry)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj[0] == "successful")
				{
					window.alert("Successfully Accepted");
					var uuid = document.getElementById('userid').innerText.substring(9);
					uploadprofilerecord(uuid);
					loadmainrecord();
				}
				else
				{
					window.alert("Acceptation Failed");
				}	
				
			}
		};
		
		var actionstr = "acceptorder?userid=" + uid + "&orderid=" + oid + "&total=" + tot + "&carry=" + carry;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}
	
	
	function transformuserorder(order)
	{
        var cont = "<tr>";
		
		if(order.status == "payment")
		{
			//orderid total date 
			//for userpage userid and username are not required
			
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td>Rs." + order.total + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>"
			cont = cont + "</tr>";
			
		}
		else if(order.status == "purchase")
		{
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td>Businessman</td>"; 
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td> Qt : " + order.quantity + "</td>";
			cont = cont + "<td> Rs." + order.total + "</td>";
			cont = cont + "<td>" + order.date + "</td>";
			cont = cont + "<td>" + order.status + "</td>";
			cont = cont + "</tr>";
		}
		else if(order.status == "requested")
		{
			
			//as it is for customer page so user info is not necessary
			//it will be necessary for the businessman page
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'><font size ='5'>" + order.orderid + "</font></td>";
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td> Qt : " + order.quantity + "</td>";
			cont = cont + "<td class = 'total'> Rs." + order.total + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			cont = cont + "<td><button class = 'acceptrequest'>accept</button></td>";
			cont = cont + "</tr>";
		}
		else if(order.status.substring(0,17) == "partiallyComplete")
		{
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			//cont = cont + "<td class = 'userid'>" + order.userid + "</td>";
			//cont = cont + "<td>" + order.username + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td class = 'delivered'>Delivered : " + calculateDelivered(order) + "</td>";
			cont = cont + "<td class = 'remained'>Remained : " + order.quantity + "</td>";
			cont = cont + "<td class = 'total'> Rs." + order.total + "</td>";
			cont = cont + "<td class = 'carry'>C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status.substring(0,17) + "</td>";
			//cont = cont + "<td><button class = 'complete'>Complete</button><button class = 'partial'>Partial</button></td>";
			//cont = cont + "<div class = 'partiallyCompleteContainer'></div></td>";
			//cont = cont + "<td><button class = 'userinfo'>UserInfo</button></td>";
			cont = cont + "</tr>";
		}
		else
		{
			//oid,pid,pname,qt,date,st,tot
			
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'><font size = '3'>" + order.orderid + "</font></td>";
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td> Qt : " + order.quantity + "</td>";
			cont = cont + "<td> Rs." + order.total + "</td>";
			cont = cont + "<td> C-Rs." + order.carry + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td class = 'status'>" + order.status + "</td>";
			//cont = cont + "<td><button class = 'cancelrequest'>cancel</button></td>";
			cont = cont + "</tr>";
			
		}
		
	return cont;	
		
	}
	
	function showDues(str)
	{
		var dues = parseInt(str);
		//payment is stored as minus and dues are stored as plus
		var finaldues;
		
		if(dues < 0)
		{
			finaldues = 0 - dues;
			finaldues = finaldues + "(Advance)";
		}
		else
		{
			finaldues = dues;
		}
	return finaldues;	
	}
	
	
	function uploadprofileinfo(str)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				//<font face="verdana" color="green">This is some text!</font>
				var cont = "<div id = 'profileinfo'>";
				cont = cont + "<h2 id = 'userid'>UserID : " + jsonObj[0].userid + "</h2>";
				cont = cont + "<h1 id = 'username'><font face='georgia' color='green'>" + jsonObj[0].username + "</font></h1>";
				cont = cont + "<h2 id = 'dues'>Dues : Rs." + showDues(jsonObj[0].dues) + "<div id = 'payCont'><button id = 'makePayment'>Pay</button></div></h2>";
				cont = cont + "<h2 id = 'contact'>Ph : " + jsonObj[0].contact + "</h2>";
				cont = cont + "<h3 id = 'address'><address>" + jsonObj[0].address + "</address></h3>";
				cont = cont + "</div>";
				
				document.getElementById('userprofile').innerHTML = cont;
				var x = document.getElementById('makePayment');
				x.addEventListener('click',function(event){
					
				var cont = "Rs.<input type = 'text' id = 'paymentText' placeholder = 'Enter payment Amount'><button id = 'confirmPayment'>Submit</button>";
				document.getElementById('payCont').innerHTML = cont;
				document.getElementById('confirmPayment').addEventListener('click',function(event){
						
						var amount = document.getElementById('paymentText').value;
						var uid = document.getElementById('userid').innerText.substring(9);
						
						var xhttp = new XMLHttpRequest();
						xhttp.onreadystatechange = function(){
							
							if(this.readyState == 4 && this.status == 200)
							{
								var result = this.responseText;
								var jsonObj = JSON.parse(result);
								if(jsonObj[0] == "successful")
								{
									window.alert("payment for userID : " + uid + " of amount : Rs." + amount + " is made successfully");
									var uid1 = document.getElementById('userid').innerText.substring(9);
									uploadUserByUserId(uid1);
									loadmainrecord();
								}
								else
								{
									window.alert("payment failed");
								}	
							}	
						};
						
						var d = currentDate();
						var actionstr = "paymentuser?userid=" + uid + "&amount=" + amount + "&date=" + d;
						xhttp.open("GET",actionstr,true);
						xhttp.send();
						
						
					});
					
					
				});
				
				
			}	
			
		};
		
		var actionstr = "loadprofileinfo?userid=" + str;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}

	function currentDate()
	{
		var d = new Date();
			var dd = d.getDate();
			var mm = d.getMonth();
			mm = mm + 1;
			var yy = d.getFullYear();
			
			var dd1 = dd.toString();
			
			if(dd1.length == 1)
			{
				dd1 = "0" + dd1;
			}	
			
			var mm1 = mm.toString();
			
			if(mm1.length == 1)
			{
				mm1 = "0" + mm1;
			}	
			
			var yy1 = yy.toString();
			
			var finaldate = dd1 + "." + mm1 + "." + yy1;
			
	return finaldate;		
	}

</script>




</head>
<body onload = "initiate()">

	<p id='userslist'>list of users will be printed here</p>
	
	
	<p id='userprofile'>Users profile info will be loaded here</p>
	<p id='userbtns'>Users Buttons will be loaded here</p>
	<p id='userrecords'>Users activity will be loaded here</p>

	<p id='allproducts'>List Of All Products will be loaded here</p>

	<p id='allrecords'>any sort of searched records will be printed here</p>
	<p id='allrecordsSearchbar'>any sort of searched records will be printed here</p>
	<p id='recordsum'>any sort of searched records will be printed here</p>

</body>
</html>