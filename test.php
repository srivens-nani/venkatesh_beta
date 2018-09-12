<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body><div id="wts"><h1>A typed dataset that encapsulates the data tables that you connected to in the database. For more information, see Dataset tools in Visual Studio.

A BindingSource that connects the control to the typed dataset. For more information, see BindingSource Component Overview.

A TableAdapter that connects the typed dataset to the database. For more information, see TableAdapter Overview.

A TableAdapterManager, which is used to coordinate table adapters in the dataset to enable hierarchical updates. For more information, see Hierarchical Update and TableAdapterManager Over</div>
	<form method="post" id="id"><input type="text" name="rtext">
		<input type="submit" name="sbmt" onclick="myfun()"></form>
	</form>

<script type="text/javascript">
    function myfun() {
        var prtContent = document.getElementById("wts");
var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
WinPrint.document.write(prtContent.innerHTML);
WinPrint.document.close();
WinPrint.focus();
WinPrint.print();
WinPrint.close();
    }
</script>
<?php
    if(isset($_POST['sbmt']))
    {
    if($_POST['rtext']=='')
    {
    	echo 'nothing inserted';

    }
    elseif($_POST['rtext']=='venky')
    {
    	echo 'you are venkatesh';
        $x=date('y-m-d');
        echo $x;
    }
    else{
    	echo $_POST['rtext'];
    }
}
?>
</body>
</html>