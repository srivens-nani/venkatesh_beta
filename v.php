<?php
session_start();
  
    
   if(!isset($_SESSION['$id']))
   {
    header('location:login.php');
   }
   else{
    include 'db.php';
  
//if(isset($_SESSION['count'])){echo '';}
if(isset($_POST['sub']))
{   
   if($_POST['category']!='' && $_POST['quantity']!='')
  {
      if (!isset($_SESSION['count'])){
    $_SESSION['count'] = 1;
    $_SESSION['cart'][$_SESSION['count']]['cat']=$_POST['category'];
    $_SESSION['cart'][$_SESSION['count']]['quant']=$_POST['quantity'];

  }
  else
  {
    $_SESSION['count']++;
    $_SESSION['cart'][$_SESSION['count']]['cat']=$_POST['category'];
    $_SESSION['cart'][$_SESSION['count']]['quant']=$_POST['quantity'];
  }
 
      
   }
}
if(isset($_POST['cancel'])) {
      
unset($_SESSION['cart'][$_SESSION['count']]['quant']);  

unset($_SESSION['cart'][$_SESSION['count']]['cat']);
unset($_SESSION['count']);
unset($_SESSION['tt']);
}
if(isset($_POST['save']))
{      
    if($_SESSION['count']==0)
    {
      echo"<script type=\"text/javascript\">alert(\"no items selected\");</script>";
    }
    elseif($_POST['custname']=='')
    {
      echo"<script type=\"text/javascript\">alert(\"enter name\");</script>";
    }
    elseif ($_POST['mobile']=='') {
    echo"<script type=\"text/javascript\">alert(\"enter mobile number\");</script>";
    }
    elseif (isset($_SESSION['count'])){
         $cnt=$_SESSION['tt'];
        $total_bill=$_SESSION['total'];
        $cusname=$_SESSION['customername']=$_POST['custname'];
        $mobnum=$_SESSION['mobilenum']=$_POST['mobile'];
        $date=date('y-m-d');
        
        $query=$conn->prepare("INSERT INTO ORDERS VALUES(NULL,'$cusname',$mobnum,$cnt,$total_bill,'$date')");
        $query->execute();
        $ret=$conn->prepare("SELECT max(order_id) from orders");
        $ret->execute();
        $oid=$ret->fetchAll();
        
        foreach ($oid as $oi) {
         $orid=$oi['max(order_id)'];
         $_SESSION['odr_id']=$orid;
         }
        for ($y=1; $y<=$_SESSION['count']; $y++) { 
         $_SESSION['y']=$y;
      
      $purch_id = $_SESSION['cart'][$_SESSION['y']]['cat'];
      $purch_quan =$_SESSION['cart'][$_SESSION['y']]['quant'] ;
      $insrt=$conn->prepare("INSERT INTO PURCHASE VALUES($orid,$purch_id,$purch_quan)");
      if($insrt->execute())
      {
        header('location:bill-display.php');

       }
      
    }
        
  
        
    }
   
} 
?>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="nav.css">
	<title></title>
	<style type="text/css">
		.list-cart {
    height:450px;7
    overflow: scroll;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 12px 0px #bcb8b8;
}
    .body{
      background-size: cover;
      overflow: hidden;
      height:100%;
      margin: 0; 
    }
    .right{
      float: right;
      color: white;
    }
    .list{
      height: 
    }
    .bottombar{
      height: 22px;
      width:100%;
      bottom: 0;
      text-align: right;
        }
    .bottombar ul{
      right: 0;
      margin: 0;
      padding: 0;
      padding: 11px;

      list-style:none;
    position: absolute;
     border-spacing: 4px;

    }
    .bottombar ul li{
      float:left;
      list-style: none;
      padding-left: 11px;


    }
     .bottombar ul li input{
      height: 28px;
      width:90px;
      font-size:16px;
      font-style: bold italic;
      background-color: white;
      border: 4px;
      border-radius: 2px;
      border-color: black; 
     }
     .bottombar ul li input[name='cancel']:hover{
      background-color: red;
      color:white;
     }
     .bottombar ul li input[name='save']:hover{
      background-color: #23ed29;
      color:white;
     }
     .bottombarleft{
      bottom: 0;
      left: 0;
      color: black;
      font-size: 22px;
      font-weight: bold;
      outline-color: white;


     }
     .bottombarleft ul{
      left: 0;
      margin: 0;
      padding: 0;
      padding: 11px;

      list-style:none;
    position: absolute;
     border-spacing: 4px;

    }
    .bottombarleft ul li{
      float:left;
      list-style: none;
      padding-left: 11px;
    }
    iframe{
      border-color: black;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
    }
		
   </style>
 	<script type="text/javascript">
     function itm(obj)
   {
      var x=obj.category.value; 
      var y=obj.quantity.value;
      
      if(x=='select' && y=='')
         alert("enter something");
      else if(x=='select')
         alert("select an item");
      else if(y=='')
         alert("select quantity");
     }
   </script>
	</head>
<body>

    <div id='main'>
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
<div class="content"></br>
<nbsp></br></br></br></br>


</div>
</div>

	 <div id="abc">
<form name="items" method="post" action="" onsubmit="itm(this)" id="entering-form">
<table cellpadding="10px" cellspacing="10px">
<tr>
<td><b><i><span style="font-family:cursive; color:white; font-size:32px;">ITEM</span></i></b></td><td><b><i><span style="font-family: cursive; color:white; font-size:26px;">QUANTITY</span></i></b></td><td></td></tr>
<tr>
<td>
   <select id="ctr" name="category" autofocus>
           <option value=""></option>
        <option value="11001">VEG BIRYANI</option>
        <option value="11002">VEG NOODLES </option>
        <option value="11003">VEG FRIEDRICE</option>
        <option value="11004">VEG MANCHURIA</option>
        <option value="12001">DUM BIRYANI</option>
        <option value="12002">FRYBIT BIRYANI</option>
        <option value="12003">KHABAB BIRYANI</option>
        <option value="12004">CHICKEN NOODLES</option>
        <option value="12005">EGG NOODLES</option>
        <option value="12006">CHICKEN FRIEDRICE</option>
        <option value="12007">EGG FRIEDRICE</option>
        <option value="12008">CHICKEN MANCHURIA</option>
        <option value="12009">EGG MANCHURIA</option>
        <option value="13001">LEMON JUICE</option>
        <option value="13002">COKE</option>
        <option value="13003">MOUNTAIN DEW</option>
        <option value="13004">THUMPS UP</option>
        <option value="14001">STRAWBERRY ICECREAM</option>
        <option value="14002">MANGO ICECREAM</option>
        <option value="14003">VANILA ICECREAM</option>
        <option value="14004">DRYFRUIT ICECREAM</option>
        <option value="15001">KURMA CURRY</option>
        <option value="15002">PANEER CURRY</option>
        <option value="15003">PANEER TIKKA CURRY</option>
        <option value="15004">CHICKEN CURRY</option>
        <option value="15005">FISH CURRY</option>
        <option value="15006">CRAB CURRY</option>
        <option value="15007">PRAWN CURRY</option>
        <option value="15008">CHICKEN FRY</option>
        <option value="1509">CHILLY CHICKEN</option>
	  </select>
  </td>
	  <td>
      <input id="id" type="number" name="quantity" value=""  min="1">
    </td>
	 <td>
    <input id="sbmt" type="submit" name="sub" value="Add" style="background-color: white border-radius:2px border: 2px solid black;"></form>
  </td>
   
</table>
 </form>

 
 </div style="overflow: hidden;" >	  

	<script type="text/javascript">
   
  /*+function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }*/
  
    </script>
	
 
  <iframe src="list.php" name="fr1" style="height: 450PX; width: 100%; background-color: white; overflow:hidden;" frameborder="0" scrolling="yes" onload="resizeIframe(this)" ></iframe> <form name="cancelbutton" id="cancelbutton" method="post">
      
    </form>
  <div class="bottombarleft"><form  id="details" method="post">
    
    <ul>
    <li>Name:<input type="text" name="custname" value="" required pattern="[A-Za-z]{1,30}" title="enter valid text"></li>
    <li>Mobile:<input type="text" name="mobile" value="" required maxlength="10" pattern="[6,7,8,9]{1}[0-9]{9}" title="Incorrect Mobile number"></li></ul></form></div>
<div class="bottombar">
  <ul>
    <li><input type="submit" name="cancel" value="cancel/new" form="cancelbutton"></li>
    <li><input type="submit" name="save" value="save" form="details"></li>
  </ul>
</div>
    
</div>
</div>
</body>
</html>
<?php } ?>