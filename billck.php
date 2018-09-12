<?php include('db.php');
  session_start();
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{
 if(!isset($_POST['tb1'])){
		    echo "";

	         }
	         else{

		$nid=$_POST['tb1'];
				 $qy=$conn->prepare("SELECT * from orders where order_id='$nid'");
				    $qy->execute();
				    $fet=$qy->fetchAll();
				    foreach ($fet as $k) {
				    	$ccname=$k['cname'];
				    	$cnum=$k['mobnum'];
				    	$cdate=$k['date'];
				    }
				}
			


?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="nav.css">
	<title></title>
	<style type="text/css">
		body{
			background-color: white;

          
		}
		form{
			display: inline-block;
			text-align: center;
			float: center;
			align-self: "center";
		}
		h1{
			text-align: center;
			font-size: 45px;
			font-style: italic;
			color: white;
			font-weight: 5000;
			font-family: cursive;
		}
		.temp{
			text-align: center;
			padding: 2%;
		}
		form input[type="number"]{
			width: 400px;
			height: 50px;
			font-size: 22pt;
			border-radius: 4px;
		}
		form input[type="submit"]
		{
			width: 80px;
			height: 30px;
			font-style: italic;
			font-size: 16pt;
			border-radius: 10px;
		}
		.disp{
			border:4px;
			border-radius: 4px;
			position: absolute;
			left:25%;
			text-align: left;
			background-color: white;
			height: 400px;
			width: 50%;
			overflow: auto;
		}
	</style>
</head>
<body background="1.jpg">
	<div>
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
</div>

	<div class="temp"><b><h1>ENTER ORDER ID</h1>
		<form method="post" name="frm" action="">
		<input type="number" value="" name="tb1" required title="Enter valid Order Id">

		<input type="submit" name="submit" value="submit">
	</form>
	
</div>
<div class="disp">
	<table>
		<thead>
			<tr>
				<th>ORDER ID:</th><th><?php if(!isset($_POST['tb1'])){ echo "";}else{ echo $_POST['tb1']; }?></th><th>date:</th><th><?php if(!isset($cdate)){echo "";}else{echo $cdate;} ?></th>
			</tr>
			<tr>
				
				<th>CUSTUMER NAME:</th><th><?php if(!isset($ccname)){ echo "";}else{ echo $ccname; }?></th>
				</tr>
			
		</thead>
		<tbody>
			<tr>
				<td>S.No</td>
				<td>Item Name</td>
				<td>Quantity</td>
				<td>cost</td>
			</tr>
	
<?php 


if(isset($_POST['submit']))
{
$ori=$_POST['tb1'];
$bcq=$conn->prepare("SELECT * FROM PURCHASE WHERE order_id='$ori'");
if($bcq->execute()){
$bcf=$bcq->fetchAll();
$n=1;
foreach ($bcf as $key => $value) { 

  	 $bcitid=$value['ITEMID'];
  	 $bcquan=$value['quantity'];
     echo "<tr><td>";
     echo $n;
     echo "</td><td>";
     $cuban=$conn->prepare("SELECT * FROM orders where order_id='$ori'");
     $cuban->execute();
     $porsche=$cuban->fetchAll();
     foreach ($porsche as $bmw) {
     	$bc_name=$bmw['cname'];
     	$bc_mobile=$bmw['mobnum'];
     	$bc_itms_num=$bmw['no_of_items'];
     	$bc_tot=$bmw['total_bill'];

     }$lambo=$conn->prepare("SELECT * FROM items where ITEMID='$bcitid'");
     $lambo->execute();
     $benz=$lambo->fetchAll();
     foreach($benz as $audi) {
     	$bc_itm_name=$audi['INAME'];
     	$bc_itm_cost=$audi['COST'];
     }
     
     echo $bc_itm_name;echo"</td><td>";
     echo $bcquan;echo"</td><td>";
     echo $bcquan*$bc_itm_cost;

  	 echo"</td></tr>";
  	 $n++;
  	 
   }
}
else{
	echo"<script type=\"text/javascript\">alert('Order ID not found');</script>";
}
}
?>
</tbody>
<tfoot>
	<tr><td></td><td></td><td>Total:</td><td><?php if(!isset($bc_tot)){ echo "";}else{ echo $bc_tot; }  ?></td></tr>
</tfoot>
</table>
</div>
<div>
	
</div>
	
</body>
</html><?php } ?>