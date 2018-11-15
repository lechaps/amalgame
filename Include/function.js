function replaceCharacters(conversionString,inChar,outChar)   {
  var convertedString = conversionString.split(inChar);
  convertedString = convertedString.join(outChar);
  return convertedString;
}

function checkEmail(email)   {
	var posarobase	= email.indexOf("@");
	var pospoint	= email.lastIndexOf(".");
	var flag		= true;
	if (posarobase == -1)
		flag = false;
	if ((pospoint == -1) || (pospoint < posarobase))
		flag = false;
	return flag;	
}