<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rate the doctor</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);

* {
  margin: 0;
  padding: 0;
  font-family: roboto;
}

body { background: #000; }

.cont {
  width: 93%;
  max-width: 350px;
  text-align: center;
  margin: 4% auto;
  padding: 30px 0;
  background: #111;
  color: #EEE;
  border-radius: 5px;
  border: thin solid #444;
  overflow: hidden;
}

div.title { font-size: 2em; }

h1 span {
  font-weight: 300;
  color: #Fd4;
}

div.stars {
  width: 270px;
  display: inline-block;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
</style>

<script>

function rating()
{
	if(document.getElementById('star-5').checked) {
		document.getElementById('val').value='5';
	}
	else if(document.getElementById('star-4').checked) {
		document.getElementById('val').value='4';
	}
	else if(document.getElementById('star-3').checked) {
		document.getElementById('val').value='3';
	}
	else if(document.getElementById('star-2').checked) {
		document.getElementById('val').value='2';
	}
	else if(document.getElementById('star-1').checked) {
		document.getElementById('val').value='1';
	}
}

</script>
</head>

<body>
<%		
		String did=request.getParameter("did");
%>    
<div class="cont">
  <div class="stars">
    <form action="rateDoctor" method="post">             
      <input class="star star-5" id="star-5" type="radio" name="star" onclick="rating();"/>
      <label class="star star-5" for="star-5"></label>
      <input class="star star-4" id="star-4" type="radio" name="star" onclick="rating();"/>
      <label class="star star-4" for="star-4"></label>
      <input class="star star-3" id="star-3" type="radio" name="star" onclick="rating();"/>
      <label class="star star-3" for="star-3"></label>
      <input class="star star-2" id="star-2" type="radio" name="star" onclick="rating();"/>
      <label class="star star-2" for="star-2"></label>
      <input class="star star-1" id="star-1" type="radio" name="star" onclick="rating();"/>
      <label class="star star-1" for="star-1"></label>
      <input type="hidden" id="val" name="val"></input>
      <input type="hidden" id="did" name="did" value="<%=did%>"></input>
      <button type="submit">Rate!!</button>         
    </form>              
  </div>
</div>
</body>
</html>
