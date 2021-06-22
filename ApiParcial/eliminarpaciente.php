<?php
	include 'Config.php';
	$codigoeliminar=$_POST['codigoeliminar'];
	$connect->query("DELETE FROM paciente WHERE codigo=".$codigoeliminar);

?>