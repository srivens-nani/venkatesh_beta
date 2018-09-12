<?php include('db.php');
  session_start();
    
   if(!isset($_SESSION['$id']))
   {
   	header('location:login.php');
   }
   else{
 ?>
<html>
<head>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Sky Restaurant</title>
	<link rel="stylesheet" type="text/css" href="nav.css">
	<link rel="icon" href="res.png">
	<style type="text/css">
		body{
			background-image: url('rest.jpg');

          
		}
		
		.itm form{
			text-align: center;
			font-size: 35px;
			font-style: ;
			color: white;
		
			position: fixed;
			top:10%;
			font-weight: bolder;

		}
		
		#boxid{
			width: 400px;
			height: 50px;
			font-size: 22pt;
			border-radius: 4px;
		}
		#submit{
			width: 80px;
			height: 30px;
			font-style: italic;
			font-size: 16pt;
			border-radius: 10px;
		}
		.leftpan{
			position: absolute;
			left:0;
			top:20%;
		}
		.leftpan form ul li button{

			width:180px;
			height: 50px;
			color:white;
			border:8px;
			border-width: 2px;
			border-radius: 4px;
			border-color: brown;



		}
		#today{
			background-color: red;
		}
		#thisweek{
			background-color: green;
		}
		#thismonth{
			background-color: blue;
		}
		#thisyear{
			background-color: yellow;
		}
		.leftpan form ul li button:hover{
			border-color: white;
			font-weight: bold;
			transition-duration: 0.4;
			font-size: 22px;
			font-family: cursive;
		}
		.centerpan{
			position: absolute;
			top:22%;
			height: 450px;
			width: 50%;
			background-color: white;
			left:220px;
			overflow: auto;

		}
		table{
			text-align: center;
			font-weight: bold;

		}
		
		
	</style>
</head>
<body background="rest.jpg">
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

	
	<div class="itm">
		
		
<form name="datebox" method="post" action="">
			<label class="vm">ENTER DATE:</label>
<input type="date" name="dat" value="">
<input type="submit" name="subt" value="submit">
	</form></div>
	<div class="leftpan">
		<form method="post" action="">
			<ul>
				<li><button id="today" name="today">TODAY</button></li>
				<li><button id="thisweek" name="week">THIS WEEK</button></li>
				<li><button id="thismonth" name="month">THIS MONTH</button></li>
				<li><button id="thisyear" name="year">THIS YEAR</button></li>
			</ul>
		</form>
	</div>
	<div class="centerpan">
		<table cellpadding="15px"><thead></thead><tbody><tr><td>ITEM NAME</td><td>QUANTITY</td></tr>
		<?php
		      if(isset($_POST['subt'])){
		      $dt=$_POST['dat'];
		      $total_money=0;
		      $total_items=0;
		      $test_items=0;
             include('salessub.php');		      
		   }
		    if(isset($_POST['today']))
             {    
		            $dt=date('y-m-d');
		            include('salessub.php');

		   }
		   if(isset($_POST['week']))
		   {
                $stdate=date('y-m-d');
                $strtdate=strtotime($stdate);
                
                $eddate=strtotime("previous week");
                 $enddate=date('y-m-d',$eddate);
                 
		       $total_money=0;
		        $total_items=0;
		        $test_items=0;
		        $dt=date('y-m-d',$strtdate);
		        echo $dt;
		        $count=1;
		        while ($count<=7){

		        
                  $auxdate=strtotime("-1 days",$strtdate);
                $dt=date('y-m-d',$auxdate);
                include('salessub.php');
                echo "<br>date:" . $dt ."<br>";
                 $strtdate=strtotime($dt);
		        
		        $count++;
		   	   	       
		   	   	   }           
		        
		      
		   }
		   if(isset($_POST['month']))
		   {
		   	 $stdate=date('y-m-d');
                $strtdate=strtotime($stdate);
                
                $eddate=strtotime("previous month");
                 $enddate=date('y-m-d',$eddate);
                 
		       $total_money=0;
		        $total_items=0;
		        $test_items=0;
		        $dt=date('y-m-d',$strtdate);
		        echo $dt;
		        $count=1;
		        while ($dt>=$enddate){

		        
                  $auxdate=strtotime("-1 days",$strtdate);
                $dt=date('y-m-d',$auxdate);
                include('salessub.php');
                echo "<br>date:" . $dt ."<br>";
                 $strtdate=strtotime($dt);
		        
		        
		   	   	       
		   	   	   }           

		   }
		   if(isset($_POST['year']))
		   {
		   	$stdate=date('y-m-d');
                $strtdate=strtotime($stdate);
                
                $eddate=strtotime("previous year");
                 $enddate=date('y-m-d',$eddate);
                 
		       $total_money=0;
		        $total_items=0;
		        $test_items=0;
		        $dt=date('y-m-d',$strtdate);
		        echo $dt;
		        $count=1;
		        while ($dt>=$enddate){

		        
                  $auxdate=strtotime("-1 days",$strtdate);
                $dt=date('y-m-d',$auxdate);
                include('salessub.php');
                echo "<br>date:" . $dt ."<br>";
                 $strtdate=strtotime($dt);
		     
		   }
		}

		      
		   
			?>
		   
		
	</div>
	
</body>
</html><?php } ?> 