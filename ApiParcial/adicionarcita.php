<?php

    include 'Config.php';
    $codigocita = $_POST['codigocita'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];
    $estado = $_POST['estado'];

    $codigopaciente = $_POST['codigopaciente'];
    $nombrepaciente = $_POST['nombrepaciente'];
    $apellidopaciente = $_POST['apellidopaciente'];
    $edadpaciente = $_POST['edadpaciente'];
    $codigotrabajador = $_POST['codigotrabajador'];
    $nombretrabajador = $_POST['nombretrabajador'];
    $apellidotrabajador = $_POST['apellidotrabajador'];
     $tipotrabajador = $_POST['tipotrabajador'];
      

    
    $connect->query("INSERT INTO citas (codigocita,fecha,hora,estado,codigopaciente, nombrepaciente, apellidopaciente, edadpaciente, codigotrabajador, nombretrabajador, apellidotrabajador, tipotrabajador) VALUES ('".$codigocita."','".$fecha."','".$hora."','".$estado."','".$codigopaciente."', '".$nombrepaciente."', '".$apellidopaciente."', '".$edadpaciente."', '".$codigotrabajador."', '".$nombretrabajador."', '".$apellidotrabajador."','".$tipotrabajador."')")
?>