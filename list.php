<?php
  session_start();
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{
?><!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		.bottom{
			height: 34px;
			width: 100%;
			float: left;
			position: fixed;
			background-color: black;
			top:0;
			left: 0;
		}
		table{
			width:100%;

		}
	</style>
	
</head>
<body>
<?php

include 'db.php';

?>
<div class="list-cart">
  
	<?php $_SESSION['total']=0; 
	if (isset($_SESSION['count'])) {
?>
	<?php include('items_list.php');?> 
	    <div id="btmribbon" class="bottom">
    <span style="color: white; font-size: 28px; float:left; font-family: cursive;">TOTAL:<?php echo $_SESSION['total'];?></span></div>
	  	 </table>
	 <?php
	  	}
	  	else {
	  		echo "";
	  	}
	?>




</body>
</html><?php } ?>