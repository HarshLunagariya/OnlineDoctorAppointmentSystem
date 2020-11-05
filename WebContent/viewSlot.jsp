<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="doctor.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>    
<!DOCTYPE html>

<style type="text/css">
	.switch-field {
	display: flex;
	margin-bottom: 36px;
	overflow: hidden;
}

.switch-field input {
	position: absolute !important;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	width: 1px;
	border: 0;
	overflow: hidden;
}


.switch-field label {
	background-color: #e4e4e4;
	color: rgba(0, 0, 0, 0.6);
	font-size: 14px;
	line-height: 1;
	text-align: center;
	padding: 8px 16px;
	margin-right: -1px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
	transition: all 0.1s ease-in-out;
}

.switch-field label:hover {
	cursor: pointer;
}

#div9{
  text-align: center;
  font-size: 40px;
  padding: 10px;
  background-color: white;
  font-family: Courier New , Courier, monospace;
}
.switch-field input:checked + label {
	background-color: #a5dc86;
	box-shadow: none;
}


.switch-field label:first-of-type {
	border-radius: 4px 0 0 4px;
}

.switch-field label:last-of-type {
	border-radius: 0 4px 4px 0;
}
#div1{
	
}
header{
	padding: 10px;
	background-color: ;
	color: #5D001E;
	text-align: center;
}
#div2{
	background-color: #E3AFBC;
	padding: 10px;
}
#div5{
	margin: 10px 0px 100px 650px;
}
#div4{
	margin: 0px 0px 0px 450px;
}
</style>



<html>
<head>
<meta charset="ISO-8859-1">
<title>View Slot</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("id")==null)
		{
			response.sendRedirect("signInUser.html");
		}
		%>
		<div id="div9">Available Slots</h2></div>
		 <div id="div2">
    	<table>
    <tr>
        <td><form action="content.jsp" method="post"><button type="submit">Home</button></form></td>
    	<td><form action="signOut" method="post"><button type="submit">Logout</button></form></td>
    </tr>	
    </table>	
    </div>
<%	String  id=request.getParameter("id");
	String did=request.getParameter("did");
	String category=request.getParameter("category");
	ArrayList<ArrayList<String> > list= doctorDao.getSlotByDate(id,did);
	String map[] =new String[]{"","8:00","9:00", "10:00","11:00" ,"14:00","15:00","16:00","17:00","18:00","19:00"};
%>
<div id="div4">
<form method="get" action="bookSlot">
<% for(int i=0;i<10;i++)
	{
%>
<br>
<%=list.get(i).get(0)%>
<br>
<div class="switch-field">
<% 		for(int j=1;j<11;j++)
		{
			String val=list.get(i).get(0)+""+j;
			if(list.get(i).get(j).equals("0")){
%>			
				
			<input id="radio-<%=val %>" type="radio" value="<%=val%>" name="slot"/>
			<label for="radio-<%=val%>"><%=map[j] %></label>
<%			}		
		}
%>
</div>
<%
	}
%>
<input type="hidden" id="id" name="id" value=<%=id%> >
<input type="hidden" id="did" name="did" value="<%=did%>">
<input type="hidden" id="category" name="category" value="<%=category%>">
</div>
<div id="div5">
<button type="submit">Submit</button>
<input type="button" value="Go back!" onclick="history.back()">
</div>
</form>

</body>
</html>