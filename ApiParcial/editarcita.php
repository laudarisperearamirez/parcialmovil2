<?php

	include 'Config.php';
	
    $codigocita = $_POST['codigocita'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];
    $Observacion = $_POST['Observacion'];
    $estado = $_POST['estado'];
    
      
      


	$connect->query("UPDATE citas SET fecha='$fecha',hora='$hora',estado='$estado',Observacion='$Observacion' WHERE codigocita='$codigocita'");


?>