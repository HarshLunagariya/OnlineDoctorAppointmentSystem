<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="book.*"%>
<%@ page import="book.book"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javafx.util.Pair" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pending Appointments</title>
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
#div1{
	padding: 3%;
	float: center;

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
th, td {
  padding: 15px;
  color: white;
  width: 200px;
  text-align: left;
}

tr:nth-child(even) {
	background-color: #4e4e50;
}
tr:nth-child(odd) {
	background-color: #4e4e50;
}
a{
	color: black;
	text-decoration: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 80%;
  margin: 20px 0px 0px 150px;
  border: 1px solid black;
  box-shadow: 5px 10px 18px #888888;
}
body{
	margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #c5c6c7;
}


</style>
</head>
<body>
<!-- Nav bar -->
<div id="div9">Pending Appointments</h2></div>



<div id="div8">
  <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
</div>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("id")==null)
		{
			response.sendRedirect("signInUser.html");
		}
	%>
	<div id="div1">
	<table border="1" cellpadding="5">
	<%	HttpSession sesn=request.getSession();
		String id=String.valueOf(sesn.getAttribute("id"));
		ArrayList<Pair<book,String> > list= bookDao.viewFutureRecord(id);
		int number = list.size();
		String map[] =new String[]{"","8:00","9:00", "10:00","11:00" ,"14:00","15:00","16:00","17:00","18:00","19:00"};
	%>
	
<% 	if(number!=0){
		    %>
		    
            <tr>
                <th>Booking ID</th>
                <th>Date</th>
                <th>Doctor ID</th>
                <th>Doctor Name</th>
                <th>Time Slot</th>
                <th>Category</th>
                <th style="width: 170px;">Location</th>
                <th style="width: 170px;">Cancel Appointment</th>
            </tr> 
		    <%
			         for(int i=0;i<number;i++) {
			        book B=list.get(i).getKey();
			        String doc_name=list.get(i).getValue();
			%>        	 
				<tr>
	            <td><%=B.getBookingid() %></td>
	            <td><%=B.getDate()%></td>
	            <td><%=B.getDid()%></td>
	            <td><%=doc_name%></td>
	            <td><%=map[B.getTime_slot()]%></td>
	            <td><%=B.getCategory()%></td>
				<form method="post" action="viewLocation.jsp">
				<input type="hidden" id="did" name="did" value="<%=B.getDid()%> ">
				<input type="hidden" id="id" name="id" value="<%=B.getId()%> ">
				<input type="hidden" id="bid" name="bid" value="<%=B.getBookingid()%> ">
				<input type="hidden" id="slot" name="slot" value="<%=B.getTime_slot()%> ">
				<input type="hidden" id="date_book" name="date_book" value="<%=B.getDate()%> ">
				
	            <td><button type="submit" style="width: 180px;" id="btn">View Location</button></td>
	            <td> <button type="submit" formaction="cancelBook" style="width: 180px;" id="btn">Cancel</button></td>
	            </form>
	         	</tr>
			 <%  }  
		    }
		         else
		         {
		        	 out.println("No Pending Appointments!!");
		         }
         	%>
</table>  
</div>       	
</body>
</html>