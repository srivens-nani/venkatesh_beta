<html>
<head>
   <?php
   session_start();
   include 'db.php';
   ?>
<style>
#ctr{
   
   width: 200px;
   float:center;
   height:40px;
   border-radius: 8px;
   border-color: grey;
   }
   #abc{
   float: center;
   text-align: center;
   }
   
   
   
   #id{
   height:25px;
   width: 50px;
   border-radius:4.5px;
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
      var numbers = /^[0-9]+$/;
      if(inputtxt.value.match(numbers))
         { document.write("hello");}
	
    
	 
	 }
   </script>
   
</head>
<body>
<div id="abc">
<form name="items" method="post" onsubmit="itm(this)">
<table cellpadding="10px" cellspacing="10px">
<tr>
<td><b><i><span style="font-family:courier new; color:red; font-size:32px;">ITEM</span></i></b></td><td><b><i><span style="font-family:courier new; color:red; font-size:26px;">QUANTITY</span></i></b></td><td></td></tr>
<tr>
<td>


   <select id="ctr" name="category">
           <option value="select"></option>
      <option value="chicken-biryani">chicken biryani</option>
	  <option value="veg-manchuria">veg-manchuria</option>
	  <option value="tomato-soup">tomato-soup</option>
	  </select></td>
	  <td><input id="id" type="text" name="quantity" value="" onfocus="allnumeric(inputtxt)"></td>
	<td>  <input type="submit" name="sub" value="+" ></td></tr></table>
 </form>

 
 </div>
 
 
 </body>
 </html>
