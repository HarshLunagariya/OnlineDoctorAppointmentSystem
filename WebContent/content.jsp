<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body{
    margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #c5c6c7;
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
button {
  color: black;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 10%;
  opacity: 0.9;
  box-shadow: 5px 10px:
}
a{
  color: black;
  text-decoration: none;
}
#div1{
  text-align: center;
  font-size: 40px;
  padding: 10px;
  background-color: white;
  font-family: Courier New , Courier, monospace;
}
#div2{
  text-align: left; 
  width: 450px;
  height: 60%;
  padding: 30px;
  background-color: #4e4e50;
  margin-top: 100px;
  margin-left: 510px;
}
#div3{
   height: 70px;
  background-color: #19181a;
  text-align: right;
}
#btn{
  background-color: #19181a;
  border: none;
  color: #818181;
  font-size: 20px;

}
#btn:hover{
  color: #f1f1f1;

}
label{
  color: white;
}
</style>



<title>book appointment</title>
</head>
<body>   

<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
	if(session.getAttribute("id")==null)
	{
		System.out.println(session.getAttribute("id"));
		response.sendRedirect("signInUser.html");
	}
%>	
	<div id="div1">BOOK APPOINTMENT</div>       

<div id="div3">
  <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
</div>




<div id="div2">
<form action="viewList.jsp" method="post">
			
			<label for="city"><b>City</b></label><br> 
			<input type="text" placeholder="Enter City" name="city" required style="width: 400px;"><br>
			<label for="category"><b>Category</b></label><br> 
			<select name="category" style="width: 430px;">
			    <option value="Gastroenterologist">Gastroenterologist</option>
			    <option value="General Physician">General Physician</option>
			    <option value="Gynaecologist">Gynaecologist</option>
			    <option value="Paediatrician">Paediatrician</option>
			    <option value="Psychiatrist">Psychiatrist</option>
			    <option value="Dietician">Dietician</option>
			    <option value="Orthopedician">Orthopedician</option>
			    <option value="Diabetologist">Diabetologist</option>
			    <option value="Oncologist">Oncologist</option>
			    <option value="Cardiologist">Cardiologist</option>
			 </select><br>  
			<div style="padding-left: 120px;">
			 <button type="reset" class="cancelbtn" style="width: 100px;" id="btn">Cancel</button>
			 <button type="submit" class="searchbutt" style="width: 100px;" id="btn">Search</button></div>
	</form>
	
 </div>
</body>
</html>