<?php session_start();
/**************************************************************************************************/
/* Page des fonctions communes 
/**************************************************************************************************/

/*------------------------------------------------------------------------------------------------*/
/* Variable Global (paramètres)
/*------------------------------------------------------------------------------------------------*/
define('MySQL_Serveur'	, 'localhost');
define('MySQL_User'		, 'root');
define('MySQL_Mdp'		, 'icemysql');
define('MySQL_Db'		, 'Amalgame');



/*------------------------------------------------------------------------------------------------*/
/* Connexion BDD + Selection DB
/*------------------------------------------------------------------------------------------------*/
function BDD_connection() {
	$MySQL_Connection = mysql_connect(MySQL_Serveur, MySQL_User, MySQL_Mdp) 
		or die("Connexion Impossible au serveur MySQL : " . mysql_error());

	mysql_select_db(MySQL_Db, $MySQL_Connection)
		or die("Connexion Impossible à la base de donnée : " . mysql_error());
}

/*------------------------------------------------------------------------------------------------*/
/* Selection Alétoire d'enregistrement
/*------------------------------------------------------------------------------------------------*/
function RandomizeSelection() {
	/* nombre d'éléments à sélectionner aléatoirement */
	$nb_elements = 3;

	$requete = mysql_query("SELECT * FROM ma_table ORDER BY rand() LIMIT ".$nb_elements);
	while ($row = mysql_fetch_row($requete))   {
		echo $row[0]."<br>";
	}
}

?> 