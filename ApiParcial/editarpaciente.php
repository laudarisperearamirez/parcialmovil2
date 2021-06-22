<?php

	include 'Config.php';
	
	$codigo = $_POST['codigo'];
	$foto = $_POST['foto'];
	$nombre = $_POST['nombre'];
	$apellido = $_POST['apellido'];
	$fechanacimiento = $_POST['fechanacimiento'];
	$edad = $_POST['edad'];
	$direccion = $_POST['direccion'];
	$barrio = $_POST['barrio'];
	$telefono = $_POST['telefono'];
	$ciudad = $_POST['ciudad'];
	$estado = $_POST['estado'];


	$connect->query("UPDATE paciente SET foto='$foto',nombre='$nombre',apellido='$apellido',fechanacimiento='$fechanacimiento',edad='$edad',direccion='$direccion',barrio='$barrio',telefono='$telefono',ciudad='$ciudad',estado='$estado'WHERE codigo='$codigo'");


?>