<?php
header("Content-Type:text/plain; charset=iso-8859-1");
require("./Include/function.php");
BDD_connexion();

$input	= $_GET["q"];
$data	= array();
$query	= BDD_EXECUTE("SELECT * FROM element WHERE lb_element LIKE '%$input%'");
while ($row=BDD_RESULT2ARRAY($query)) {
	$json 			= array();
	$json['value'] 	= $row['no_element'];
	$json['name'] 	= $row['lb_element'];
	$json['image'] 	= $row['image'];
	$data[] 		= $json;
}
header("Content-type: application/json");
echo json_encode($data);

BDD_close();
?>
