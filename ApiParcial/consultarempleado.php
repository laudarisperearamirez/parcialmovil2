<?php
include 'Config.php';

$queryResult=$connect->query("SELECT * FROM empleado");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>