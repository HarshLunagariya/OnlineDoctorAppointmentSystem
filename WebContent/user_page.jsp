<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>user page</title>
<style type="text/css">
body{
	margin: 0;
  	font-family: 'Lato', sans-serif;
}
.overlay {
  height: 100%;
  width: 100%;
  position: fixed;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0, 0.9);
  overflow-x: hidden;
  transition: 0.5s;
}

.overlay-content {
  position: relative;
  top: 25%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

.overlay {
  position: absolute;
  
  font-size: 60px;
}
@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
#btn{
	background-color: #19181a;
	border: none;
	color: #818181;
	font-size: 35px;

}
#btn:hover{
	color: #f1f1f1;

}

</style>
</head>
<body>
<div id="myNav" class="overlay">
  <div class="overlay-content">
    <a href="content.jsp">Book Appointment</a>
    <a href="userPendingApp.jsp">View Future Appointments</a>
    <a href="viewPastRecord.jsp">View Past Record</a>
    <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
  </div>
</div>


</body>
</html>