<?php
header("Content-Type:text/plain; charset=iso-8859-1");
require("./Include/function.php");
BDD_connexion();
if (!isset($_POST["question"]))
	die("KO");
else
	$noquestion=trim($_POST["question"]);
if (!isset($_POST["reponse"]))
	die("KO");
else
	$proposition=trim($_POST["reponse"]);
	
$requete="SELECT lb_element FROM element where no_element IN (
				SELECT no_element FROM reponseelement WHERE no_reponse IN(
					SELECT no_reponse FROM reponse WHERE no_question=".$noquestion."
				))";
$recordset = BDD_EXECUTE($requete);
$flag_reponse = false;
while (($record=BDD_RESULT2ARRAY($recordset)) && (!$flag_reponse))   {
	$reponse	= trim($record[0]);
	if ($reponse==$proposition)
		$flag_reponse=true;
}

if ($flag_reponse)
	require("./Include/jeu.php");
else
	echo "la réponse était : ".$reponse;
BDD_close();
?>
