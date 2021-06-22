<?php
    include 'Config.php';
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];
    $consultar=$connect->query("SELECT * FROM loguin WHERE usuario='".$usuario."' and contrasena='".$contrasena."'");
    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>