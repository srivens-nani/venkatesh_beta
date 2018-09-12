<?php
    session_start();
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{

?>
	<html>
<head>
<title>Cse restaurant</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
background-image:url('Rest.jpg');
background-size:cover; 

}
.navbar
{
text-align:center-left;
width:250%;
background:#D8BFD8;
opacity:1.0;
}
.navbar ul{
margin:0;
padding:0;
list-style:none;
position:absolute;
}
.navbar ul li a{
display:block;
padding:25px;
font-style: bold;
font-size: 22px;
color: white;
text-decoration:none;
width:150px;
}
.navbar ul:after {
content:"";
display:block;
}
.navbar ul li{
float:left;
list-style:none;
}

.navbar ul li:hover > ul{
display:block;
}
.navbar ul li:hover{
	opacity:0.8;
background:black;
transition:0.4s;

border-radius: 4px;
border: 1px solid white;overflow: hidden; 
border-color: white;



}
.navbar ul li:hover a{
color:white;



}



</style>
</head>
<body>
	

<div class="topnav">
<div class ="navbar">
<ul>
<li><a href="v.php" >BILLING</a></li>
<li><a href="billck.php">BILL CHECK</a>

</li>
<li><a href="sales.php">SALES</a></li>


<li><a href="logout.php">LOGOUT</a></li>

</ul>
</div>
</div>
<div class="content"></br>
<nbsp></br></br></br></br>



</div>
</div>
</body>
</html><?php } ?>