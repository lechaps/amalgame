/* Fonction d'affichage de la page de présentation */
function getJeu()   {
	request("GET", "jeu.php?methode=AFFICHE_JEU" , true, setData);
}


/* Gestion du clavier de la mire de connexion (détection de la touche ENTER) */
function setGoTouch(event, noquestion)   {
	if (Enter_detector(event))
		getReponseCheck(noquestion);
}

/* Fonction de validation de la saisie */
function getReponseCheck(noquestion)   {
	reponse=document.getElementById("ACCESS_code").value;
	if (replaceCharacters(reponse, ' ', '')!='') {
		var arguments = "reponse=" + reponse+"&question="+noquestion;
		request("POST", "jeu.php?methode=CHECK", true, setData, arguments );
	}
}