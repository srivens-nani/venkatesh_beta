<?php
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{ 
?>
	    <table cellspacing="20px" cellpadding="10px">
		<td>S.No</td><td>Item Name</td><td>Item Id</td><td>Quantity</td><td>Cost</td>
	  <?php
         $_SESSION['tt']=0;
         if(!isset($_SESSION['count'])){ echo "";}
         else{
	    for ($i=1; $i<=$_SESSION['count']; $i++) { 
	       $_SESSION['i']=$i;

	    
		  $TEMPid = $_SESSION['cart'][$_SESSION['i']]['cat'];
		  $tepm_quan =$_SESSION['cart'][$_SESSION['i']]['quant'] ; 
		  $data = $conn->prepare("SELECT * FROM ITEMS WHERE ITEMID='$TEMPid'");
	      $data->execute();
		  $list_Array=$data->fetchAll();
		    foreach ($list_Array as $list_values) {
		    	$item_name= $list_values['INAME'];
	    	$item_id=$list_values['ITEMID'];
		    	$item_cost= $tepm_quan * $list_values['COST'];
		    	$_SESSION['total']=$_SESSION['total']+$item_cost;
                 $_SESSION['tt']=$_SESSION['tt']+$tepm_quan;
           ?>
           
           <tr><td>
           <?php

             echo $i;
             echo"</td><td>";
	    	echo $item_name;
	    	echo "</td><td>";
	    	echo $item_id;
	    	echo "</td><td>";
	    	echo $tepm_quan;
	    	echo "</td><td>";
	    	echo $item_cost;
	    	echo "</td></tr>";

	    	
	    }
	}
}
}
?>