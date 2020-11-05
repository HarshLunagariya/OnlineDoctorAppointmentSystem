<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@ page import="doctor.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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

body 
{
	margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #c5c6c7;
}


#div1{
	padding: 3%;
	float: center;
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
a{
	color: black;
	text-decoration: none;
}
.checked {
  color: orange;
}
</style>

<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
	if(session.getAttribute("id")==null)
	{
		response.sendRedirect("signInUser.html");
	}
%> 

<title>doctor list</title>
</head>
<body>

	<div id="div9">DOCTOR'S LIST</h2></div>



<div id="div8">
  <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
</div>

</div>


<div id="div1">
		 <table border="1" cellpadding="5">
          <%  
           		HttpSession sesn= request.getSession();
            	String city = request.getParameter("city");
				String category = request.getParameter("category");
				int id =(int) sesn.getAttribute("id");
		        ArrayList<doctor> list = doctorDao.getListByCityCategory(city,category);
		        if(list.size()!=0){
		    %>
		    
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Rating</th>
                <th>Timings</th>
            </tr> 		
		    <%
			         for(doctor d : list) {
			%>    	
				<% int star = 0;
					if(d.getHit()!=0)
					star=(d.getRating()/d.getHit());
				%> 
				<tr>
	            	<td><%=d.getId() %></td>
	            	<td><%=d.getName() %></td>
	            	<td><%=d.getGender() %></td>
	            	<td><%=d.getPhone()%></td>
	            	<td>
	          
	            	<span class="fa fa-star <%if(star>=1){ %>checked <%}%> "></span>
					<span class="fa fa-star <%if(star>=2){ %>checked <%}%> "></span>
					<span class="fa fa-star <%if(star>=3){ %>checked <%}%> "></span>
					<span class="fa fa-star <%if(star>=4){ %>checked <%}%> "></span>
					<span class="fa fa-star <%if(star>=5){ %>checked <%}%> "></span>
					</td>
				<form method="post" action="viewSlot.jsp">
					<input type="hidden" id="id" name="id" value="<%=id%>"> 
					<input type="hidden" id="did" name="did" value="<%=d.getId()%>">
					<input type="hidden" id="category" name="category" value="<%=category%>">
	            	<td><button type="submit" style="width: 180px;" id="btn">View Timings</button></td>
	            </form>
	         	</tr>
 				
			 <%         }
		         }
		         else
		         {
		        	 out.println("No hospitals here. Try some other nearby location!!");
		         }
         	%> 
        </table>
 </div>


 </body>
</html>