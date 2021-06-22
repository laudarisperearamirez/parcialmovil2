<?php
	include 'Config.php';
	$codigoeliminar=$_POST['codigoeliminar'];
	$connect->query("DELETE FROM empleado WHERE codigo=".$codigoeliminar);

?>