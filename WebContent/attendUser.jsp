<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="doctor.*"%>
<%@ page import="user.*"%>
<%@ page import="book.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
#div9{
  text-align: center;
  font-size: 40px;
  padding: 10px;
  background-color: white;
  font-family: Courier New , Courier, monospace;
}
#div8{
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

#div2{
	background-color: #E3AFBC;
	padding: 10px;
	text-align: right;
}
a{
	color: black;
	text-decoration: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 70%;
  margin: 20px 0px 0px 540px;
  border: 1px solid black;
  box-shadow: 5px 10px 18px #888888;
  width: 400px;
  height: 300px;
}
body{
	margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #c5c6c7;
}
th, td {
  padding: 15px;
  color: white;

  text-align: left;
}

tr {
	background-color: #4e4e50;
}

#div1{
	padding: 1%;
	float: center;

}
#div3{
	
	margin: 5px 0px 0px 450px;
}
#div4{
	padding: 20px;
	margin: 5px 0px 0px 650px;
}
#prescription{
	box-shadow: 5px 10px 18px #888888;
	background-color: #4e4e50;
	color: white;
}
#td1{
	width: 150px;
}
.inp{
	color: black;
  padding: 14px 20px;
  margin: 20px 0px 0px 20px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
  box-shadow: 5px 10px:
}
</style>
<title>Prescription</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("did")==null)
		{
			response.sendRedirect("signInDoctor.html");
		}
	%>
	<%
	String bid= request.getParameter("bid");									///booking id
	String id= request.getParameter("id");
	String did= request.getParameter("did");
	user u = userDao.getUserByid(id);
	bookDao.updateBookDb(bid);
	%>
	<div id="div9">PRESCRIPTION</h2></div>



<div id="div8">
  <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
</div>
	<div id="div1">
	<table border="1" cellpadding="5">
		<tr>
			<td id="td1">Booking ID:</td>
			<td><%=bid %></td>
		</tr>
		<tr>
			<td id="td1">Patient ID:</td>
			<td><%=id %></td>
		</tr>
		<tr>
			<td id="td1">Name:</td>
			<td><%=u.getName() %></td>
		</tr>
		<tr>
			<td id="td1">Gender:</td>
			<td><%=u.getGender() %></td>
		</tr>
		<tr>
			<td id="td1">Age:</td>
			<td><%=u.getAge() %></td>
		</tr>
		<tr>
			<td id="td1">Phone:</td>
			<td><%=u.getPhone() %></td>
		</tr>
	</table>
	</div>
	<form action="addPrescription" method="get">
		<div id="div3">
	<input type="hidden" id="bid" name="bid" value="<%=bid%>" >
	<textarea id = "prescription" name = "prescription" rows = "3" cols = "80">Enter prescription here</textarea><br>
		</div>
		<div id="div4">
	<input type="submit" value="Submit" id="btn" class="inp">
		</div>
	</form>
</body>
</html>