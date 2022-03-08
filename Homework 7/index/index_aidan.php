<?php 
//The server returns JSON data 
$arr=array('name'=>'Clara','name2'=>'Fergus','name3'=>'Oscar','name4'=>'Raven','name5'=>'Eleanor'); 
$result=json_encode($arr); 

$callback=$_GET['callback']; 
echo $callback."($result)";
?>