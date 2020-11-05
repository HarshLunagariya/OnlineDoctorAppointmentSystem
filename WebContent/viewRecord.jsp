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
<title>Medical Records</title>
<style type="text/css">
body{
    margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #c5c6c7;
}
a{
    color: black;
    text-decoration: none;
}

#div1{  
    padding: 3%;
    float: center;
    margin: 20px 0px 0px 0px;
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
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 80%;
  margin: 20px 0px 0px 150px;
  border: 1px solid black;
  box-shadow: 5px 10px 18px #888888;
}
#div3{
    padding: 2%;
    margin: 0px 0px 0px 0px;
}
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

</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,must-revalidate");
		if(session.getAttribute("id")==null)
		{
			response.sendRedirect("signInUser.html");
		}
	%>
	<%	HttpSession sesn=request.getSession();
		String bookingid = request.getParameter("bookingid");
		Pair<book,String> record= bookDao.viewRecord(bookingid);
		String map[] =new String[]{"","8:00","9:00", "10:00","11:00" ,"14:00","15:00","16:00","17:00","18:00","19:00"};
		book B=record.getKey();
        String doc_name=record.getValue();
	%>
	
	<div id="div9">MEDICAL RECORD</h2></div>



<div id="div8">
  <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
</div>
    
                <div id="div1">
                <table border="1" cellpadding="5">
               	<tr>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>Doctor ID</th>
                    <th>Doctor Name</th>
                    <th>Time Slot</th>
                </tr>
                <tr>
                    <td><%=B.getBookingid() %></td>
                    <td><%=B.getDate()%></td>
                    <td><%=B.getDid()%></td>
                    <td><%=doc_name%></td>
                    <td><%=map[B.getTime_slot()]%></td>
                </tr>
                </table>
                </div>
                <div id="div3">
                <table>
                <tr style="height: 100px;">
                    <td>Prescription : </td>
                    <td style="width: 700px;"><%=B.getPrescription() %></td>
                </tr>
                </table>
                </div>  	         	
                
                
                
</body>
</html>