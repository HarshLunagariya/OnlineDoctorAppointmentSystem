<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="book.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
body{
	background-image: url(image/img2.png);
}
header{
	text-align: center;
	padding: 2%;	
	color: #5D001E;
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
#div1{
	padding: 3%;
	float: center;

}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 70%;
  margin: 20px 0px 0px 200px;
  border: 1px solid black;
  box-shadow: 5px 10px 18px #888888;
}
th, td {
  padding: 15px;
  color: black;

  text-align: left;
}

tr:nth-child(even) {
	background-color: white;
}
tr:nth-child(odd) {
	background-color: #f2f2f2;
}


</style>
<title>Appointments</title>
</head>
<body>


<!-- Nav bar -->
<div id="div2">
  <nav>
  	<form action="doctor_page.jsp" method="post"><button type="submit">Home</button></form>
    <form action="signOut" method="post"><button type="submit">Logout</button></form>

</nav>
</div>
  
    
  </div>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("did")==null)
		{
			response.sendRedirect("signInDoctor.html");
		}
	%>
	<table border="1" cellpadding="5">
	<%	HttpSession sesn=request.getSession();
		String did=String.valueOf(sesn.getAttribute("did"));
		ArrayList<ArrayList<String> > list= bookDao.getBooking(did);
		int number = list.size();
		String map[] =new String[]{"","8:00","9:00", "10:00","11:00" ,"14:00","15:00","16:00","17:00","18:00","19:00"};
	%>
	
<% 	if(number!=0){
		    %>
		    <caption><h2>Appointments</h2></caption>
            <tr>
                <th>Booking ID</th>
                <th>Patient ID</th>
                <th>Date</th>
                <th>Time Slot</th>
                <th>Attend</th>
            </tr> 
		    <%
			         for(int i=0;i<number;i++) {
			%>        	 
				<tr>
	            <td><%=list.get(i).get(0) %></td>
	            <td><%=list.get(i).get(1)%></td>
	            <td><%=list.get(i).get(3)%></td>
	            <td><%=map[list.get(i).get(4).charAt(0)-'0']%></td>
				<form method="post" action="attendUser.jsp">
				<input type="hidden" id="bid" name="bid" value=<%=list.get(i).get(0)%> >
				<input type="hidden" id="id" name="id" value=<%=list.get(i).get(1)%> >
				<input type="hidden" id="did" name="did" value="<%=did%>">
	            <td><button type="submit">Attend</button></td>
	            </form>
	         	</tr>
			 <%  }  
		    }
		         else
		         {
		        	 out.println("No Appointments!!");
		         }
         	%>
</table>         	
</body>
</html>