<?php
  
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{
   	         $total_money=0;
   	         $total_items=0;
   	         $test_items=0;
		     $squ= $conn->prepare("SELECT * FROM orders where date='$dt'");
		     $squ->execute();
		     $sfet=$squ->fetchAll();
		     foreach ($sfet as $skey) {
		     	$items_n=$skey['no_of_items'];
		     	$sbillt=$skey['total_bill'];
		     	$sodid=$skey['order_id'];
		     	$total_money=$total_money+$sbillt;
		     	$total_items=$total_items+$items_n;
		     	$ssque=$conn->prepare("SELECT * FROM purchase where order_id='$sodid'");
		     	$ssque->execute();
		     	$ssfetch=$ssque->fetchAll();
		     	foreach ($ssfetch as $sskeyval) {
                        $ssitid=$sskeyval['ITEMID'];
                        $ssitquan=$sskeyval['quantity'];
                        $test_items=$test_items+$ssitquan;
                        $sssquer=$conn->prepare("SELECT INAME from items where ITEMID='$ssitid'");
                        $sssquer->execute();
                        $sssfetcher=$sssquer->fetchAll();
                        foreach ($sssfetcher as $g) {
                        	$sssitemname=$g['INAME'];
                        
                        }
                        
		     		echo "<tr><td>" . $sssitemname . "</td><td>" . $ssitquan ."</td></tr></tbody>";
		     
		     	}
		     	
		     	

		     }
		       echo "<tfoot><tr><td>TOTAL ITEMS:</td><td>" . $total_items . "</td>";
		       echo "<tr><td stlye=\"font-weight:bold\">TOTAL MONEY:</td><td>Rs." . $total_money . "/-</td></tr></tfoot></table>";
}
?>