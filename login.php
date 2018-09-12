<?php
session_start();
?><html>

<head>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<link rel="icon" href="res.png">
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">
  body{
background-image:url('Rest.jpg');
background-size:cover;
background-repeat: no-repeat;
height: 100%;
width: 100%;

}
</style>
</head>
<body>
<div class="loginbox">
<img src="chef.png" class="avatar">
<h1>login here</h1>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$myDB="vdb";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$myDB", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Have a Good Day..!!";




 	 
     
   
    
    

    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }


?>

<form name='form1' action="" method="post">
<p>username</p>
<input type="text" name="username" placeholder="enter username" value="">
<p>password</p>
<input type="password" name="pwd" placeholder="enterpassword" value="">
<input type="submit" name="submit" value="login" id="form1"></form>
<?php if(isset($_POST["submit"]))
    { 
      if($_POST['username']=='' && $_POST['pwd']==''){
        echo"<script type=\"text/javascript\">alert('enter something');</script>";
          }
         elseif($_POST['username']==''){
        echo"<script type=\"text/javascript\">alert('enter username');</script>";
          }
          elseif($_POST['pwd']==''){
        echo"<script type=\"text/javascript\">alert('enter password');</script>";
          }
    else{
       $un=$_POST['username'];
        $stmt = $conn->prepare("SELECT password from login where username='$un'"); 
    $stmt->execute();

   $res = $stmt->fetchAll();
   foreach ($res as $result) {
    $j=$result['password'];
    echo $j;

     }
     if($_POST['pwd']==$j)
     {
      echo"login success";

     

   $fetch=$conn->prepare("SELECT uid from login where username='$un' and password='$j'");
   $fetch->execute();
   $x=$fetch->fetchAll();
   foreach ($x as $y) {
     $idv=$y['uid'];
     echo $idv;
 
    
     $_SESSION['$id']=$idv;
if(isset($_SESSION['$id']))
{
  header('location:ind.php');
  } 

   }
   }
   else
  {
    echo "<script type=\"text/javascript\">alert('enter valid username or password');</script>";
  }
   }

 }
   ?>


</div>
</body>
</head>
</html>

