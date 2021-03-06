<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body{
    background-image: url(image/img2.png);
}
header{
    text-align: center;
    padding: 2%;    
    color: #5D001E;
}
select {
  width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=text],input[type=password],input[type=tel], input[type=number]{
  width: 30%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}


input[type=text]:focus, input[type=number]:focus, input[type=password]:focus{
  background-color: #C5CBE3;
  outline: none;
}

input[type=radio]{
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
}
#butt1{
  margin: 0px 2px 0px 0px;
}
button {
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 10%;
  opacity: 0.9;
  box-shadow: 5px 10px:
}
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

.cancelbtn{
  float: left;
  width: 10%;
  background-color: #A8D0E6;
  color: black;

}
.signupbtn {
  float: left;
  width: 10%;
  background-color: #9A1750; 
 }

.container {
  padding: 16px;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}
.searchbtn{
  background-color: #9A1750;
  width: 200px; 
}
.searchbutt{
  background-color: #9A1750;
}
#div2{
  background-color: #E3AFBC;
  padding: 5px;
  text-align: right;
}
a{
  color: black;
  text-decoration: none;
}
#div1{
  margin: 50px 0px 0px 600px;
}
#div3{
  margin: 15px 0px 0px 640px;
}
#div4{
 margin: 50px 0px 0px 670px; 
}
</style>



<title>Home-medicart</title>
</head>
<body>   

<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
	if(session.getAttribute("did")==null)
	{
		System.out.println(session.getAttribute("did"));
		response.sendRedirect("signInDoctor.html");
	}
%>	
	<header><h1>Appointment</h1></header>         
<div id="div2">
  <nav>
  	<form action="content_doc.jsp" method="post"><button type="submit">Home</button></form>
    <form action="signOut" method="post"><button type="submit">Logout</button></form>


  </nav>
  </div>
  
  <div id="div3">
	<form action="doctorViewBooking.jsp" method="post">
		<div class="container">
			<button type="submit" class="searchbtn">View Pending Appointments</button>
		</div>
	</form> 
	 </div>	
	 <div id="div3">
	<form action="setLocation.jsp" method="post">
		<div class="container">
			<button type="submit" class="searchbtn">Set Location</button>
		</div>
	</form> 
	 </div>	
</body>
</html>