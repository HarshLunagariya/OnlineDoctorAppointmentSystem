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
<title>View Past Records</title>
<style type="text/css">
body{
  margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #c5c6c7; 
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
header{
  text-align: center;
  padding: 2%;  
  color: #5D001E;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 70%;
  margin: 20px 0px 0px 200px;
  border: 1px solid black;
  box-shadow: 5px 10px 18px #888888;
}
#div1{
  padding: 3%;
  margin: 0px 0px 0px 680px;

}
#div2{
  background-color: #E3AFBC;
  padding: 10px;
  text-align: right;
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
a{
  color: black;
  text-decoration: none;
}
</style>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
function updateMarkerPosition(latLng) {
  document.getElementById('x').value = latLng.lat();
  document.getElementById('y').value = latLng.lng();
}

function initialize() {
  var latLng = new google.maps.LatLng(-34.397, 150.644);
  var map = new google.maps.Map(document.getElementById('mapCanvas'), {
    zoom: 8,
    center: latLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  var marker = new google.maps.Marker({
    position: latLng,
    title: 'Point A',
    map: map,
    draggable: true
  });

  updateMarkerPosition(latLng);

  google.maps.event.addListener(marker, 'dragend', function() {
    updateMarkerPosition(marker.getPosition());
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
  <%
    response.setHeader("Cache-Control","no-cache,must-revalidate");
    if(session.getAttribute("did")==null)
    {
      response.sendRedirect("signInDoctor.html");
    }
    int did = (int)session.getAttribute("did");
  %>
     <div id="div9">SET LOCATION</h2></div>



<div id="div8">
  <form action="signOut" method="post"><button type="submit" id="btn">Logout</button></form>
</div>


  <style>
  #mapCanvas {
    width: 500px;
    height: 400px;
    float: center;
    position: absolute;
    
        height: 400px; 
       	margin: 150px 200px 0px 500px; 
      
  }
  #infoPanel {
    float: left;
    margin-left: 10px;
  }
  #infoPanel div {
    margin-bottom: 5px;
  }
  </style>
  <div id="mapCanvas"></div>

      <div id="div1">
  <form method="post" action="setLocation">
  <input type="hidden" id="did" name="did" value="<%=did%>"></input>
  <input type="hidden" id="x" name="x"></input>
  <input type="hidden" id="y" name="y"></input>
  <button type="submit" style="width: 200px; margin-left: -70px;" id="btn">Set Location</button>
</form>
</div>
</body>
</html>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWGixjkgHL7URrtWkfZ40ayJh8WjiTDpY&callback=initMap"
    async defer></script>
<script type="text/javascript">