<?php

	include 'Config.php';
	
	$codigo = $_POST['codigo'];
	$foto = $_POST['foto'];
	$nombre = $_POST['nombre'];
	$apellido = $_POST['apellido'];
	$tipo = $_POST['tipo'];
	$estado = $_POST['estado'];
	$trabajo = $_POST['trabajo'];



	$connect->query("UPDATE empleado SET foto='$foto',nombre='$nombre',apellido='$apellido',tipo='$tipo',estado='$estado',trabajo='$trabajo'WHERE codigo='$codigo'");


?>