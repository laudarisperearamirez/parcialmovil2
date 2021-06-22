<?php
   header('Access-Control-Allow-Origin: *');
   header('Access-Control-Allow-Credentials: true');
   header('content-type: application/json; charset=utf-8');
   header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
   header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
    header("HTTP/1.1 200 OK");

$connect = new mysqli("localhost","root","","bdparcial");

if($connect){
	 
}else{
	echo "Algo ha fallado, revise la conexión";
	exit();
}