<?php

    include 'Config.php';

    $codigo = $_POST['codigo'];
    $foto = $_POST['foto'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $tipo = $_POST['tipo'];
    $estado = $_POST['estado'];
    $trabajo = $_POST['trabajo'];


    
    $connect->query("INSERT INTO empleado (codigo,foto,nombre, apellido, tipo, estado, trabajo) VALUES ('".$codigo."','".$foto."','".$nombre."','".$apellido."', '".$tipo."','".$estado."','".$trabajo."')")
?>