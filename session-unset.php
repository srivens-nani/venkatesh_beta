<?php
session_start();
unset($_SESSION['cart'][$_SESSION['count']]['quant']);	

unset($_SESSION['cart'][$_SESSION['count']]['cat']);
unset($_SESSION['count']);
?>