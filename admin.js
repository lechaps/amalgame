/***********************************A C C U E I L   A D M I N I S T R A T I O N******************************************/
/* Affichage de la page du menu Administration */
function getAdministration()   {
	request("GET", "admin.php?methode=ADMIN_menu" , true, setData);
	
}

/* Gestion du clavier de la mire de connexion (détection de la touche ENTER) */
function setAdminTouch(event)   {
	if (Enter_detector(event))
		getAdminCheck();
}

/* Fonction de validation du login de la partie administration saisi */
function getAdminCheck()   {
	pass=document.getElementById("ACCESS_code").value;
	var arguments = "ACCESS_code=" + pass;
	request("POST", "admin.php?methode=ADMIN_login_check", false, setAdmin_callback, arguments ); /*pas d'AJAX asynchrone, car manipulation sur champ*/
}

/* Test la connection en tant qu'admin*/
function setAdmin_callback(res)  {
	if (res=='ACCES_KO')   {
		$('#DIVshake').effect('pulsate', { times:3 }, 500);
		document.getElementById("ACCESS_code").value="";
		document.getElementById("ACCESS_code").focus();
	}
	else
		setData(res); 
}

/***********************************J O U E U R ******************************************/
/*Obtention de la liste*/
function getJoueurListe()   {
	request("GET", "admin.php?methode=JOUEUR_liste" , true, setData);
}

/*Suppression*/
function setJoueurSupprime(Nojoueur)   {
	if (confirm('Suppression du joueur n°'+Nojoueur))   {
		var arguments = "nojoueur=" + Nojoueur;
		request("POST", "admin.php?methode=JOUEUR_supprime", true, setData, arguments );
	}
}

/*Affiche*/
function setJoueurEdite(Nojoueur)   {
	var arguments = "nojoueur=" + Nojoueur;
	request("POST", "admin.php?methode=JOUEUR_edite", true, setData, arguments );
}

/*Sauvegarde*/
function setJoueurSauvegarde(Nojoueur)   {
	prenom	= document.getElementById("Prenom").value;
	nom		= document.getElementById("Nom").value;
	surnom	= document.getElementById("Surnom").value;
	statut	= document.getElementById("Statut").value;
	var arguments = "nojoueur=" + Nojoueur + "&prenom=" + prenom + "&nom=" + nom + "&surnom=" + surnom + "&statut=" + statut;
	request("POST", "admin.php?methode=JOUEUR_sauvegarde", true, setData, arguments );
}

/*Suppresion d'un mail*/
function setMailSupprime(Idmail, Nojoueur)   {
	if (confirm('Suppression du mail n°'+Idmail))   {
		var arguments = "nojoueur=" + Nojoueur + "&idmail=" + Idmail;
		request("POST", "admin.php?methode=MAIL_supprime", true, setData, arguments );
	}
}

/*Ajoute mail */
function setMailSauvegarde(Nojoueur)   {
	mail	= document.getElementById("mail").value;
	if ((replaceCharacters(mail,' ','')=='') || (!checkEmail(mail)))   {
		alert("Saississez un mail valide !!");
		document.getElementById("mail").focus();
		return false;
	}
	var arguments = "nojoueur=" + Nojoueur + "&mail=" + mail;
	request("POST", "admin.php?methode=MAIL_sauvegarde", true, setData, arguments );
}

/***********************************E L E M E N T******************************************/
/*Obtention de la liste*/
function getElementListe()   {
	request("GET", "admin.php?methode=ELEMENT_liste" , true, setData);
}

/*Suppression*/
function setElementSupprime(Noelement)   {
	if (confirm('Suppression de l\'élement n°'+Noelement))   {
		var arguments = "noelement=" + Noelement;
		request("POST", "admin.php?methode=ELEMENT_supprime", true, setData, arguments );
	}
}

/*Affiche*/
function setElementEdite(Noelement)   {
	var arguments = "noelement=" + Noelement;
	request("POST", "admin.php?methode=ELEMENT_edite", true, setData, arguments );
}

/*Sauvegarde*/
function setElementSauvegarde(Noelement)   {
	lb_element	= document.getElementById("lb_element").value;
	cmt_court	= document.getElementById("cmt_court").value;
	cmt_long	= document.getElementById("cmt_long").value;
	image		= document.getElementById("image").value;
	var arguments = "noelement=" + Noelement + "&lb_element=" + lb_element + "&cmt_court=" + cmt_court + "&cmt_long=" + cmt_long + "&image=" + image;
	request("POST", "admin.php?methode=ELEMENT_sauvegarde", true, setData, arguments );
}


/***********************************Q U E S T I O N******************************************/
/*Obtention de la liste*/
function getQuestionListe()   {
	request("GET", "admin.php?methode=QUESTION_liste" , true, setData);
}

/*Suppression*/
function setQuestionSupprime(Noquestion)   {
	if (confirm('Suppression de la question n°'+Noquestion))   {
		var arguments = "noquestion=" + Noquestion;
		request("POST", "admin.php?methode=QUESTION_supprime", true, setData, arguments );
	}
}

/*Affiche*/
function setQuestionEdite(Noquestion, Quest_datadefault, Rep_datadefault)   {
	var arguments = "noquestion=" + Noquestion;
	request("POST", "admin.php?methode=QUESTION_edite", false, setData, arguments );
	/*var Quest_datadefault = [{value: "21", name: "Mick Jagger"},{value: "43", name: "Johnny Storm"}];*/
	$(function(){
		$("#Question_element").autoSuggest("ajax_element.php", 
			{	
				asHtmlID		: "Question_element",
				minChars		: 2,
				startText 		: "",
				emptyText 		: "Pas de résultat", 
				selectedItemProp: "name", 
				searchObjProps	: "name", 
				formatList		: function(data, elem)	{var new_elem = elem.html('<img src="Image_Element/32x32/'+data.image+'">'+data.name);return new_elem;},
				selectionRemoved: function(elem){ elem.fadeTo("fast", 0, function(){ elem.remove(); });},
				retrieveComplete: function(data){ return data; },
				preFill			: Quest_datadefault
			});
		$("#Reponse_element").autoSuggest("ajax_element.php", 
			{	
				asHtmlID		: "Reponse_element",
				minChars		: 2,
				startText 		: "",
				emptyText 		: "Pas de résultat", 
				selectedItemProp: "name", 
				searchObjProps	: "name", 
				formatList		: function(data, elem)	{var new_elem = elem.html('<img src="Image_Element/32x32/'+data.image+'">'+data.name);return new_elem;},
				selectionRemoved: function(elem){ elem.fadeTo("fast", 0, function(){ elem.remove(); });},
				retrieveComplete: function(data){ return data; },
				preFill			: Rep_datadefault
			});
	});
}



/*Sauvegarde*/
function setQuestionSauvegarde(Noquestion)   {
	question_element= document.getElementById("as-values-Question_element").value;
	reponse_element	= document.getElementById("as-values-Reponse_element").value;
	var arguments = "noquestion=" + Noquestion + "&question_element=" + question_element + "&reponse_element=" + reponse_element;
	request("POST", "admin.php?methode=QUESTION_sauvegarde", true, setData, arguments );
}

/***********************************P A R A M E T R E S******************************************/
/* Affichage des paramètres */
function getParametre()   {
	request("GET", "admin.php?methode=PARAM_liste" , false, setData);
	$(function() {
		$('#A_TITLE_PAGE').tipsy({fade: true, gravity: 's'}); 
		$('#A_CHEMIN_STYLE').tipsy({fade: true, gravity: 's'}); 
		$('#1_STYLE_JQUERY').tipsy({fade: true, gravity: 's'}); 
		$('#A_VERSION').tipsy({fade: true, gravity: 's'}); 
		$('#A_ADMIN').tipsy({fade: true, gravity: 's'}); 
		$('#A_PLAYER_STATUT_0').tipsy({fade: true, gravity: 's'}); 
		$('#A_PLAYER_STATUT_1').tipsy({fade: true, gravity: 's'}); 
		$('#A_PLAYER_STATUT_2').tipsy({fade: true, gravity: 's'}); 
		$('#A_PLAYER_STATUT_3').tipsy({fade: true, gravity: 's'}); 
		$('#A_ADMIN_TENTATIVE').tipsy({fade: true, gravity: 's'}); 
		$('#A_REPONSE_INTERVAL').tipsy({fade: true, gravity: 's'}); 
	});
}

/*Sauvegarde les paramètres*/
function setParametreSauvegarde(Noindice)   {
	TITLE_PAGE		=document.getElementById("TITLE_PAGE").value;
	CHEMIN_STYLE	=document.getElementById("CHEMIN_STYLE").value;
	STYLE_JQUERY	=document.getElementById("STYLE_JQUERY").value;
	VERSION			=document.getElementById("VERSION").value;
	ADMIN			=document.getElementById("ADMIN").value;
	PLAYER_STATUT_0	=document.getElementById("PLAYER_STATUT_0").value;
	PLAYER_STATUT_1	=document.getElementById("PLAYER_STATUT_1").value;
	PLAYER_STATUT_2	=document.getElementById("PLAYER_STATUT_2").value;
	PLAYER_STATUT_3	=document.getElementById("PLAYER_STATUT_3").value;
	ADMIN_TENTATIVE	=document.getElementById("ADMIN_TENTATIVE").value;
	REPONSE_INTERVAL=document.getElementById("REPONSE_INTERVAL").value;
	var arguments = "TITLE_PAGE=" + TITLE_PAGE + "&CHEMIN_STYLE=" + CHEMIN_STYLE + "&STYLE_JQUERY=" + STYLE_JQUERY +  "&VERSION=" + VERSION;
	arguments+="&ADMIN=" + ADMIN + "&PLAYER_STATUT_0=" + PLAYER_STATUT_0 + "&PLAYER_STATUT_1=" + PLAYER_STATUT_1 ;
	arguments+="&PLAYER_STATUT_2=" + PLAYER_STATUT_2 + "&PLAYER_STATUT_3=" + PLAYER_STATUT_3 + "&ADMIN_TENTATIVE=" + ADMIN_TENTATIVE;
	arguments+="&REPONSE_INTERVAL=" +REPONSE_INTERVAL;
	request("POST", "admin.php?methode=PARAM_sauvegarde", true, setData, arguments );
}

/***********************************L O G******************************************/
/* Affichage des LOGS */
function getLOG()   {
	request("GET", "admin.php?methode=LOG_liste" , true, setData);
}

/*Suppresion d'un log*/
function setLOGSupprime(NoLOG)   {
	if (confirm("Suppression du LOG n°"+NoLOG))   {
		var arguments = "nolog=" + NoLOG;
		request("POST", "admin.php?methode=LOG_supprime", true, setData, arguments );
	}
}

/*Purge des logs*/
function setPurgeLOG()   {
	if (confirm("Purge des LOG (hors ceux de priorités 3)"))   {
		request("GET", "admin.php?methode=LOG_purge" , true, setData);
	}
}