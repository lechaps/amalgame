<?php
header("Content-Type:text/plain; charset=iso-8859-1");
require("./Include/function.php");
BDD_connexion();
GET_PARAM("ADMIN");
GET_PARAM("ADMIN_TENTATIVE");

if (!isset($_GET["methode"]))
	die("ERROR INPUT");

$methode=trim($_GET["methode"]);

/********* Test mire de connexion */
if ((!isset($_SESSION['admin'])) && ($methode!="ADMIN_login_check"))
	$methode="ADMIN_login";

/********* Affichage de la mire d'interdiction (en cas de dépassement du nombre de tentative) */
function afficheADMINInterdiction()   {
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '	<tr>';
	echo '		<td align="center">Accès interdit définitivement, '.ADMIN_TENTATIVE.' tentatives, c\'est '.(ADMIN_TENTATIVE-1).' de trop!!!!</td>';
	echo '	</tr>';
	echo '</table></div>';
}

/********* Affichage du login */
function afficheADMINLogin()   {
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '	<tr>';
	echo '		<td align="center">Evidemment un Code d\'accès est nécessaire : </td>';
	echo '	</tr>';
	echo '	<tr>';
	echo '		<td align="center"><input type="password" class="champ" id="ACCESS_code" name="ACCESS_code" maxlength="20" onkeypress="setAdminTouch(event);">';
	echo '		<input class="bouton" type="button" value="Valider" onclick="getAdminCheck()"></td>';
	echo '	</tr>';
	echo '</table></div>';
}

/********* Vérification du mot de passe */
function checkADMINLogin() {
	$pass	= trim($_POST["ACCESS_code"]);
	if (!(Decrypte(ADMIN, CLE)==$pass))   {
		LOG_ACTION("null", 3, "Tentative d'intrusion de l'IP : ".SQL_FormatChaine($_SERVER["REMOTE_ADDR"]));
		return false;
	}
	else
		$_SESSION['admin']=true;
	return true;
}

/********* Affichage du menu d'administration */
function afficheADMINMenu() {
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '	<tr><td><a onclick="getJoueurListe()" 	id="gestion_joueur" 	title="Gestion des joueurs" 	>Les joueurs				</a></td></tr>';
	echo '	<tr><td><a onclick="getProfilListe()" 	id="gestion_profil"		title="Gestion des profils" 	>Les profils				</a></td></tr>';
	echo '	<tr><td><a onclick="getDroitListe()"	id="gestion_droit"		title="Gestion des droits"		>Les droits/autorisations	</a></td></tr>';
	echo '	<tr><td><a onclick="getElementListe()"	id="gestion_element"	title="Gestion des éléments"	>Les éléments				</a></td></tr>';
	echo '	<tr><td><a onclick="getQuestionListe()"	id="gestion_question"	title="Gestion des questions"	>Les questions/réponses		</a></td></tr>';
	echo '	<tr><td><a onclick="getsigneListe()"	id="gestion_signe"		title="Gestion des signes"		>Les signes					</a></td></tr>';
	echo '	<tr><td><a onclick="getParametre()"		id="gestion_param"		title="Gestion des paramètres"	>Paramètres					</a></td></tr>';
	echo '	<tr><td><a onclick="getLOG()"			id="gestion_log"		title="Gestion des logs"		>Les Logs		</a></td></tr>';
	echo '</table></div>';
}

/***************************************************J O U E U R*****************************************************/
/********* Affichage de la liste des joueurs */
function afficheJOUEURliste() {
	$requete="SELECT no_joueur, prenom, nom, surnom, statut FROM joueur ORDER BY prenom, nom";
	$recordset = BDD_EXECUTE($requete);
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '<thead>';
	echo '<tr><td>N°</td><td>Prénom</td><td>Nom</td><td>Surnom</td><td>Statut</td></tr>';
	echo '</thead>';
	while ($record=BDD_RESULT2ARRAY($recordset))   {
		$no_joueur	= SQL_HTML($record[0]);
		$prenom		= SQL_HTML($record[1]);
		$nom		= SQL_HTML($record[2]);
		$surnom		= SQL_HTML($record[3]);
		$statut		= SQL_HTML($record[4]);		
		echo '<tr><td>'.$no_joueur.'</td><td>'.$prenom.'</td><td>'.$nom.'</td>';
		echo '<td>'.$surnom.'</td><td>'.$statut.'</td>';
		echo '<td><a onclick="setJoueurEdite('.$no_joueur.')"	>Editer</a></td>';
		echo '<td><a onclick="setJoueurSupprime('.$no_joueur.')"	>Supprimer</a></td>';
		echo '</tr>';
	}
	echo '</table></div>';
}

/********* Suppression d'un joueur */
function supprimeJOUEUR() {
	$nojoueur=SQL_FormatNombre($_POST["nojoueur"]);
	$requete="DELETE FROM joueur WHERE no_joueur=".$nojoueur;
	BDD_EXECUTE($requete);
	$requete="DELETE FROM mail WHERE no_joueur=".$nojoueur;
	BDD_EXECUTE($requete);
}

/********* Affichage d'un joueur */
function afficheJOUEUR($nojoueur) {
	$requete	= "SELECT no_joueur, prenom, nom, surnom, statut FROM joueur WHERE no_joueur=".SQL_FormatNombre($nojoueur);
	$recordset	= BDD_EXECUTE($requete);
	$recordPlayer=BDD_RESULT2ARRAY($recordset); 
	$prenom		= SQL_HTML($recordPlayer[1]);
	$nom		= SQL_HTML($recordPlayer[2]);
	$surnom		= SQL_HTML($recordPlayer[3]);
	$statut		= SQL_HTML($recordPlayer[4]);
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '	<tr><td colspan="2"><a onclick="getJoueurListe()">Revenir à la gestion des joueurs</a></tr>';
	echo '	<tr><td>Prénom</td>	<td><input type="text" maxlength="50" size="50" name="Prenom"	id="Prenom" value="'.$prenom.'"></td></tr>';
	echo '	<tr><td>Nom</td>	<td><input type="text" maxlength="50" size="50" name="Nom"		id="Nom"	value="'.$nom.'"></td></tr>';
	echo '	<tr><td>Surnom</td>	<td><input type="text" maxlength="50" size="50" name="Surnom"	id="Surnom"	value="'.$surnom.'"></td></tr>';
	echo '	<tr><td>Statut</td>	<td><select name="Statut" id="Statut">';
	checkJoueurStatutSelect($statut);
	echo '	</select></td></tr>';
	$requete	= "SELECT id_mail, mail FROM mail WHERE no_joueur=".SQL_FormatNombre($nojoueur);
	$recordset 	= BDD_EXECUTE($requete);
	while ($recordMail=BDD_RESULT2ARRAY($recordset))   {
		$idmail	= SQL_HTML($recordMail[0]);	
		$lbmail	= SQL_HTML($recordMail[1]);
		echo '<tr><td>Mail</td><td>'.$lbmail.' - <a class="lien_mini" onclick="setMailSupprime('.$idmail.', '.$nojoueur.' )">Supprimer</a></td>';
	}
	echo '	<tr><td>Ajouter ce Mail</td>';
	echo '		<td><input type="text" maxlength="50" size="50" name="mail" id="mail" value="">';
	echo '			<a class="lien_mini" onclick="setMailSauvegarde('.$nojoueur.')">Ajouter</a></td>';
	echo '	<tr><td colspan="2" align="center">';
	echo '		<input type="button" class="bouton" value="Valider" onclick="setJoueurSauvegarde('.$nojoueur.')"><td></tr>';
	echo '</table></div>';	
}

function checkJoueurStatutSelect($valeur) {
	$requete="SELECT replace(id_param, 'PLAYER_STATUT_', ''), lbparam FROM parametre WHERE id_param LIKE 'PLAYER_STATUT_%'";
	$recordset = BDD_EXECUTE($requete);
	while ($record=BDD_RESULT2ARRAY($recordset))   {
		$idstatut		= SQL_HTML($record[0]);
		$lbstatut		= SQL_HTML($record[1]);
		echo '<option value="'.$idstatut.'" '.Check_Select($idstatut, $valeur, "SELECTED").' >'.$lbstatut.'</option>';
	}
}

/********* Sauvegarde d'un joueur */
function enregistreJOUEUR() {
	$nojoueur	=SQL_FormatNombre($_POST["nojoueur"]);
	$nom		=SQL_FormatChaine(mb_convert_encoding($_POST["nom"],	"auto","UTF-8"));
	$prenom		=SQL_FormatChaine(mb_convert_encoding($_POST["prenom"], "auto","UTF-8"));
	$surnom		=SQL_FormatChaine(mb_convert_encoding($_POST["surnom"], "auto","UTF-8"));
	$statut		=SQL_FormatNombre($_POST["statut"]);
	$requete="UPDATE joueur SET nom=".$nom.", prenom=".$prenom.", surnom=".$surnom.", statut=".$statut." WHERE no_joueur=".$nojoueur;
	BDD_EXECUTE($requete);
}

/********* Supprime un mail */
function supprimeMAIL($idmail) {
	$requete="DELETE FROM mail WHERE id_mail=".SQL_FormatNombre($idmail);
	BDD_EXECUTE($requete);
}

/********* Sauvegarde un mail */
function enregistreMAIL() {
	$nojoueur	=SQL_FormatNombre($_POST["nojoueur"]);
	$mail		=SQL_FormatChaine(mb_convert_encoding($_POST["mail"], "auto", 	"UTF-8"));
	$requete="SELECT count(*) FROM mail WHERE mail=".$mail;
	$recordset = BDD_EXECUTE($requete);
	$recordPlayer=BDD_RESULT2ARRAY($recordset);
	if ($recordPlayer[0]==0)   {
		$requete="INSERT INTO mail (no_joueur, mail) VALUES (".$nojoueur.", ".$mail.")";
		BDD_EXECUTE($requete);
	}
	else
		echo "L'email ".SQL_HTML($mail)." existe déjà";
}

/***************************************************E L E M E N T*****************************************************/
/********* fonction d'affichage de liste*/
function afficheELEMENTliste() {
	$requete="SELECT no_element, lb_element, image FROM Element ORDER BY no_Element";
	$recordset = BDD_EXECUTE($requete);
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '<thead>';
	echo '<tr><td colspan="5"><a onclick="setElementEdite(null)">Ajouter un Element</a></td></tr>';
	echo '<tr><td>N°</td><td>Libellé</td><td>Image</td><td></td><td></td></tr>';
	echo '</thead>';
	while ($record=BDD_RESULT2ARRAY($recordset))   {
		$no_element	= SQL_HTML($record[0]);
		$lb_element	= SQL_HTML($record[1]);
		$image		= SQL_HTML($record[2]);
		echo '<tr><td>'.$no_element.'</td><td>'.$lb_element.'</td><td><img src="Image_Element/48x48/'.$image.'"></td>';
		echo '<td><a onclick="setElementEdite('.$no_element.')"	>Editer</a></td>';
		echo '<td><a onclick="setElementSupprime('.$no_element.')"	>Supprimer</a></td>';
		echo '</tr>';
	}
	echo '</table></div>';
}

/********* Affichage */
function afficheELEMENT($noElement) {
	if ($noElement!="null")  {
		$requete	="SELECT lb_element, cmt_court, cmt_long, image FROM element WHERE no_element=".$noElement;
		$recordset 	=BDD_EXECUTE($requete);
		$record		=BDD_RESULT2ARRAY($recordset); 
		$lb_element	= SQL_HTML($record[0]);
		$cmt_court	= SQL_HTML($record[1]);
		$cmt_long	= SQL_HTML($record[2]);
		$image		= SQL_HTML($record[3]);
	}
	else   {
		$lb_element		= "";
		$cmt_court		= "";
		$cmt_long		= "";
		$image			= "";
	}
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '	<tr><td colspan="2"><a onclick="getElementListe()">Revenir à la gestion des Elements</a></tr>';
	echo '	<tr><td>Libellé				</td><td><input type="text" maxlength="50" size="20" name="lb_element" id="lb_element" value="'.$lb_element.'"></td></tr>';
	echo '	<tr><td>Commentaire Court	</td><td><textarea cols="40" rows="2" name="cmt_court" id="cmt_court"	>'.$cmt_court.'</textarea></td></tr>';
	echo '	<tr><td>Commentaire Long	</td><td><textarea cols="40" rows="10" name="cmt_long" id="cmt_long"	>'.$cmt_long.'</textarea></td></tr>';
	echo '	<tr><td>Image				</td><td><input type="text" maxlength="250" size="50" name="image" id="image" value="'.$image.'"></td></tr>';
	echo '	<tr><td colspan="2" align="center">';
	echo '		<input type="button" class="bouton" value="Valider" onclick="setElementSauvegarde('.$noElement.')"><td></tr>';
	echo '</table></div>';
}

/********* Sauvegarde*/
function enregistreELEMENT() {
	$noElement	= SQL_FormatNombre($_POST["noelement"]);
	$lb_element	= SQL_FormatChaine(mb_convert_encoding($_POST["lb_element"]), "auto", "UTF-8");
	$cmt_court	= SQL_FormatChaine(mb_convert_encoding($_POST["cmt_court"])	, "auto", "UTF-8");
	$cmt_long	= SQL_FormatChaine(mb_convert_encoding($_POST["cmt_long"])	, "auto", "UTF-8");
	$image		= SQL_FormatChaine(mb_convert_encoding($_POST["image"])		, "auto", "UTF-8");
	if ($noElement=="null") 
		$requete="INSERT INTO element(lb_element, cmt_court, cmt_long, image) VALUES (".$lb_element.",".$cmt_court.",".$cmt_long.",".$image.")";
	else
		$requete="UPDATE element set lb_element=".$lb_element.", cmt_court=".$cmt_court.", cmt_long=".$cmt_long.", image=".$image." WHERE no_element=".$noElement;
	BDD_EXECUTE($requete);
}

/********* Supprime */
function supprimeELEMENT($noElement) {
	$requete="DELETE FROM Element WHERE no_Element=".SQL_FormatNombre($noElement);
	BDD_EXECUTE($requete);
}


/***************************************************Q U E S T I O N*****************************************************/
/********* fonction d'affichage de liste*/
function afficheQUESTIONliste() {
	$requete="SELECT Q.no_question, Q.actif FROM question Q ORDER BY Q.no_question";
	$recordset = BDD_EXECUTE($requete);
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '<thead>';
	echo '<tr><td colspan="5"><a onclick="setQuestionEdite(null, null, null)">Ajouter une question</a></td></tr>';
	echo '<tr><td>N°</td><td>Actif</td><td>Element de question</td><td></td><td></td></tr>';
	echo '</thead>';
	while ($record=BDD_RESULT2ARRAY($recordset))   {
		$noquestion	= $record[0];
		$actif		= SQL_HTML($record[1]);
		echo '<tr><td>'.SQL_HTML($noquestion).'</td><td>'.Check_Select($actif, 1, "Actif").'</td><td>';
		$question_default="[";
		$requete="SELECT QE.no_element, E.lb_element, E.image FROM questionelement QE
					LEFT OUTER JOIN element E on QE.no_element=E.no_element
					WHERE no_question=".SQL_FormatNombre($noquestion)." ORDER BY QE.no_element";
		$recordsetQE = BDD_EXECUTE($requete);
		while ($recordQE=BDD_RESULT2ARRAY($recordsetQE))   {
			$no_element	=SQL_HTML($recordQE[0]);
			$lb_element	=SQL_HTML($recordQE[1]);
			$image 		=SQL_HTML($recordQE[2]);
			echo '<img src="Image_Element/32x32/'.$image.'" title="'.$lb_element.'">';
			if ($question_default!="[")
				$question_default.=", ";
			$question_default.="{value: '".$no_element."', name: '".$lb_element."'}";
		}
		$question_default.="]";
		$reponse_default="[";
		$requete="SELECT no_element, lb_element FROM Element WHERE no_element in (
								SELECT no_element FROM reponseelement WHERE no_reponse in (
										SELECT no_reponse FROM reponse WHERE no_question=".SQL_FormatNombre($noquestion).") ) ORDER BY no_Element";
		$recordsetR = BDD_EXECUTE($requete);
		while ($recordR=BDD_RESULT2ARRAY($recordsetR))   {
			$no_element	=SQL_HTML($recordR[0]);
			$lb_element	=SQL_HTML($recordR[1]);
			if ($reponse_default!="[")
				$reponse_default.=", ";
			$reponse_default.="{value: '".$no_element."', name: '".$lb_element."'}";
		}
		$reponse_default.="]";
		echo '</td><td><a onclick="setQuestionEdite('.SQL_HTML($noquestion).',  '.$question_default.', '.$reponse_default.' );"	>Editer</a></td>';
		echo '<td><a onclick="setQuestionSupprime('.SQL_HTML($noquestion).')"	>Supprimer</a></td></tr>';
	}
	echo '</table></div>';
}

/********* Affichage */
function afficheQUESTION($noQuestion) {
	if ($noQuestion=="null")  {
		$requete	= "INSERT INTO question (actif) values (1)";
		BDD_EXECUTE($requete);
		$noQuestion	= BDD_LAST_INSERT();
	}
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	echo '	<tr><td colspan="2"><a onclick="getQuestionListe()">Revenir à la gestion des questions</a></tr>';
	echo '	<tr><td>L\'addition</td><td><input type="text" name="Question_element"	id="Question_element" value="">	</td></tr>';
	echo '	<tr><td>La Réponse</td><td><input type="text" name="Reponse_element"	id="Reponse_element" value="">	</td></tr>';
	echo '	<tr><td colspan="2" align="center">';
	echo '		<input type="button" class="bouton" value="Valider" onclick="setQuestionSauvegarde('.$noQuestion.')"><td></tr>';
	echo '</table></div>';
}

/********* Sauvegarde*/
function enregistreQUESTION() {
	$no_question=SQL_FormatNombre($_POST["noquestion"]);
	$requete	="DELETE FROM questionelement WHERE no_question=".$no_question;
	BDD_EXECUTE($requete);
	$question_element=trim(mb_convert_encoding($_POST["question_element"]	, "auto", "UTF-8"));
	$element	= explode(",", $question_element);
	foreach($element as $cle => $valeur) {
		if (trim($valeur)!="")   {
			$requete="INSERT INTO questionelement (no_question, no_element) VALUES (".$no_question.",".SQL_FormatNombre($valeur).")";
			BDD_EXECUTE($requete);
		}
	}
	
	$requete	= "SELECT no_reponse FROM reponse WHERE no_question=".$no_question;
	$recordset	= BDD_EXECUTE($requete);
	if ($record = BDD_RESULT2ARRAY($recordset))
		$no_reponse=$record[0];
	else   {
		$requete	= "INSERT INTO reponse (no_question) values (".$no_question.")";
		BDD_EXECUTE($requete);
		$no_reponse	= BDD_LAST_INSERT();
	}
	$requete="DELETE FROM reponseelement WHERE no_reponse=".$no_reponse;
	BDD_EXECUTE($requete);
	$reponse_element=trim(mb_convert_encoding($_POST["reponse_element"]	, "auto", "UTF-8"));
	$element	= explode(",", $reponse_element);
	foreach($element as $cle => $valeur) {
		if (trim($valeur)!="")   {
			$requete="INSERT INTO reponseelement (no_reponse, no_element) VALUES (".$no_reponse.",".SQL_FormatNombre($valeur).")";
			BDD_EXECUTE($requete);
		}
	}
}

/********* Supprime */
function supprimeQUESTION($noquestion) {
	$requete="DELETE FROM question 			WHERE no_question=".SQL_FormatNombre($noquestion);
	BDD_EXECUTE($requete);
	$requete="DELETE FROM questionelement 	WHERE no_question=".SQL_FormatNombre($noquestion);
	BDD_EXECUTE($requete);
	$requete="DELETE FROM reponseelement	WHERE no_reponse in (SELECT no_question FROM reponse WHERE no_question=".SQL_FormatNombre($noquestion).")";
	BDD_EXECUTE($requete);
	$requete="DELETE FROM reponse			WHERE no_question=".SQL_FormatNombre($noquestion);
	BDD_EXECUTE($requete);
}


/***************************************************P A R A M E T R E*****************************************************/
/********* Affichage des parametres */
function affichePARAMliste() {
	$requete="SELECT id_param, lbparam, descparam FROM parametre";
	$recordset = BDD_EXECUTE($requete);
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table align="center">';
	while ($record=BDD_RESULT2ARRAY($recordset))   {
		$id	=SQL_HTML($record[0]);
		$val=SQL_HTML($record[1]);
		$cmt=SQL_HTML($record[2]);
		if ($id=="ADMIN" || $id=="REPONSE")
			$val=Decrypte($val, CLE);
		echo '<tr><td><a id="A_'.$id.'"  title="'.$cmt.'">'.$id.'</a></td><td><input id="'.$id.'" type="text" size="50" value="'.$val.'"</td>';
		echo '</tr>';
	}
	echo '	<tr><td colspan="2" align="center">';
	echo '		<input type="button" class="bouton" value="Valider" onclick="setParametreSauvegarde()"><td></tr>';
	echo '</table></div>';
}

/********* Sauvegarde des paramètres */
function enregistrePARAM() {
	$TITLE_PAGE		=SQL_FormatChaine(mb_convert_encoding($_POST["TITLE_PAGE"]		, "auto", "UTF-8"));
	$CHEMIN_STYLE	=SQL_FormatChaine(mb_convert_encoding($_POST["CHEMIN_STYLE"]	, "auto", "UTF-8"));
	$STYLE_JQUERY	=SQL_FormatChaine(mb_convert_encoding($_POST["STYLE_JQUERY"]	, "auto", "UTF-8"));
	$VERSION		=SQL_FormatChaine(mb_convert_encoding($_POST["VERSION"]			, "auto", "UTF-8"));
	$ADMIN			=SQL_FormatChaine(Crypte(mb_convert_encoding($_POST["ADMIN"]	, "auto", "UTF-8"), CLE));
	$PLAYER_STATUT_0=SQL_FormatChaine(mb_convert_encoding($_POST["PLAYER_STATUT_0"]	, "auto", "UTF-8"));
	$PLAYER_STATUT_1=SQL_FormatChaine(mb_convert_encoding($_POST["PLAYER_STATUT_1"]	, "auto", "UTF-8"));
	$PLAYER_STATUT_2=SQL_FormatChaine(mb_convert_encoding($_POST["PLAYER_STATUT_2"]	, "auto", "UTF-8"));
	$PLAYER_STATUT_3=SQL_FormatChaine(mb_convert_encoding($_POST["PLAYER_STATUT_3"]	, "auto", "UTF-8"));
	$ADMIN_TENTATIVE=SQL_FormatChaine(mb_convert_encoding($_POST["ADMIN_TENTATIVE"]	, "auto", "UTF-8"));
	$REPONSE_INTERVAL=SQL_FormatChaine(mb_convert_encoding($_POST["REPONSE_INTERVAL"]	, "auto", "UTF-8"));
	$requete	="UPDATE parametre set lbparam=".$TITLE_PAGE." 		where id_param='TITLE_PAGE'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$CHEMIN_STYLE." 	where id_param='CHEMIN_STYLE'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$STYLE_JQUERY."	where id_param='STYLE_JQUERY'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$VERSION."			where id_param='VERSION'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$ADMIN."			where id_param='ADMIN'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$PLAYER_STATUT_0."	where id_param='PLAYER_STATUT_0'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$PLAYER_STATUT_1."	where id_param='PLAYER_STATUT_1'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$PLAYER_STATUT_2."	where id_param='PLAYER_STATUT_2'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$PLAYER_STATUT_3."	where id_param='PLAYER_STATUT_3'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$ADMIN_TENTATIVE."	where id_param='ADMIN_TENTATIVE'";
	BDD_EXECUTE($requete);
	$requete	="UPDATE parametre set lbparam=".$REPONSE_INTERVAL."	where id_param='REPONSE_INTERVAL'";
	BDD_EXECUTE($requete);
}

/***************************************************L O G*****************************************************/
/********* Affichage de la liste des logs */
function afficheLOGliste() {
	$requete="SELECT no_action, no_joueur, priorite, action, dateaction FROM log ORDER BY dateaction desc";
	$recordset = BDD_EXECUTE($requete);
	echo '<div id="DIVshake" class="DIV_INCLUDE"><table class="TABLE_INCLUDE" align="center">';
	echo '<thead>';
	echo '<tr><td>N°</td><td>Joueur</td><td>Priorité</td><td>Action</td><td>Date d\'action</td>';
	echo '<td><a class="lien_interne" onclick="setPurgeLOG()">Purge</a></td></tr>';
	echo '</thead>';
	while ($record=BDD_RESULT2ARRAY($recordset))   {
		$no_action	=SQL_HTML($record[0]);
		$no_joueur	=SQL_HTML($record[1]);
		$priorite	=SQL_HTML($record[2]);
		$action		=SQL_HTML($record[3]);
		$dateaction	=SQL_HTML($record[4]);
		echo '<tr><td>'.$no_action.'</td><td>'.$no_joueur.'</td><td>'.$priorite.'</td>';
		echo '<td>'.$action.'</td><td>'.$dateaction.'</td>';
		echo '<td><a class="lien_interne" onclick="setLOGSupprime('.$no_action.')"	>Supprime</a></td>';
		echo '</tr>';
	}
	echo '</table></div>';
}

/********* Supprime un LOG */
function supprimeLOG($no) {
	$requete="DELETE FROM log WHERE no_action=".SQL_FormatNombre($no);
	BDD_EXECUTE($requete);
}

/********* Purge les LOG (priorité inférieur à 3) */
function purgeLOG() {
	$requete="DELETE FROM log WHERE priorite<3";
	BDD_EXECUTE($requete);
}



/****************************************************************************************************************************************/
/****************************************************************************************************************************************/
/***************************************************** A I G U I L L A G E **************************************************************/
/****************************************************************************************************************************************/
/****************************************************************************************************************************************/
switch ($methode) {
	/******************************PAGE DE LOGIN**********************************/
    case "ADMIN_login":
		if (isset($_SESSION['admin_tentative']))   {
			$_SESSION['admin_tentative']+=1;
			if ($_SESSION['admin_tentative']>=ADMIN_TENTATIVE)   {
				afficheADMINInterdiction();
			}
			else
				afficheADMINLogin();
		}
		else   {
			afficheADMINLogin();}
		break;
    /******************************VERIF LOGIN**********************************/
	case "ADMIN_login_check":
		if (checkADMINLogin())
			afficheADMINMenu();
		else
			if (isset($_SESSION['admin_tentative']))   {
				$_SESSION['admin_tentative']+=1;
				if ($_SESSION['admin_tentative']>=ADMIN_TENTATIVE)   {
					afficheADMINInterdiction();
				}
				else
					echo "ACCES_KO";
			}
			else   {
				$_SESSION['admin_tentative']=1;
				echo "ACCES_KO";
			}
		break;

	/**************************MENU ADMINISTRATION*******************************/
	case "ADMIN_menu":
		afficheADMINMenu();
		break;
	/**************************GESTION DES JOUEURS*******************************/
	case "JOUEUR_liste":
		afficheJOUEURliste();
		break;
	case "JOUEUR_supprime":
		supprimeJOUEUR();
		afficheJOUEURliste();
		break;
	case "JOUEUR_edite":
		$nojoueur=trim($_POST["nojoueur"]);
		afficheJOUEUR($nojoueur);
		break;
	case "JOUEUR_sauvegarde":
		enregistreJOUEUR();
		afficheJOUEURliste();
		break;
	case "MAIL_supprime":
		$nojoueur	= trim($_POST["nojoueur"]);
		$idmail		= trim($_POST["idmail"]);
		supprimeMAIL($idmail);
		afficheJOUEUR($nojoueur);
		break;
	case "MAIL_sauvegarde":
		enregistreMAIL();
		$nojoueur=trim($_POST["nojoueur"]);
		afficheJOUEUR($nojoueur);
		break;
	/**************************GESTION DES ELEMENTS*******************************/
	case "ELEMENT_liste":
		afficheELEMENTliste();
		break;
	case "ELEMENT_edite":
		$noElement=trim($_POST["noelement"]);
		afficheELEMENT($noElement);
		break;
	case "ELEMENT_sauvegarde":
		enregistreELEMENT();
		afficheELEMENTliste();
		break;
	case "ELEMENT_supprime":
		$noElement	= trim($_POST["noelement"]);
		supprimeELEMENT($noElement);
		afficheELEMENTliste();
		break;
	/**************************GESTION DES QUESTIONS*******************************/
	case "QUESTION_liste":
		afficheQUESTIONliste();
		break;
	case "QUESTION_edite":
		$noQuestion=trim($_POST["noquestion"]);
		afficheQUESTION($noQuestion);
		break;
	case "QUESTION_sauvegarde":
		enregistreQUESTION();
		afficheQUESTIONliste();
		break;
	case "QUESTION_supprime":
		$noquestion	= trim($_POST["noquestion"]);
		supprimeQUESTION($noquestion);
		afficheQUESTIONliste();
		break;
	/**************************GESTION DES PARAMETRES*******************************/
	case "PARAM_liste":
		affichePARAMliste();
		break;
	case "PARAM_sauvegarde":
		enregistrePARAM();
		afficheADMINMenu();
		break;
	/**************************GESTION DES LOG*******************************/	
	case "LOG_liste":
		afficheLOGliste();
		break;
	case "LOG_supprime":
		$nolog	= trim($_POST["nolog"]);
		supprimeLOG($nolog);
		afficheLOGliste();
		break;
	case "LOG_purge":
		purgeLOG();
		afficheLOGliste();
		break;
	/**************************CATH ERREUR*******************************/	
    default:
		echo "WARNING!!! GUY,  YOU WANT TO DO SOMETHING THAT I DON'T UNDERSTAND : ".$methode;
        break;
}
BDD_close();
?>
