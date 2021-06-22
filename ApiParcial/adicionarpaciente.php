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

    
    $connect->query("INSERT INTO paciente (codigo,foto,nombre, apellido, fechanacimiento, edad, direccion, barrio, telefono, ciudad, estado) VALUES ('".$codigo."','".$foto."','".$nombre."','".$apellido."', '".$fechanacimiento."', '".$edad."', '".$direccion."', '".$barrio."', '".$telefono."', '".$ciudad."','".$estado."')")
?>