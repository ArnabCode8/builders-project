<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.UserBean"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>


<script>


	
/*	  tr.addEventListener('click',function(event){
   			
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
           */








	
	var uname,pass,con,addr;
	var unfilteredcheckstr = 0;
	
	
	var dateFlag = "unclicked";
	var paymentFlag = "unclicked";
	var requestedFlag = "unclicked";
	var completedFlag = "unclicked";
	var acceptedFlag = "unclicked";
	var processingFlag = "unclicked";
	
	
	var content;
	var limit = 5;
	var pagenum = 0;
	var rest = 0;
	
	
	//this is coming from the login page
	function loadProfile1()
	{
		<% ArrayList<UserBean>obj1 = (ArrayList<UserBean>)request.getAttribute("user"); %>
		var obj=<%=new ObjectMapper().writeValueAsString(obj1)%>;
		
		 var cont = "<div id = 'profile'>";
		 cont = cont + "<h1 id = 'userid'>UserId : " + obj[0].userid + "</h1>";
		 cont = cont + "<h1 id = 'userDues'>Dues: Rs." + obj[0].dues + "</h1>";
		 cont = cont + "<h2 id = 'username'>Username : " + obj[0].username + "</h2>";
		 cont = cont + "<h2 id = 'contact'>Contact : " + obj[0].contact + "</h2>";
		 cont = cont + "<h3 id = 'address'>Address : " + obj[0].address + "</h3>";
		 cont = cont + "<div id = 'Userbtns'><button id = 'editprofile'>Edit</button></div>";
		// cont = cont + "<button id = 'saveprofile'>save</button></div>";
		 
		 document.getElementById('profileout').innerHTML = cont;
		 
		//addActions();
		
		document.getElementById('editprofile').addEventListener('click',openEditProf);
		 
	
	}
	

	function loadProfile()
	{
		 uname = sessionStorage.getItem("username");
		 con = sessionStorage.getItem("contact");
		 addr = sessionStorage.getItem("address");
		 
		 //document.write(uname + " " + con + " " + addr);
		 
		 var cont = "<div id = 'profile'>";
		 cont = cont + "<h1 id = 'username'>Username : " + uname + "</h1>";
		 cont = cont + "<h2 id = 'contact'>Contact : " + con + "</h2>";
		 cont = cont + "<h3 id = 'address'>Address : " + addr + "</h3>";
		 cont = cont + "<div id = 'Userbtns'><button id = 'editprofile'>Edit</button></div>";
		// cont = cont + "<button id = 'saveprofile'>save</button></div>";
		 
		 document.getElementById('profileout').innerHTML = cont;
		 
		//addActions();
		
		document.getElementById('editprofile').addEventListener('click',openEditProf);
		
		
		
		
	}
	
	/*function addActions()
	{
		var editprof = document.getElementById('editprofile');
		var saveprof = document.getElementById('saveprofile');
		
		saveprof.style.visibility = 'hidden';
		
		editprof.addEventListener("click",openEditProf);
		saveprof.addEventListener("click",saveEditProf);
	}*/
	
	function openEditProf(event)
	{
		var conComp = document.getElementById('contact');
		var addrComp = document.getElementById('address');
		var nameComp = document.getElementById('username');
		
		
		var contxt = conComp.innerText;
		var addrtxt = addrComp.innerText;
		var nametxt = nameComp.innerText;
		
		contxt = contxt.substring(10);
		addrtxt = addrtxt.substring(10);
		nametxt = nametxt.substring(11);
		
		//console.log("contxt : " + contxt + " addrtxt : " + addrtxt);
		
		var replaceName = "UserName : <input type = 'text' id = 'nametxt' value = '" + nametxt + "'>";
		var replaceCon = "Contact : <input type = 'text' id = 'contxt' value = '" + contxt + "'>";
		var replaceAddr = "Address : <textarea id = 'addrtxt' rows = '2' cols = '20'>" + addrtxt + " </textarea>";
		
		conComp.innerHTML = replaceCon;
		addrComp.innerHTML = replaceAddr;
		nameComp.innerHTML = replaceName;
		
		document.getElementById('Userbtns').innerHTML = "<button id = 'saveprofile'>Save</button><button id = 'cancelEdit'>Cancel</button>";
		
		document.getElementById('saveprofile').addEventListener('click',saveEditProf);
		document.getElementById('cancelEdit').addEventListener('click',function(){
			
			loadProfile1();
			
		});
		
		//y.style.visibility = 'hidden';
	}
	
	function saveEditProf(event)
	{
		var idComp = document.getElementById('userid');
		var idtxt = idComp.innerText;
		idtxt = idtxt.substring(9);
				
		var username1 = document.getElementById('nametxt').value;  //nametxt
		var contact1 =  document.getElementById('contxt').value;  //contxt 
		var address1 =  document.getElementById('addrtxt').value;  //addrtxt
		var dues1 = document.getElementById('userDues').innerText;
		
		 var xhttp = new XMLHttpRequest();
		 xhttp.onreadystatechange = function(){
			
			 if(this.readyState == 4 && this.status == 200)
			 {
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var strp = jsonObj[0]; 
				

				if(strp = "successful")
				{
					window.alert("updated successfully");
					
					var username = document.getElementById('nametxt').value;  //nametxt
					var contact =  document.getElementById('contxt').value;  //contxt 
					var address =  document.getElementById('addrtxt').value;  //addrtxt
					

					 var cont = "<div id = 'profile'>";
					 cont = cont + "<h1 id = 'userid'>UserId : " + idtxt + "</h1>";
					 cont = cont + "<h1 id = 'userDues'>" + dues1 + "</h1>";
					 cont = cont + "<h1 id = 'username'>Username : " + username + "</h1>";
					 cont = cont + "<h2 id = 'contact'>Contact : " + contact + "</h2>";
					 cont = cont + "<h3 id = 'address'>Address : " + address + "</h3>";
					 cont = cont + "<div id = 'Userbtns'><button id = 'editprofile'>Edit</button></div>";
					 //cont = cont + "<button id = 'saveprofile'>save</button></div>";
					 
					 document.getElementById('profileout').innerHTML = cont;
					 
					 document.getElementById('editprofile').addEventListener('click',openEditProf);

				}
				else
				{
					window.alert("updation failed");
				}	
								 
			 }
		 };
		 
		 var actionstr = "update?userid=" + idtxt + "&username=" + username1 + "&contact=" + contact1 + "&address=" + address1;
		 xhttp.open("GET",actionstr,true);
		 xhttp.send();
		
	}

	
	function loadHeaderBar()
	{
		var cont = "<ul id = 'menu'>";
		cont = cont + "<li><button id = 'placeorder'>PlaceOrder</button></li>";
		cont = cont + "<li><button id = 'mykart'>My Kart</button></li>";
		cont = cont + "<li><button id = 'activity'>My Activities</button></li>";
		cont = cont + "<li><button id = 'dues'>Dues and its records</button></li>";
		cont = cont + "<li><button id = 'logout'>LogOut</button></li>";
		cont = cont + "<li><button id = 'deleteaccount'>DeleteAcc</button></li></ul>";
		
		document.getElementById('headerout').innerHTML = cont;
		
		addHeaderActions();
	}
	
	function addHeaderActions()
	{
		var po = document.getElementById('placeorder');
		var mo = document.getElementById('mykart');
		var lo = document.getElementById('logout');
		var da = document.getElementById('deleteaccount');
		var ac = document.getElementById('activity');
		var du = document.getElementById('dues');
		
		
		po.addEventListener("click",fplaceorder);
		mo.addEventListener("click",fmyorders);
		lo.addEventListener("click",flogout);
		da.addEventListener("click",fdeleteaccount);
	    ac.addEventListener("click",loadactivityunfiltered);
	    du.addEventListener("click",showdues);
	    
	    
	    
	    
	}
	
	
	function showdues()
	{
		window.alert("dues been clicked");
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
    				
    				cont1 = "<div><button id = 'defaultUserView'>Hide View</button></div>";
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
    				
    				document.getElementById('userduesout').innerHTML = cont;
    				
    				document.getElementById('defaultUserView').addEventListener('click',function(event){
    					
    					//var uid = document.getElementById('userid').innerText.substring(9);
    					
    					document.getElementById('userduesout').innerHTML = "";
    					
    					
    				});
    				
    				
    			}	
    			
    			
    			//end of json function
    		}	
    	};
    	
    	var uid = document.getElementById('userid').innerText.substring(9);
    	var actionstr = "usertransaction?userid=" + uid;
    	xhttp.open("GET",actionstr,true);
    	xhttp.send();
    	

		
		
		
	}
	
	
	
	
	
	
	function loadactivityunfiltered(event)
	{
		var uid = document.getElementById('userid').innerText.substring(9);
		var str = "loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid=" + uid;
		loadactivity(str);
	
		//var len = document.getElementsByClassName('orderid').length;
	
		
		//loadSearchBarForActivity();
		
		// if some record exists then loadSearchBarForActivity();
	}
	
	//when unfiltered activity is loaded, only then if the list is non empty, then the seachbar will be loaded
	//so in load activity we need to check the length of the jsonObj and judging by it the searchbar will be loaded
	
	
	
	
	function loadactivity(str)
	{
		//var uid = document.getElementById('userid').innerText.substring(9);
		//"loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid="
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				var i;
				
				if(len == 0)
				{
						document.getElementById('productout').innerHTML = "<h2>No Record Found</h2>";
					
				}	
				else
				{	
					//printing the total first
					
					var tsum = 0;
					var csum = 0;
					var j;
					
					
					for(j=0;j<len;j++)
					{
						tsum = tsum + parseInt(jsonObj[j].total);
						csum = csum + parseInt(jsonObj[j].carry);
					}	
					
					document.getElementById('totalout').innerHTML = "<h2>Total : Rs." + tsum + " And Carrying Charge : Rs." + csum + "</h2>";
					
					
					
					var str1 = "loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid=";
					
					if(str.substring(0,93) == str1)
					{
						document.getElementById('totalout').style.display = "none";
						loadSearchBarForActivity();
					}
					else
					{
						document.getElementById('totalout').style.display = "block";
					}	
					
					
					
					//loadSearchBarForActivity();
					
					cont = "<table id = 'recordContainer' border = '1'>";
					
					if(len < limit + 1)
					{
						for(i = 0;i<len;i++)
						{
							cont = cont + transform(jsonObj[i]);
						}
					}
					else
					{
						pagenum = len/limit;
						pagenum = parseInt(pagenum);
						//window.alert("Pagenum calculated : " + pagenum);
						
						rest = len - pagenum*limit;
						content = jsonObj;
						
						for(i = 0;i<limit;i++)
						{
							cont = cont + transform(jsonObj[i]);
						}
						
						cont = cont + "<tr>";
						var btnnum;
						if(rest == 0)
						{
							btnnum = pagenum;
						}
						else
						{
							btnnum = pagenum + 1;
						}	
						
						for(i = 0;i<btnnum;i++)
						{
							cont = cont + "<td><button class = 'btnact'>" + (i+1) + "</button></td>";	
						}
						cont = cont + "</tr>";
					}
					
					cont = cont + "</table>";
					document.getElementById('productout').innerHTML = cont;				
					//loadSearchBarForActivity(); // will be loaded at the searchout paragraph
					
					
					addBtnActionForActivityPage();

				}	
			}
		};
			
		var actionstr = str;
		window.alert("actionstr : " + actionstr);
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
		//presuming this will be executed after the execution of the raedystate function
		//result : it does not	
	}
	
	
	function loadSearchBarForActivity()
	{
		//this trick not going to work
		//var len22 = document.getElementsByClassName('orderid').length;
		//window.alert("First Page length : " + len22);
		
		
		var cont = "<table id = 'searchForActivity' border = '1'>";
		
		cont = cont + "<tr>";
		
		cont = cont + "<td>DD : <select id='day'>";
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
		
		cont = cont + "<td>MM : <select id='month'>";
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
		
		cont = cont + "<td>YYYY : <select id='year'>";
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
		
		cont = cont + "<td><button id = 'searchbydatebtn'>search</button></td>";
		cont = cont + "</tr>";
		cont = cont + "<tr>";
		
		cont = cont + "<td><button id = 'requested'>requested</button></td>";
		cont = cont + "<td><button id = 'payment'>payment</button></td>";
		cont = cont + "<td><button id = 'completed'>completed</button></td>";
		cont = cont + "<td><button id = 'accepted'>accepted</button></td>";
		cont = cont + "<td><button id = 'processing'>processing</button></td></tr>";
		
		cont = cont + "<table>";
		
		document.getElementById('searchout').innerHTML = cont;
		
		addLoadSearchBarForActivityActions();
	}
		
	function addLoadSearchBarForActivityActions()
	{
		window.alert("searchbar for activity enabled");
		
		var srchbtn = document.getElementById('searchbydatebtn');
		var paybtn =  document.getElementById('payment');
		var reqbtn = document.getElementById('requested');
		var combtn = document.getElementById('completed');
		var acceptbtn = document.getElementById('accepted');
		var processbtn = document.getElementById('processing');
		
		
		srchbtn.style.backgroundColor = "#555555";
		paybtn.style.backgroundColor = "#555555";
		reqbtn.style.backgroundColor = "#555555";
		combtn.style.backgroundColor = "#555555";
		acceptbtn.style.backgroundColor = "#555555";
		processbtn.style.backgroundColor = "#555555";
		
		
		srchbtn.addEventListener('click',function(event){
			
			if(dateFlag == "clicked")
			{
				dateFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
			}
			else
			{
				dateFlag = "clicked";
				event.target.style.backgroundColor = "#FF5733";
			}	
			
			applyFilter();
			
		});
		
		
        paybtn.addEventListener('click',function(event){
			
			if(paymentFlag == "clicked")
			{
				paymentFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
			}
			else
			{
				unclickAll();
				paymentFlag = "clicked";
				event.target.style.backgroundColor = "#FF5733";
			}	
			
			applyFilter();
			
		});
		
        
        reqbtn.addEventListener('click',function(event){
			
			if(requestedFlag == "clicked")
			{
				requestedFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
			}
			else
			{
				unclickAll();
				requestedFlag = "clicked";
				event.target.style.backgroundColor = "#FF5733";
			}	
			
			applyFilter();
			
		});
		
        combtn.addEventListener('click',function(event){
			
			if(completedFlag == "clicked")
			{
				completedFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
			}
			else
			{
				unclickAll();
				completedFlag = "clicked";
				event.target.style.backgroundColor = "#FF5733";
			}	
			
			applyFilter();
			
		});
        
       acceptbtn.addEventListener('click',function(event){
			
			if(acceptedFlag == "clicked")
			{
				acceptedFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
			}
			else
			{
				unclickAll();
				acceptedFlag = "clicked";
				event.target.style.backgroundColor = "#FF5733";
			}	
			
			applyFilter();
			
		});
        
        
       processbtn.addEventListener('click',function(event){
			
			if(processingFlag == "clicked")
			{
				processingFlag = "unclicked";
				event.target.style.backgroundColor = "#555555";
			}
			else
			{
				unclickAll();
				processingFlag = "clicked";
				event.target.style.backgroundColor = "#FF5733";
			}	
			
			applyFilter();
			
		});
        
		
	}
	
	function unclickAll()
	{
		 paymentFlag = "unclicked";
		 requestedFlag = "unclicked";
		 completedFlag = "unclicked";
		 acceptedFlag = "unclicked";
		 processingFlag = "unclicked";

		
		document.getElementById('searchbydatebtn').style.backgroundColor = "#555555";
		document.getElementById('payment').style.backgroundColor = "#555555";
		document.getElementById('requested').style.backgroundColor = "#555555";
		document.getElementById('completed').style.backgroundColor = "#555555";
		document.getElementById('accepted').style.backgroundColor = "#555555";
		document.getElementById('processing').style.backgroundColor = "#555555";
				
		//.style.backgroundColor = "#FF5733";
	}
	
	function applyFilter()
	{
		var date = "none";
		var payment = "none";
		var request = "none";
		var process = "none";
		var accept = "none";
		var complete = "none";
		
		
		
		
		if(dateFlag == "clicked")
		{
			var dd = document.getElementById('day').value;
			var mm = document.getElementById('month').value;
			var yy = document.getElementById('year').value;
			
			if(dd != "00" && mm == "00")
			{
				window.alert("Select a convenient month");
			}
			else
			{
			    date = dd + "." + mm + "." + yy;
				window.alert("date selected : " + date);
				
			}
		}	
		
		if(paymentFlag == "clicked")
		{
			payment = "yes";
		}	
		
		if(requestedFlag == "clicked")
		{
			request = "yes";
		}	
		
		if(processingFlag == "clicked")
		{
			process = "yes";
		}	
		
		if(acceptedFlag == "clicked")
		{
			accept = "yes";
		}	
			
		if(completedFlag == "clicked")
		{
			complete = "yes";
		}
			
		var uid = document.getElementById('userid').innerText.substring(9);
		var str = "loadrecord?date=" + date + "&payment=" + payment + "&request=" + request + "&process=" + process;
		str = str + "&accept=" + accept + "&complete=" + complete + "&userid=" + uid;
		
		loadactivity(str);
	}
	
	
	
	
	
	
	
	function addBtnActionForActivityPage()
	{
		var btns = document.getElementsByClassName('btnact');
		var cancelbtns = document.getElementById('recordContainer').getElementsByClassName('cancelrequest');
		var len = btns.length;
		var canlen = cancelbtns.length;
		
		if(len > 0)
		{
			var i;
			
			for(i=0;i<len;i++)
			{
				btns[i].addEventListener('click',showactivitynext);
			}
		}
		
		if(canlen > 0)
		{
			var i;
			
			for(i=0;i<canlen;i++)
			{
				cancelbtns[i].addEventListener('click',cancelorderrequest);
			}
		}
		
	}
	
	
	
	function cancelorderrequest(event)
	{
		var x = event.target.parentElement.parentElement;
		var oid = x.getElementsByClassName('orderid')[0].innerText;
		var uid = document.getElementById('userid').innerText.substring(9);
		
		window.alert("userid : " + uid + " and orderid : " + oid);
        
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				
				if(jsonObj[0] == "successful")
				{
					window.alert("Successfully Removed");
					var uidTemp = document.getElementById('userid').innerText.substring(9);
					var str = "loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid=";
					str = str + uidTemp;
					loadactivity(str);
				}
				else
				{
					window.alert("Failed to remove");
				}	
				
			}
		};
		
		var actionstr = "cancelorderrequest?userid=" + uid + "&orderid=" + oid;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	
	
	
	
	function showactivitynext(event)
	{
		var x = event.target;
		var y = x.innerText;
		//window.alert(y + " is clicked");	
		var i = parseInt(y);
		
		//window.alert("i : " + i);
		
		var cont = "<table id = 'recordContainer' border = '1'>";
		//cont = cont + "<tr><td>Activities are being loaded here</td></tr>"
		if(i<=pagenum)
		{
			//(i-1)*limit to (i*limit - 1)
			
			var start = (i-1)*limit;
			var end = (i*limit - 1);
			var j;
			 
			for(j = start;j<=end;j++)
			{
				cont = cont + transform(content[j]);
			}
			
		}
		else
		{
			//(i-1)*limit to (i-1)*limit + rest - 1
			
			var start = (i-1)*limit;
			var end = (i-1)*limit + rest - 1;
			var j;
			
			//window.alert("start : " + start);
			//window.alert("end : " + end);
			
			for(j = start;j<=end;j++)
			{
				cont = cont + transform(content[j]);
			}
			
		}	
		
		
		var btnnum;
		var k;
		
		cont = cont + "<tr>";
		
		if(rest == 0)
		{
			btnnum = pagenum;
		}
		else
		{
			btnnum = pagenum + 1;
		}	
		
		for(k=0;k<btnnum;k++)
		{
			cont = cont + "<td><button class = 'btnact'>" + (k+1) + "</button></td>";	
		}
		cont = cont + "</tr>";
		cont = cont + "</table>";
		document.getElementById('productout').innerHTML = cont;
		
		addBtnActionForActivityPage();
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function transform(order)
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
			cont = cont + "<td>" + order.status + "</td>";
			cont = cont + "</tr>";
			
		}
		else if(order.status == "purchase")
		{
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			cont = cont + "<td> username : Businessman</td>"; 
			cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td> productname : " + order.productname + "</td>";
			cont = cont + "<td> quantity : " + order.quantity + "</td>";
			cont = cont + "<td> total : (purchase unit)" + order.total + "</td>";
			cont = cont + "<td> date modified : " + order.date + "</td>";
			cont = cont + "</tr>";
		}
		else if(order.status == "requested")
		{
			
			//as it is for customer page so user info is not necessary
			//it will be necessary for the businessman page
			//cont = cont + "<tr>";
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td>Qt : " + order.quantity + "</td>";
			cont = cont + "<td>Rs." + order.total + "</td>";
			cont = cont + "<td class = 'date'>" + order.date + "</td>";
			cont = cont + "<td>" + order.status + "</td>";
			cont = cont + "<td><button class = 'cancelrequest'>cancel</button></td>";
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
			cont = cont + "<td class = 'orderid'>" + order.orderid + "</td>";
			//cont = cont + "<td> productid : " + order.productid + "</td>";
			cont = cont + "<td>" + order.productname + "</td>";
			cont = cont + "<td>Qt : " + order.quantity + "</td>";
			cont = cont + "<td>Rs." + order.total + "</td>";
			cont = cont + "<td>C-Rs." + order.carry + "</td>";
			cont = cont + "<td>" + order.date + "</td>";
			cont = cont + "<td>" + order.status + "</td>";
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
	
	
	function fplaceorder(event)
	{
		//window.alert("Load Content with button to add to cart");
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				var i;
				
				var cont = "<table id = 'productContainer' border = '1'>"
				
				cont = cont  + "<tr><td>ProductId</td>";
				cont = cont + "<td>ProductName</td>"
				cont = cont + "<td>Price</td>";
				cont = cont + "<td>Enter Quantity</td>";
				cont = cont + "<td><button id = 'search'>Search</button></td></tr>";
				
			    for(i = 0;i<len;i++)
			    {
			    	cont = cont + "<tr class = 'product'><td class = 'productid'>" + jsonObj[i].productid + "</td>";
			    	cont = cont  + "<td class = 'productname'>" + jsonObj[i].productname + "</td>";
					cont = cont + "<td class = 'price'>" + jsonObj[i].price + "</td>";
					cont = cont + "<td class = 'quantity'><input type = 'text' class = 'quantitytxt' placeholder = 'quantity'></td>";
					cont = cont + "<td><button class = 'addtocart'>Add To Cart</button></td></tr>";
			    }
				
				cont = cont + "</table>";
				     
				document.getElementById('productout').innerHTML = cont;
				
				addToKartActions();
				addQuantityActions();
			}
			
		};	
		
			document.getElementById('searchout').innerHTML = "";
			var strsend = "loadproduct";
			xhttp.open("GET",strsend,true);
			xhttp.send();
	}
	
	function addQuantityActions()
	{
		var qttxts = document.getElementsByClassName('quantitytxt');
		var len = qttxts.length;
		var i;
		
		for(i = 0;i<len;i++)
		{
			qttxts[i].value = "0";
			qttxts[i].addEventListener('keyup',qtcorrection);
		}
		
		
	}
	
	
	function qtcorrection(event)
	{
		var x = event.target;
		var str = x.value;
		var n = parseInt(str);
		
		if(n<0)
		{
			x.value = "0";
		}	
		
	}
	
	function addToKartActions()
	{
		var searchbtn = document.getElementById('search');
		searchbtn.addEventListener('click',addSearchBar)
		
		var btns = document.getElementsByClassName('addtocart');
		var len = btns.length;
		var i;
		
		for(i = 0;i<len;i++)
		{
			btns[i].addEventListener("click",addProductToKart);
		}
	}
	
	function addProductToKart(event)
	{
		var x = event.target;
		var y = x.parentElement.parentElement;
		var pname = y.getElementsByClassName('productname')[0].innerText;
		var pid = y.getElementsByClassName('productid')[0].innerText;
		var qt = y.getElementsByClassName('quantitytxt')[0].value;
		var uid = document.getElementById('userid').innerText;
		uid = uid.substring(9);
		var uname = document.getElementById('username').innerText;
		uname = uname.substring(11);
		//window.alert("add " + pname + " of quantity " + qt +" to Kart of : " + uname);
		
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var strp = jsonObj[0];
				window.alert(strp);
			}
		};
		
		var actionstr = "addtokart?userid=" + uid + "&username=" + uname +  "&productid=" + pid + "&productname=" + pname + "&quantity=" + qt;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
	}
	
	function addSearchBar(event)
	{
	    var	x = "<div><input type = 'text' id = 'searchbar' size = '50' placeholder = 'Search By ProductName'></div>";
		
		document.getElementById('searchout').innerHTML = x;
		var y = document.getElementById('searchbar');
		y.addEventListener('keyup',fsearch);
	}
	
	function fsearch(event)
	{
		var child = document.getElementById('searchbar').value;
		var names = document.getElementsByClassName('productname');
		var len = names.length;
		var i;
		
		if(child == "")
		{
			for(i=0;i<len;i++)
			{
				names[i].parentElement.style.display = "block";	
			}
		}
		else
		{
			child = child.toLowerCase();
			
			for(i=0;i<len;i++)
			{
				var mother = names[i].innerText;
				//console.log(mother);
				
				mother = mother.toLowerCase();
				
				if(mother.indexOf(child) == 0)
				{
					names[i].parentElement.style.display = "block";
				}
				else
				{
					names[i].parentElement.style.display = "none";
				}	
				
			}
		}	
		
	}
	
	function fmyorders(event)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange =  function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var len = jsonObj.length;
				var cont = "<table id = 'myordersContainer' border = '1'>";
				
				cont = cont  + "<tr><td>CartId</td><td>ProductId</td><td>Productname</td><td>Price</td><td>Quantity</td></tr>"
				
				for(i=0;i<len;i++)
				{
					cont = cont + "<tr class = 'order'><td class = 'cartid'>" + jsonObj[i].cartid + "</td>";
					cont = cont + "<td class = 'productid'>" + jsonObj[i].productid + "</td>";
					cont = cont + "<td class = 'productname'>" + jsonObj[i].productname + "</td>";
					cont = cont + "<td class = 'price'>" + jsonObj[i].price + "</td>";
					cont = cont + "<td class = 'quantity'>" + jsonObj[i].quantity + "</td>";
					cont = cont + "<td><button class = 'place'>Place Order</button></td>";
					cont = cont + "<td><button class = 'remove'>Remove</button></td>";
					cont = cont + "<td class = 'replace'><button class = 'editquantity'>Edit Quantity</button></td></tr>"
				}	
				
				cont = cont + "</table>";
				
				document.getElementById('searchout').innerHTML = "";
				document.getElementById('productout').innerHTML = cont;
				
				addMyCartActions();
				
			}	
		};
		
		var uid = document.getElementById('userid').innerText.substring(9);
		var strsend = "loadcart?userid=" + uid;
		xhttp.open("GET",strsend,true);
		xhttp.send();
	}
	function flogout(event)
	{
		var actionstr = "index.jsp";
		location.href = actionstr;
	}
	function fdeleteaccount(event)
	{
		document.write("to servlet,delete,and then redirect to the login page");
	}
	
	function addMyCartActions()
	{
		var placebtns = document.getElementsByClassName('place');
		var removebtns = document.getElementsByClassName('remove');
		var editqtbtns = document.getElementsByClassName('editquantity');
		
		var len = placebtns.length;
		var i;
		
		for(i=0;i<len;i++)
		{
			placebtns[i].addEventListener('click',placeOrder1);
			removebtns[i].addEventListener('click',removeOrder1);
			editqtbtns[i].addEventListener('click',editQt1);
		}
		
	}
	
	
	function editQt1(event)
	{
		var x = event.target.parentElement.parentElement;
		var pname = x.getElementsByClassName('productname')[0].innerText;
		var qt = x.getElementsByClassName('quantity')[0].innerText;
		
		x.getElementsByClassName('quantity')[0].innerHTML = "<input type = 'text' class = 'quantitytxt' value = '" + qt + "'>";
		x.getElementsByClassName('place')[0].parentElement.remove();
		x.getElementsByClassName('remove')[0].parentElement.innerHTML = "<button class = 'savequantity'>Save Changes</button>";
		x.getElementsByClassName('replace')[0].innerHTML = "<button class = 'cancel'>Cancel</button>";
		
		var y = x.getElementsByClassName('savequantity')[0];
		var z = x.getElementsByClassName('cancel')[0];
		y.addEventListener('click',addSaveQuantity);
		z.addEventListener('click',cancelEditQuantity)
	}
	
	function cancelEditQuantity(event)
	{
		var x = event.target.parentElement.parentElement;
		var cartid = x.getElementsByClassName('cartid')[0].innerText;
		var pid = x.getElementsByClassName('productid')[0].innerText;
		var pname = x.getElementsByClassName('productname')[0].innerText;
		var qt = x.getElementsByClassName('quantitytxt')[0].value;
		var pr = x.getElementsByClassName('price')[0].innerText;
		
		var cont =  "<td class = 'cartid'>" + cartid + "</td>";
		cont = cont + "<td class = 'productid'>" + pid + "</td>";
		cont = cont + "<td class = 'productname'>" + pname + "</td>";
		cont = cont + "<td class = 'price'>" + pr + "</td>";
		cont = cont + "<td class = 'quantity'>" + qt + "</td>";
		cont = cont + "<td><button class = 'place'>Place Order</button></td>";
		cont = cont + "<td><button class = 'remove'>Remove</button></td>";
		cont = cont + "<td class = 'replace'><button class = 'editquantity'>Edit Quantity</button></td>"
		
		x.innerHTML = cont;
		addMyCartActions();
	}
	
	function addSaveQuantity(event)
	{
		var x = event.target.parentElement.parentElement;
		var pname = x.getElementsByClassName('productname')[0].innerText;
		var pid = x.getElementsByClassName('productid')[0].innerText;
		var cid = x.getElementsByClassName('cartid')[0].innerText;
		var uid = document.getElementById('userid').innerText.substring(9);
		var qt = x.getElementsByClassName('quantitytxt')[0].value;
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var strp = jsonObj[0];
				
				window.alert(strp);
				
				fmyorders();
			}
		};
		
		actionstr = "savequantity?userid=" + uid + "&cartid=" + cid + "&quantity=" + qt;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
	}
	
	function placeOrder1(event)
	{
		var x = event.target.parentElement.parentElement;
		var pname = x.getElementsByClassName('productname')[0].innerText;
		var pid = x.getElementsByClassName('productid')[0].innerText;
		var qt = x.getElementsByClassName('quantity')[0].innerText;
		var pr = x.getElementsByClassName('price')[0].innerText;
		var cid = x.getElementsByClassName('cartid')[0].innerText;
		var d = currentDate();
		var uid = document.getElementById('userid').innerText.substring(9);
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var strp = jsonObj[0];
				
				window.alert(strp);
				
				fmyorders();
			}
			
		};
		
		var actionstr = "placeorder?productid=" + pid + "&userid=" + uid + "&quantity=" + qt + "&date=" + d + "&price=" + pr + "&cartid=" + cid;
		xhttp.open("GET",actionstr,true);
		xhttp.send();
		
		
		//x.remove();
		
		//window.alert("Placing order for : " + pname);
	}
	
	function removeOrder1(event)
	{
		var x = event.target.parentElement.parentElement;
		var cartid = x.getElementsByClassName('cartid')[0].innerText;
		var userid = document.getElementById('userid').innerText.substring(9);
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			
			if(this.readyState == 4 && this.status == 200)
			{
				var result = this.responseText;
				var jsonObj = JSON.parse(result);
				var strp = jsonObj[0];
				
				window.alert(strp);
				fmyorders();
			}
		};
		
		var actionstr = "removefromcart?userid=" + userid + "&cartid=" + cartid;
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

<style>
	ul#menu li 
	{
	  display:inline;
	}
</style>

</head>
<body>
	
	<p id = 'headerout'>Profile informations will be loaded here</p>
	<p id = 'profileout'>Profile informations will be loaded here</p>
	<p id = 'searchout'></p>
	<p id = 'productout'>Product List will be loaded here</p>
	<p id = 'totalout'>totals will be printed here</p> 
	<p id ='userduesout'>userDues list will be printed here</p>
	
	<script>
		
	    var x = document.referrer;
	    window.alert("redirected from : " + x);
	    var compstr = "http://localhost:9090/BuildersProject/RegisterPage.jsp";
	    
		if(x == compstr)
		{
			loadHeaderBar();
			loadProfile();
		}
		else
		{
			loadHeaderBar();
			loadProfile1();
		}	
	
	</script>

</body>
</html>