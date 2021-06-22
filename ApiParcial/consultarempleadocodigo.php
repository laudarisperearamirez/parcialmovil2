<?php
    include 'Config.php';
    $codigo = $_POST['codigo'];
    $consultar=$connect->query("SELECT * FROM empleado WHERE codigo='".$codigo."'");
    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>