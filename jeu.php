<?php
header("Content-Type:text/plain; charset=iso-8859-1");
require("./Include/function.php");
BDD_connexion();

if (!isset($_GET["methode"]))
	die("ERROR INPUT");

$methode=trim($_GET["methode"]);

/********* Affichage d'une question au hasard */
function afficheQuestionHasard()   {
	$requete="SELECT Q.no_question, Q.actif FROM question Q where actif=1 ORDER BY RAND() LIMIT 1 ";
	$recordset = BDD_EXECUTE($requete);
	
	if ($record		=BDD_RESULT2ARRAY($recordset))   {
		$noquestion	=$record[0];
		
		$requete="SELECT QE.no_element, E.lb_element, E.image FROM questionelement QE
					LEFT OUTER JOIN element E on QE.no_element=E.no_element
					WHERE no_question=".$noquestion." ORDER BY QE.no_element";
		$recordsetQE = BDD_EXECUTE($requete);
		$flagfirst	= true;
		$HTML_image	= '';
		$HTML_libel	= '';
		while ($recordQE=BDD_RESULT2ARRAY($recordsetQE))   {
			$lb_image	=SQL_HTML($recordQE[1]);
			$lien_image	=SQL_HTML($recordQE[2]);		
			if ($flagfirst)
				$flagfirst=false;
			else   {
				$HTML_image.='<td> + </td>';
				$HTML_libel.='<td></td>';
				}
			$HTML_image.='<td><img src="Image_Element/128x128/'.$lien_image.'" title="'.$lb_image.'"></td>';
			$HTML_libel.='<td>'.$lb_image.'</td>';;
		}
	}
	else {
		$noquestion="";
		$HTML_image='<td></td>';
		$HTML_libel='<td></td>';
	}
		
	echo '<div id="DIV_GAME" class="DIV_GAME"><table align="center"><tr><td>';
	echo '<table><tr>'.$HTML_image.'</tr><tr>'.$HTML_libel.'</tr></table>';
	echo '</td></tr>';
	echo '<tr><td align="center"><input type="text" class="champ_reponse" id="ACCESS_code" name="ACCESS_code" maxlength="50" onkeypress="setGoTouch(event, '.$noquestion.');">';
	echo '		<input class="bouton" type="button" value="Valider" onclick="getReponseCheck('.$noquestion.')">'.$_SESSION["NB_REPONSE"].'</td></tr></table></div>';
	echo '<div id="commentaire" ></div>';
	
}

/********* Check la réponse à une question */
function checkReponse($noquestion, $proposition)   {
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
	/*remplacement des accents : $fichier = strtr($fichier,'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ', 'AAAAAACEEEEIIIIOOOOOUUUUYaaaaaaceeeeiiiioooooouuuuyy'); */
	if ($flag_reponse)   {
		$_SESSION["NB_REPONSE"]++;
		afficheQuestionHasard();
	}
	else
		echo "la réponse était : ".$reponse." la proposition : ".$proposition;
}

/****************************************************************************************************************************************/
/****************************************************************************************************************************************/
/***************************************************** A I G U I L L A G E **************************************************************/
/****************************************************************************************************************************************/
/****************************************************************************************************************************************/	

/*mode de jeu a prévoir :  - le plus de réponse à la suite,  - le plus de réponse sur N question */

switch ($methode) {
	/******************************VERIFICATION D'UNE REPONSE**********************************/
    case "CHECK":
		if (!isset($_POST["question"]))
			die("KO - pas de question");
		else
		$noquestion=trim($_POST["question"]);
		if (!isset($_POST["reponse"]))
			die("KO - pas de proposition");
		else
		$proposition		=mb_convert_encoding($_POST["reponse"],	"auto","UTF-8");
		checkReponse($noquestion, $proposition);
		break;
    /******************************AFFICHE LE JEU**********************************/
	case "AFFICHE_JEU":
		$_SESSION["NB_REPONSE"]=0;
		afficheQuestionHasard();
		break;
	/**************************CATH ERREUR*******************************/	
    default:
		echo "WARNING!!! GUY,  YOU WANT TO DO SOMETHING THAT I DON'T UNDERSTAND : ".$methode;
        break;
}
	
BDD_close();
?>