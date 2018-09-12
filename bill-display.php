<?php
session_start();
 
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{
?>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bill</title>
	<link rel="stylesheet" type="text/css" href="nav.css">
	<style type="text/css">
	     .body{
	     	 
	     	overflow: hidden;
	     }
		.foot{
			left:0;
		
			bottom:0;
			width: 100%;
			height: 46px;
			position: fixed;
			font-weight: bold;
			font-size: 22px;

			overflow: hidden;
			background-color: #0d7f8a;
			border-spacing: 10px;

		}
		.viewer{
			background-color: white;
			padding: 0;
			overflow: auto;
			position: absolute;
		      left: 32%;
		      top:10%;
               height: 600px;
               width: 40%;
               border: 4px;
               border-radius: 2px;
               border-top-left-radius: 3px;

		}
		table{
			width='';
		}
		span{
			font-size: 32px;
			font-weight: bold;
		}
		#btnn{

			height: 24px;
			width:50px;
			border:4px;
			border-radius: 4px;
			font-size: 18px;

		}
		#btnn:hover{
			background-color: blue;
			color: white;
			font-size: 22px;
		}
	</style>
</head>
<body background="rest.jpg">
	 <div id='main'>
   <div>
   <div class="topnav">
<div class ="navbar">
<ul>
<li><a href="v.php" >BILLING</a></li>
<li><a href="billck.php">BILL CHECK</a>

</li>
<li><a href="sales.php">SALES</a></li>




</ul>
</div>
</div>

	<div class="viewer" id="bill"><?php

include('db.php');
$ordrid=$_SESSION['odr_id'];
$bd=$conn->prepare("SELECT * FROM ORDERS WHERE order_id='$ordrid'");
$bd->execute();

$bde=$bd->fetchAll();
foreach ($bde as $bdele) {
	$c_name=$bdele['cname'];
    $mobno=$bdele['mobnum'];
    $n_items=$bdele['no_of_items'];
    $tot=$bdele['total_bill'];

}
echo 'NAME:';echo $c_name;     echo'<br>';
echo 'MOBILE:';echo $mobno;          

include('items_list.php');
?></div>
<div class="foot">

<label style="float: left;"><?php echo "OrderId:";echo $_SESSION['odr_id']; ?></label>

	 
	 	<button id='btnn' onclick="myfun()" style="float: right;">print</button>

<script type="text/javascript">
	
		 function myfun() {
        var prtContent = document.getElementById("bill");
var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
WinPrint.document.write(prtContent.innerHTML);
WinPrint.document.close();
WinPrint.focus();
WinPrint.print();
WinPrint.close();
	}
</script>
<label style="float:right;"><?php echo 'Total:';echo $tot;?></label>
	 



</div>
</body>
</html><?php } ?>