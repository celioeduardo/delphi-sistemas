if(window.attachEvent){var MS_AddEvent = function(el,strEvent,funcPtr){el.attachEvent('on' + strEvent,funcPtr);}}
else if(window.addEventListener){var MS_AddEvent = function(el,strEvent,funcPtr){el.addEventListener(strEvent,funcPtr,false);}}
if(window.detachEvent){var MS_RemoveEvent = function(el,strEvent,funcPtr){el.detachEvent('on' + strEvent,funcPtr);}}
else if(window.removeEventListener){var MS_RemoveEvent = function(el,strEvent,funcPtr){el.removeEventListener(strEvent,funcPtr);}}
if(document.all){var MS_GetEl = function(id){return document.all[id];}}
else if(document.getElementById){var MS_GetEl = function(id){return document.getElementById(id);}}

function MS_RPCHelper(id)
{
	this.result = null;
	this.xmlDoc = null;
	this.LoadedEvent = function(){}; // reassign to attach event handler
	this.FailedEvent = function(){}; // reassign to attach event handler
	this.maxTime = 5000; // 5 seconds max wait time
	this.startDate = null;
	this.intervalTime = 200;
	this.interval = null;
	this.id = id;
	window[this.id] = this;
	
	this.CheckNode = function()
	{
		try
		{
			if(this.xmlDoc.readyState == 4)
			{ 
				window.clearInterval(this.interval);
				this.result = this.xmlDoc.getElementsByTagName('content')[0].childNodes[0].nodeValue;
				this.xmlDoc = null;
				this.LoadedEvent();
			}
			else
			{
				var currentTime = new Date();
				if(currentTime.getTime() - this.startDate.getTime() >= this.maxTime)
				{
					this.xmlDoc = null;
					window.clearInterval(this.interval);
					this.FailedEvent();
				}
			}
		}
		catch(e){}
	}
	this.MakeRequest = function(url)
	{
		this.startDate = new Date();
		try
		{
			if(window.ActiveXObject)
			{
				this.interval = window.setInterval(this.id + '.CheckNode()',this.intervalTime);
				this.xmlDoc = this.GetDomDocument();
			}
			else if(document.implementation && document.implementation.createDocument)
			{
				this.xmlDoc = document.implementation.createDocument("","doc",null);
				var obj = this;
				this.xmlDoc.onload = function()
				{
					try
					{
						obj.result = obj.xmlDoc.getElementsByTagName('content')[0].childNodes[0].nodeValue;
						obj.xmlDoc = null;
						obj.LoadedEvent();
					}
					catch(e)
					{
						obj.xmlDoc = null;
						obj.FailedEvent();
					}
				}
			}
			this.xmlDoc.load(url);
			
			// delay 0.5 sec			
			var today = new Date();
			var now = today.getTime();
			while(1)
			{
				var today2 = new Date();
				var now2 = today2.getTime();
				if((now2 - now) > 500 || (this.xmlDoc.readyState == 4))
					return;
			}
		}
		catch(e){}
	} 
	this.GetDomDocument = function()
	{	
		var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
		for(var i = 0; i < prefixes.length; i++)
		{
			try
			{
				var xmlDomDoc = new ActiveXObject(prefixes[i] + ".DomDocument");
				return xmlDomDoc;
			}
			catch(e){}
		}
	}
}
function OutputEncoder_EncodeUrl(strInput)
{
	if(typeof(strInput) == 'undefined'){return "";}
	strInput = strInput.toString();
	var c;
	var EncodeUrl = '';
	for(var cnt = 0; cnt < strInput.length; cnt++)
	{
		c = strInput.charCodeAt(cnt);
		if(((c > 96) && (c < 123)) || ((c > 64) && (c < 91)) || ((c > 47) && (c < 58)) || (c == 46) || (c == 45) || (c == 95)){EncodeUrl = EncodeUrl + String.fromCharCode(c);}
		else if(c > 127){EncodeUrl = EncodeUrl + '%u' + OutputEncoder_TwoByteHex(c);}
		else{EncodeUrl = EncodeUrl + '%' + OutputEncoder_SingleByteHex(c);}
	}
	return EncodeUrl;
}
function OutputEncoder_EncodeHtmlAttribute(strInput)
{
	var c;
	var EncodeHtmlAttribute = '';
	for(var cnt = 0; cnt < strInput.length; cnt++)
	{
		c = strInput.charCodeAt(cnt);
		if((( c > 96) && (c < 123)) || (( c > 64) && (c < 91)) || (( c > 47) && (c < 58)) || (c == 46) || (c == 44) || (c == 45) || (c == 95)){EncodeHtmlAttribute = EncodeHtmlAttribute + String.fromCharCode(c);}
		else{EncodeHtmlAttribute = EncodeHtmlAttribute + '&#' + c + ';';}
	}
	return EncodeHtmlAttribute;
}
function OutputEncoder_SingleByteHex(charC)
{
	var SingleByteHex = charC.toString(16);
	for(var cnt = SingleByteHex.length; cnt < 2; cnt++){SingleByteHex = "0" + SingleByteHex;}
	return SingleByteHex;
}
function OutputEncoder_TwoByteHex(charC)
{
	var TwoByteHex = charC.toString(16);
	for(var cnt = TwoByteHex.length; cnt < 4; cnt++){TwoByteHex = "0" + TwoByteHex;}
	return TwoByteHex;
}
function MS_QueryString() //NOTE: use lowercase keys to access values
{
	var qs = document.location.search.toString();
	if(qs.length > 0){qs = qs.substring(1);}
	var pairs = qs.split('&');
	for(var i = 0; i < pairs.length; i++)
	{
		var pair = pairs[i].split('=');
		if(pair.length != 2){continue;}
		if(pair[1] == ''){continue;}
		try
		{
			var key = decodeURI(pair[0]).toLowerCase();
			var value = decodeURI(pair[1]);
		}
		catch(e)
		{
			var key = unescape(pair[0]).toLowerCase();
			var value = unescape(pair[1]);
		}
		if(this[key]){this[key] += ', ' + value;}
		else{this[key] = value;}
	}
}
var queryString = new MS_QueryString();
function GetModifiedQueryString(key, value)
{
	var qsCopy = new Object;
	for(var i in queryString){qsCopy[i] = queryString[i];}
	qsCopy[key] = value;
	var strQs = '';
	for(var i in qsCopy){strQs += OutputEncoder_EncodeUrl(i) + '=' + OutputEncoder_EncodeUrl(qsCopy[i]) + '&';}
	return '?' + strQs;
}
function fetchcookieval(key)
{
   var cookiename;
   var cookieval;
   var keyfound = false;
   var cookiearray = document.cookie.split(';')
   for(var i=0;i<cookiearray.length;i++){
      cookiename = cookiearray[i].substring(0, cookiearray[i].indexOf('='));
      if(cookiename.charAt(0) == ' ') cookiename = cookiename.substring(1, cookiename.length);
      cookieval = cookiearray[i].substring(cookiearray[i].indexOf('=')+1, cookiearray[i].length);
      if(key == cookiename){keyfound = true; break;}
   }
   if(keyfound){return cookieval;}
   else{return 'blank';}
}
function setcookieval(key, val)
{  
	var d = new Date();
	d.setFullYear(d.getFullYear() + 1);	
	var localdomain = document.domain;
	if((typeof(gCookieDomain) != 'undefined') && (gCookieDomain != null) && (gCookieDomain != '')){localdomain = gCookieDomain;}
	if(localdomain.indexOf(".com") > -1){document.cookie = key+'='+val+'; expires=' + d.toGMTString() + '; Domain=' + localdomain  + '; path=/';}
	else{document.cookie = key+'='+val+'; expires=' + d.toGMTString() + '; path=/';}
}
function srch_setcookieval(key, val)
{
	var localdomain = document.domain;
	if((typeof(gCookieDomain) != 'undefined') && (gCookieDomain != null) && (gCookieDomain != '')){localdomain = gCookieDomain;}
	if(localdomain.indexOf('.com') > -1){document.cookie = key+'='+val+'; Domain='+localdomain+'; path=/';}
	else{document.cookie = key+'='+val+'; path=/';}
}
function UnicodeFixup(s)
{
	var result = new String();
	var c = '';
	var i = -1; 
	var l = s.length;
	result = '';
	for(i = 0; i<l; i++)
	{
		c = s.substring(i, i+1);
		if(c == '%')
		{
			result += c; i++;
			c = s.substring(i, i+1);
			if(c != 'u')
			{
				if(parseInt('0x' + s.substring(i, i+2)) > 128){result += 'u00';}
			}
		}
		result += c;
	}
	return result;
}
// Function to check for external links to be opened in the new window.
var g_reSupportedHostnames;
function ForeignLink_Hookup(branding)
{
	if(typeof(branding) == 'undefined'){branding = 'true';}

	var eCurrentAnchor = null;
	for(var i=0; i < document.links.length; i++)
	{
		eCurrentAnchor = document.links[i];
		//consider only those having a URL protocol prefix
		if(eCurrentAnchor.protocol == ('http:' || 'https:'))
		{ 
			//test to see if foreign
			if(!branding && ((eCurrentAnchor.href.indexOf(document.domain) > -1) || (eCurrentAnchor.href.substring(0,1) == '/')) && (eCurrentAnchor.href.toLowerCase().indexOf('fr=1') < 0)) 
			{	
				if(eCurrentAnchor.href.indexOf('?') > -1){eCurrentAnchor.href = eCurrentAnchor.href + '&FR=1';}
				else{eCurrentAnchor.href = eCurrentAnchor.href + '?FR=1';}
			}					
			if(!g_reSupportedHostnames.exec(eCurrentAnchor.hostname) || (!branding && eCurrentAnchor.href.indexOf(document.domain) < 0))
			{ 
				eCurrentAnchor.target = '_blank'; // open in new window when it is off microsoft.com, or if it is not support.microsfot.com and fr=1
			}
		}
	} //for each anchor
	if(!branding)
	{
		if(document.getElementsByName)
		{
			var eForms = null;
			for(var i = 0; i<document.forms.length ; i++)
			{
				eCurrentForm = document.forms[i];
				if((eCurrentForm.action.indexOf(document.domain) > -1) || (eCurrentForm.action.substring(0,1) == '/'))
				{
					if(!eCurrentForm.FR)
					{
						var elm = document.createElement('input');
						elm.type = 'hidden';
						elm.name = 'FR';
						elm.id = 'FR';
						elm.value = '1';
						eCurrentForm.appendChild(elm);
					}
				}
			}
		}
	}
}
function MS_PageToolsData()
{
	this.savingMsg = 'Saving Favorites';
	this.connectionErrorMsg = 'Cannot Connect';
	this.savedMsg = 'Favorites Saved';
	this.noSaveErrorMsg = 'Cannot Save';
	this.closeMsg = 'Close';
	this.noCookieUrl = '/gp/nocookies/';
	this.surveyUrl = '';
	this.disableSaveToFavorites = false;
	function getObjectId()
	{
		var i = 0;
		while(true)
		{
			if(!eval('window.SaveToFavoritesData' + i)){return 'SaveToFavoritesData' + i;} 
			i++;
		}
	}
	this.id = getObjectId();
	window[this.id] = this;
	this.PrintPage = function()
	{
		this.objStatsDotNet.printUsed = true;
		try{window.print();}catch(e){}
		return false;
	}
	this.EmailPage = function(el)
	{
		this.objStatsDotNet.emailUsed = true;
		return true;
	}
	this.SaveToFavorites = function(el)
	{
		if(this.disableSaveToFavorites){return false;}
		this.objStatsDotNet.saveUsed = true;
		if(!navigator.cookieEnabled)
		{
			el.href = document.location.protocol + '//' + document.location.hostname + this.noCookieUrl;
			return true;
		}
		this.objSaveFavoritesWindow.loadingMessage = this.savingMsg;
		this.objSaveFavoritesWindow.cannotLoadMessage = this.connectionErrorMsg;
		this.objSaveFavoritesWindow.successMessage = this.savedMsg;
		this.objSaveFavoritesWindow.errorMessage = this.noSaveErrorMsg;
		this.objSaveFavoritesWindow.closeMessage = this.closeMsg;
		var params = '';
		if(!window.PersonalizationInfo){window.PersonalizationInfo='';}
		params = window.PersonalizationInfo;
		this.objSaveFavoritesWindow.iframeUrl = document.location.protocol + '//' + document.location.hostname + '/Common/Personalize.aspx?PersonalizationInfo=' + params;
		this.objSaveFavoritesWindow.responseSuccess = 'success';
		this.objSaveFavoritesWindow.responseFailure = 'failure';
		this.objSaveFavoritesWindow.functionToExecuteOnLoad = 
			function()
			{
				var td = MS_GetEl('SaveToMySupportFavorites_tr').childNodes[0];
				td.style.visibility = 'hidden';
			};
		this.objSaveFavoritesWindow.functionToExecuteOnUnLoad = 
			function()
			{
				var td = MS_GetEl('SaveToMySupportFavorites_tr').childNodes[0];
				td.style.width = td.offsetWidth;
				td.style.height = td.offsetHeight;
				td.style.visibility = 'visible';
				td.style.verticalAlign = 'top';
				var img = MS_GetEl('SaveToMySupportFavorites_i');
				img.href = '';
				img.style.cursor = 'text';
				var i = 0;
				var SaveToFavObj = null;
				while(true)
				{
					if(eval('window.SaveToFavoritesData' + i))
					{
						SaveToFavObj = eval('window.SaveToFavoritesData' + i);
						break;
					} 
					i++;
					if(i > 100){break;}
				} 	
				if(!SaveToFavObj){return;}
				var link = MS_GetEl('SaveToMySupportFavorites');
				link.width = link.offsetWidth;
				link.height = link.offsetHeight;
				link.href = '';
				link.style.textDecoration = 'none';
				link.style.cursor = 'text';
				link.style.color = 'black';
				link.innerHTML = SaveToFavObj.objSaveFavoritesWindow.finalMessage;
				SaveToFavObj.disableSaveToFavorites = true;
			};

		this.objSaveFavoritesWindow.parentObj = MS_GetEl('SaveToMySupportFavorites_tr').childNodes[0];
		this.objSaveFavoritesWindow.Load();

		return false;
	}
	this.GoToFavorites = function(el)
	{
		if(!navigator.cookieEnabled){el.href = document.location.protocol + '//' + document.location.hostname + this.noCookieUrl;}
		return true;
	}
	this.SendFeedback = function(el)
	{
		if(MS_GetEl('fmsSurvey')){window.scrollBy(0,50000);}
		else{window.open(this.surveyUrl, '_blank', 'resizable=yes,scrollbars=yes,menubar=no,location=no,toolbar=no,status=no,left=0,top=0,height=500,width=725');}
		return false;
	}
}
function MS_StatusWindow()
{
	this.statusTimeout = null;
	this.intervalTime = 800;
	this.id = getObjectId();
	this.idMessage = this.id + '_message';
	this.idStatus = this.id + '_status';
	this.loadingMessage = 'loading';
	this.cannotLoadMessage = 'cannot load';
	this.successMessage = 'success';
	this.errorMessage = 'failure';
	this.closeMessage = 'close';
	this.finalMessage = '';
	this.iframe = this.id + '_Iframe';
	this.loadingBackground = '#353599';
	this.responseSuccess = 'success';
	this.responseFailure = 'failure';
	this.iframeUrl = '';
	this.numberOfStatusBars = 10;
	this.hiddenElements = new Array();
	this.functionToExecuteOnLoad = null;
	this.functionToExecuteOnUnLoad = null;
	this.parentObj = null;
	this.parentInnerHtml = null;
	
	this.RPCHelper = new MS_RPCHelper('RPC1');
	
	function getObjectId()
	{
		var i = 0;
		while(true)
		{
			if(!eval('window.floatWindow' + i)){return 'floatWindow' + i;}
			i++;
		}
	}
	window[this.id] = this;
	this.Load = function()
	{
		var longestMessage = this.loadingMessage;
		if(longestMessage.length < this.cannotLoadMessage.length){longestMessage = this.cannotLoadMessage;}
		if(longestMessage.length < this.successMessage.length){longestMessage = this.successMessage;}
		if(longestMessage.length < this.errorMessage.length){longestMessage = this.errorMessage;}
		var floatInnards = 
			'<div class="message" id="'+ this.idMessage +'">' + longestMessage + '</div>' +
			'<table cellpadding="0" cellspacing="0" width="100%" border="0"><tr><td align="center">' + 
			'<table id="' + this.idStatus + '" class="status"><tr>';
		for(var i = 0; i < this.numberOfStatusBars; i++){floatInnards += '<td id="'+ this.id +'_col'+ i +'">&nbsp;</td>';}
			floatInnards += '</tr></table></td></tr></table>';
		if(!MS_GetEl(this.id))
		{
			var newEl = '<div class="floatWindow" id="'+ this.id +'"></div>';
			this.parentObj.width = this.parentObj.offsetWidth;
			this.parentObj.height = this.parentObj.offsetHeight;
			this.parentObj.innerHTML = newEl + this.parentObj.innerHTML;
		}
		try
		{
			MS_GetEl(this.id).innerHTML = floatInnards;
			var el = MS_GetEl(this.id);
			if(this.parentObj)
			{
				el.style.top = this.getTop(this.parentObj);
				if(this.parentObj.offsetHeight < el.offsetHeight)
				{
					this.parentObj.style.height = el.offsetHeight;
				}
			}
			var messageEl = MS_GetEl(this.idMessage);
			messageEl.innerHTML = this.loadingMessage;
			el.style.display = 'block';
			this.RPCHelper.MakeRequest(this.iframeUrl);
			this.FadeIn();
			this.statusTimeout = window.setTimeout(this.id + '.Update(0,true)',this.intervalTime);
			if(this.functionToExecuteOnLoad != null){this.functionToExecuteOnLoad();}
		}
		catch(e)
		{
			window.setTimeout(this.id + '.Load()',this.intervalTime);
		}
	}
	this.getTop = function(el)
	{
		var yPos = el.offsetTop;
		var tempEl = el.offsetParent;
		while (tempEl != null)
		{
			yPos += tempEl.offsetTop;
			tempEl = tempEl.offsetParent;
		}
		return yPos; 
	}
	this.SetStatus = function(blnSuccess)
	{
		if(this.statusTimeout){window.clearTimeout(this.statusTimeout);}
		if(blnSuccess)
		{
			for(var i = 0; i < this.numberOfStatusBars; i++){MS_GetEl(this.id + '_col' + i).style.background = this.loadingBackground;}
			window.setTimeout('MS_GetEl(\''+ this.idMessage +'\').innerHTML = \''+ this.successMessage +'\';',this.intervalTime);
			window.setTimeout('MS_GetEl(\''+ this.idStatus +'\').style.visibility = \'hidden\';',this.intervalTime);	
			this.statusTimeout = window.setTimeout(this.id + '.FadeOut()',this.intervalTime + 400);
			window.setTimeout(this.id + '.StopWindow()',this.intervalTime + 600);
			this.finalMessage = this.successMessage;
		}
		else
		{
			this.StopTime();
			window.setTimeout('MS_GetEl(\''+ this.idMessage +'\').innerHTML = \'<span style="error">'+ this.errorMessage +'</span>\';',this.intervalTime);
			window.setTimeout('MS_GetEl(\''+ this.idStatus +'\').style.display = \'none\';',this.intervalTime);
			this.statusTimeout = window.setTimeout(this.id + '.FadeOut()',this.intervalTime + 400);
			window.setTimeout(this.id + '.StopWindow()',this.intervalTime + 600);
			this.finalMessage = this.errorMessage;
		}
	}
	this.StopWindow = function()
	{
		try
		{
			if(this.functionToExecuteOnUnLoad != null){this.functionToExecuteOnUnLoad();}
		}
		catch(e){}
	}
	this.Update = function(i, callTimeout)
	{
		var el = MS_GetEl(this.id + '_col' + i);
		var badEl = false;
		badEl = (i >= this.numberOfStatusBars);
		if(badEl)
		{
			if(i < this.numberOfStatusBars)
			{
				MS_GetEl(this.idMessage).innerHTML = '<span class="error">' + this.errorMessage + '</span>';
				this.finalMessage = this.errorMessage; 
			}
			else
			{
				MS_GetEl(this.idMessage).innerHTML = '<span class="error">' + this.cannotLoadMessage + '</span>';
				this.finalMessage = this.cannotLoadMessage;
			}
			MS_GetEl(this.idStatus).style.display = 'none';
			return;
		}
		try
		{
			if(this.RPCHelper.result)
			{
				if(this.RPCHelper.result.indexOf(this.responseSuccess) > -1){this.SetStatus(true);}
				else{this.SetStatus(false);}
				return;
			}
		}
		catch(e){}
		var intStatus = i - 1;
		for(var j = 0; j < intStatus; j++){MS_GetEl(this.id + '_col' + j).style.background = this.loadingBackground;}
		if(callTimeout){this.statusTimeout = window.setTimeout(this.id + '.Update('+ (i+1) + ',true)',this.intervalTime);}
	}
	this.ToggleFade = function(blnFadeIn)
	{
		var style1 = (blnFadeIn) ? 'hidden' : 'visible';
		var style2 = (blnFadeIn) ? 'visible' : 'hidden';
		var el = MS_GetEl(this.id);
		el.style.visibility = style1;
		if(!document.all)
		{
			el.style.visibility = style2;
			return;
		}
		try
		{
			el.filters[0].apply();
			el.style.visibility = style2;
			el.filters[0].play();
		}
		catch(e)
		{
			el.style.visibility = style2;
		}
	}
	this.FadeOut = function() {this.ToggleFade(false);}
	this.FadeIn = function() {this.ToggleFade(true);}
	this.StopTime = function()
	{
		if(this.statusTimeout){window.clearInterval(this.statusTimeout);}
	}
}
function SwitchLanguage()
{
	var scid = document.frmArticleTrans.scid.value.split(';');
	if(scid.length != 3){return true;}
	var type = scid[0];
	var ln = scid[1];
	var id = scid[2];
	document.location = document.location.protocol + '//' + document.location.hostname + '/' + type + '/' + id + '/' + ln;
	return false;
}
function MS_StatsDotNet()
{
	this.startDate = new Date();
	this.iframe = 'ClickTrackWindow';
	this.disabled = true;
	this.host = 'about:blank';
	this.printUsed = false;
	this.saveUsed = false;
	this.emailUsed = false;
	this.reCleanId = /[^0-9]*/i;
	this.eventCollectionId = 0;
	var scid = '';
	var path = '';
	if(document.location.pathname){path = document.location.pathname.toString();}
	this.url = path;
	this.dwellTime = 0;
	this.refUrl = '';
	if(document.referrer && document.referrer!=''){this.refUrl = document.referrer.toString();}
	this.CleanId = function(str)
	{
		try {return str.replace(this.reCleanId,'');}
		catch(e){}
		return '';
	}
	this.LogToStatsNet = function()
	{
		var ltsUrl = this.host + '?l=' + OutputEncoder_EncodeUrl(
		OutputEncoder_EncodeUrl(this.siteId) + '&' + 
		OutputEncoder_EncodeUrl(this.siteLcId) + '&' + 
		OutputEncoder_EncodeUrl(this.eventCollectionId) + '&' + 
		OutputEncoder_EncodeUrl(this.url) + '&' + 
		OutputEncoder_EncodeUrl(this.contentType) + '&' + 
		OutputEncoder_EncodeUrl(this.contentLn) + '&' + 
		OutputEncoder_EncodeUrl(this.contentId) + '&' + 
		this.CleanId(this.exitLinkId) + '&' + 
		this.CleanId(this.exitContainerId) + '&' + 
		OutputEncoder_EncodeUrl(this.dwellTime) + '&' + 
		OutputEncoder_EncodeUrl(this.browserWidth) + '&' + 
		OutputEncoder_EncodeUrl(this.browserHeight) + '&' + 
		OutputEncoder_EncodeUrl(this.siteBrandId) + '&' + 
		OutputEncoder_EncodeUrl(this.refUrl) + '&' + 
		this.CleanId(this.searchCategoryId + "") + '&' + 
		OutputEncoder_EncodeUrl(this.searchCategoryLinkPos) + '&' + 
		OutputEncoder_EncodeUrl(this.searchPageLinkPos) + '&' +
		OutputEncoder_EncodeUrl(this.optionalCollectionId) + '&' +
		OutputEncoder_EncodeUrl(this.gdsContentId) + '&' +
		OutputEncoder_EncodeUrl(this.flexId) + '&' +
		OutputEncoder_EncodeUrl(this.flexValue1) + '&' +
		OutputEncoder_EncodeUrl(this.flexValue2) + '&' +
		OutputEncoder_EncodeUrl(this.flexValue3) + '&' +
		OutputEncoder_EncodeUrl(this.flexValue4) + '&' +
		OutputEncoder_EncodeUrl(this.flexValue5));
		try
		{
			var RPCHelper = new MS_RPCHelper();
			RPCHelper.MakeRequest(ltsUrl);
		}
		catch(e){}
	}
	this.LogPageExit = function()
	{
		this.endDate = new Date();
		this.dwellTime = this.endDate.getTime() - this.startDate.getTime();
		if(this.printUsed){this.eventCollectionId += 4;}
		if(this.emailUsed){this.eventCollectionId += 8;}
		if(this.saveUsed){this.eventCollectionId += 16;}
		
		if(this.contentType != "STAT")
		{	
			this.url += '?scid=' + this.contentType + ';' + this.contentLn + ';' + this.contentId;
		}
		else 
		{
			this.url += document.location.search;
		}			
		this.LogToStatsNet();
	}
	this.SetExitLinks = function(e)
	{	
		var srcEl = null;
		if(typeof(event)!="undefined"){srcEl = event.srcElement;}else{srcEl = e.target;}
		var elId = null;
		var parentId = null;
		if(!srcEl){return;}
		if(!srcEl.tagName){return;}
		if(srcEl.tagName.toUpperCase() != 'A'){return;}
		if(!srcEl.href){return;}
		if(srcEl.href.indexOf('javascript:') > -1){return;}
		if(srcEl.href.indexOf('mailto:') > -1){return;}
		if(srcEl.id){this.exitLinkId = srcEl.id;}
	}
	this.TrackSearch = function(searchCategoryId, searchCategoryLinkPos, searchPageLinkPos)
	{
		this.searchCategoryId = searchCategoryId;
		this.searchCategoryLinkPos = searchCategoryLinkPos;
		this.searchPageLinkPos = searchPageLinkPos;
	}
	this.GetCookieIncrement = function()
	{
		var cookieKey = 'sdninc';
		var inc = fetchcookieval(cookieKey);
		if(inc == 'blank'){inc = '0';}
		inc = parseInt(inc);
		inc += 1;
		document.cookie = cookieKey + '=' + inc + '; path=/;';
		return inc;
	}
}
var StatsDotNet = new MS_StatsDotNet();
StatsDotNet.flexValue5 = StatsDotNet.GetCookieIncrement();
var SaveFavoritesWindow = new MS_StatusWindow();
var SaveToFavoritesData = new MS_PageToolsData();
SaveToFavoritesData.objStatsDotNet = StatsDotNet;
SaveToFavoritesData.objSaveFavoritesWindow = SaveFavoritesWindow;
function MS_HandleClick(el, containerId, recordHit)
{
	if(!el.id || el.id == ''){return true;}
	var id = el.id.replace('_i', '');
	if(recordHit)
	{
		StatsDotNet.exitLinkId = id;
		StatsDotNet.exitContainerId = containerId;
	}
	switch(id)
	{
		case 'PrintPage' : return SaveToFavoritesData.PrintPage();
		case 'EmailPage' : return SaveToFavoritesData.EmailPage(el);
		case 'SaveToMySupportFavorites' : return SaveToFavoritesData.SaveToFavorites(el);
		case 'MySupportFavoritesLink' : return SaveToFavoritesData.GoToFavorites(el);
		case 'SendFeedback' : return SaveToFavoritesData.SendFeedback(el);
	}
	if(el.id.indexOf('oas_') == 0)
	{
		el.href = MS_OASURL + GetModifiedQueryString('gprid',el.id.replace('oas_',''));
		var pos = el.href.toLowerCase().indexOf("target=assistance");
		if (pos > 0)
		{
			var end = pos + 17;
			if (el.href.charAt(pos-1) == '&')
				pos = pos - 1;
			el.href = el.href.substring(0, pos) + el.href.substring(end, el.href.length);						
		}
	}
	var indexOfPSMore = el.href.indexOf('GSSProdSelMore');
	if( indexOfPSMore > 0){		
		var end = el.href.indexOf('&', indexOfPSMore);
		if (end < 0) end = el.href.length;
		var c1ID = el.href.substring(indexOfPSMore+14, end);
		el.href = '/select/default.aspx' + GetModifiedQueryString('c1',c1ID);
	}
	return true;
}
function MS_WebMetrix(sUrl)
{
	if(typeof(sUrl) != 'undefined')
	{
		var cv;
		var dg = '';
		var p1 = 'guid=';
		var p2 = '&guid=';
		var gl = 32;
		cv = fetchcookieval('MC1').toLowerCase();
		if(cv == 'blank' || cv == ''){cv = fetchcookieval('MC2').toLowerCase();}
		if(cv != 'blank' && cv != '')
		{
			if(cv.substr(0,p1.length) == p1){dg = cv.substr(p1.length, gl);}
			else if(cv.indexOf(p2) > -1){dg = cv.substr(cv.indexOf(p2) + p2.length, gl);}
		}
		sUrl = sUrl + '&msid=' + dg;
		MS_GetEl('webmetriximg').src = sUrl;
	}
}
function MS_WindowOnload()
{
	if(typeof(window.innerWidth) == 'number')
	{
		StatsDotNet.browserWidth = window.innerWidth;
		StatsDotNet.browserHeight = window.innerHeight;
	}
	else if(document.documentElement &&
	(document.documentElement.clientWidth || document.documentElement.clientHeight))
	{
		StatsDotNet.browserWidth = document.documentElement.clientWidth;
		StatsDotNet.browserHeight = document.documentElement.clientHeight;
	}
	else if(document.body && (document.body.clientWidth || document.body.clientHeight))
	{
		StatsDotNet.browserWidth = document.body.clientWidth;
		StatsDotNet.browserHeight = document.body.clientHeight;
	}
}
function MS_DocumentOnClick(e)
{
	if(!StatsDotNet.disabled)
	{
		StatsDotNet.SetExitLinks(e);
	}
}
function MS_WindowOnUnload()
{
	if(!StatsDotNet.disabled)
	{
		StatsDotNet.LogPageExit();
	}
}
MS_AddEvent(window,'load',MS_WindowOnload);
MS_AddEvent(window,'unload',MS_WindowOnUnload);
MS_AddEvent(document,'click',MS_DocumentOnClick);
function mhHover(tbl, idx, cls)
{
	var t, d;
	t = MS_GetEl(tbl);
	if(t == null){return;}
	if(t.getElementsByTagName){d = t.getElementsByTagName('TD');}
	else{d = t.all.tags('TD');}
	if(d == null){return;}
	if(d.length <= idx){return;}
	d[idx].className = cls;
}
function setMSResearch()
{
	var time = new Date();
	if(document.cookie.indexOf( 'msresearch=1 ') == -1){document.cookie = 'msresearch=' + time.getTime() + ':' + escape( document.location) + ':' + escape( document.referrer) + '; path=/; domain=.microsoft.com; ';}
}
function footerjs(doc)
{
	if(doImage == null)
	{
		var tt = (TType == null) ? 'PV' : TType;
		doc.write('<layer visibility="hide"><div style="display:none"><img src="' + document.location.protocol +'//c.microsoft.com/trans_pixel.asp?source=localhost&TYPE=' + tt + '&p=MNPGenerator" width=0 height=0 hspace=0 vspace=0 border=0 /></div></layer>');
	}

	if((document.cookie.indexOf('msresearch=1 ') == -1) 
		(document.cookie.indexOf('msresearch=') != -1)){setInterval('setMSResearch()', 1000);}
}
function SubmitSettingChanges(TypeID)
{
	document.forms[TypeID + 'Form'].submit();
}
function SaveDiscussionSettings()
{
	MS_GetEl('SaveSettings').value = 'true';
	document.forms['DiscussionSettings'].submit();
}
function ValidateEmail(s)
{
	if(s.length == 0){return true;}
	var r1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;	// not valid
	var r2 = /^([\w-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])$|(([\w-]+\.)+)([a-zA-Z]{2,4}))$/;	// valid
	return (!r1.test(s) && r2.test(s));
}
function NotifySave()
{
	var notifySave;
	notifySave = MS_GetEl("NotifySave");
	if(notifySave!=null){alert(notifySave.value);}
}
function ReturnToMySettings()
{
	window.location.href = '/personalization/mydisplaysettings.aspx';
}
function SetButtonStatue()
{
	var sections = 'myhelprequests;myproductdownloads;myproductnews;mysupportfavorites;mynewsgroupdiscussions;mykbarticles'.split(';');
	
	for(i=0;i<sections.length;i++)
	{
      if (MS_GetEl(sections[i]+ '_o') &&
         document.getElementsByName(sections[i] + '_v') &&
        (MS_GetEl(sections[i] + '_o').value != (document.getElementsByName(sections[i] + '_v')[0].checked?'1':'0')))
		{
			MS_GetEl('UpdateMyDisplaySetting').disabled=false;
			return;
		}
	}
	MS_GetEl('UpdateMyDisplaySetting').disabled=true;
}
function SelectAllItems(TypeID)
{
	var i;
	var threadItem;
	i = 0;
	do
	{
		threadItem = MS_GetEl(TypeID + '_' + i);
		if(threadItem!=null)
		{
			threadItem.checked = event.srcElement.checked;
			i++;
		}
	}while(threadItem!=null)
}
function DeselectFirst(TypeID)
{
	var firstItem = MS_GetEl(TypeID + '_' + "All");
	if(firstItem && firstItem.checked){firstItem.checked = false;}
}
function MyDisplaySettingsCancel()
{
	var confirmCancelPrompt;
	confirmCancelPrompt = MS_GetEl('ConfirmCancel');
	if(confirmCancelPrompt && !MS_GetEl('UpdateMyDisplaySetting').disabled)
	{
		if(window.confirm(confirmCancelPrompt.value) != true){return false;}
	}
	if(document.referrer.length > 0 && document.location.href != document.referrer)
	{
		document.location = document.referrer;
		return false;
	}
	else
	{
		if(MS_GetEl('BackUrl').value.length > 0){document.location = MS_GetEl('BackUrl').value;}
		else{window.location.href = window.location.href;}
		return false;
	}
}
function MyDisplaySettingsSave()
{
	if(document.referrer.length > 0 && document.location.href != document.referrer){MS_GetEl('BackUrl').value = document.referrer;}
	else{MS_GetEl('BackUrl').value = document.location.href;}
	document.forms['MySettingsForm'].submit();
}
function MNPResizeFix()
{
	MS_AddEvent(window,'resize',resizer);
	resizer();
}
function resizer()
{
	var mainContent = MS_GetEl('WebContentArea');// if it is webcontent, then use webcontent first
	var webcontentAdjust = 0;
	if(mainContent == null){mainContent = MS_GetEl('contentArea');}
	else{webcontentAdjust = 1;}
	var mastheadHeight, footerHeight, topRowHeight, mainRowHeight, bottomRowHeight, mContentHeight;
	mastheadHeight = footerHeight = topRowHeight = mainRowHeight = bottomRowHeight = mContentHeight = 0;
	try{mastheadHeight = MS_GetEl('msviMasthead').offsetHeight;}
	catch(e){mastheadHeight = 0}
	try{footerHeight = (MS_GetEl('msviFooter').offsetHeight);}
	catch(e){footerHeight = 0}
	var usedHeight = (mastheadHeight + footerHeight);
	var oBodyHeight = document.body.offsetHeight;
	var cBodyHeight = document.body.clientHeight;
	var sBodyHeight = document.body.scrollHeight;
	try{topRowHeight = MS_GetEl('topRow').offsetHeight;}
	catch(e){topRowHeight = 0}
	try{mainRowHeight = MS_GetEl('mainRow').offsetHeight;}
	catch(e){mainRowHeight = 0}
	try{bottomRowHeight = MS_GetEl('bottomRow').offsetHeight;}
	catch(e){bottomRowHeight = 0}
	try{mContentHeight = mainContent.offsetHeight;}
	catch(e){mContentHeight = 0}
	var oHeight = (mContentHeight + usedHeight)
	var bodyHeight = Math.max(Math.max(oBodyHeight, oHeight), sBodyHeight, cBodyHeight);
	if(mainContent){mainContent.style.height = Math.max(mContentHeight, (bodyHeight - usedHeight)) - 5;}
	if(webcontentAdjust == 1)
	{
		try{webcontentAdjust = mainContent.offsetHeight - MS_GetEl('contentArea').offsetHeight;}
		catch(e){webcontentAdjust = 0;}
	}
	try{MS_GetEl('mainRow').style.height = (mainContent.offsetHeight - topRowHeight - bottomRowHeight - webcontentAdjust - 7);}
	catch(e){}
	
	try{
		fixW = MS_GetEl('widthFix')
		var tempW = fixW.offsetWidth;
		fixW.style.fontSize = '0px';
		fixW.style.width = tempW;
	}
	catch(e){}
}
MS_AddEvent(window,'load',hideBar);
function hideBar()
{
	try
	{
		if((top != self) && (top.location.href.indexOf('newsgroups') > 0))
		{
			try{MS_GetEl('msviMasthead').style.display = 'none';}
			catch(e){}
			try{
				MS_GetEl('msviFooter').style.display = 'none';
				document.body.getElementsByTagName('td')[document.body.getElementsByTagName('td').length-1].style.display = 'none';
			}
			catch(e){}
			try{
				var formCollection = document.getElementsByTagName('form');
				for(var i = 0; i < formCollection.length; i++)
				{
					var forms = formCollection[i];
					if((forms.target == '') || (forms.target == '_parent')){forms.target = '_top';}
				}
			}
			catch(e){}
			try{
				var linkCollection = document.getElementsByTagName('a');
				for(var i = 0; i < linkCollection.length; i++)
				{
					var link = linkCollection[i];
					if((link.target == '' || link.target == '_parent') && !(link.id=="LCmore" || link.id=="LCback")){link.target = '_top';}
				}
			}
			catch(e){}
			top.document.title = self.document.title;
		}
	}
	catch(e){}
	
}
/* search */
function InitASrch(state)
{
	var elem;
	// Initalize query box
	elem = document.frmaSrch.query;
	// Netscape 6.x fix for textboxes
	if((elem.value == "") && (navigator.userAgent.indexOf("Netscape6") > 0))
	{
		elem.value = " ";
		elem.value = "";
	}
	tval = (queryString['query']) ? queryString['query'] : '';
	if(tval == ''){tval = fetchcookieval("adquery");}
	if(tval != 'blank' && tval != ''){elem.value=UnicodeFixup(unescape(tval)); }
	// Init Catalog Element
	multicatalog = false;
	elem = document.frmaSrch.catalog;
	if(elem.length)
	{
		InitRadio(elem,"catalog");
		multicatalog = true;
	}
	if(state == 'False'){return;}
	// For Product Searches hide the product filter option
	var prdrow = MS_GetEl("pwtrow");
	if(prdsearch == "0"){prdrow.style.display = "none";}
	else{
		if(prdrow.style.display != "block" && prdrow.style.display != "") {
		prdrow.style.display = "block";}
	}
	// Initalize product filter elem
	elem = document.frmaSrch.pwt;
	InitSelect(elem,"pwt","ad");
	// Initalize KT elem
	
	
	elem = document.frmaSrch.kt;
	InitSelect(elem , "kt","ad");
	// Initalize title elem
	elem = document.frmaSrch.title;
	InitSelect(elem,"title","ad");
	//Initalize Mod date elem
	elem = document.frmaSrch.mdt;
	InitSelect(elem , "mdt" ,"ad");
	// Init Scope Options
	if(document.getElementsByName)
	{
		elem = document.getElementsByName("ast");
		for(j=0; j<elem.length; j++)
		{
			tval = fetchcookieval("ad" + elem[j].value);
			if(tval != 'blank' && tval != '')
			{
				if(tval == '0') elem[j].checked = false;
				else elem[j].checked = true;
			}		
		}
	}
	if(optElems)
	{
		opt = optElems.split('|');
		for(j = 0; j<opt.length; j++)
		{
			elem = document.getElementById(opt[j].toString());
			if(elem)
			{
				tval = fetchcookieval("ad" + opt[j]);
				if(tval != 'blank' && tval != '')
				{
					if(tval == '0')elem.checked = false;
					else elem.checked = true;
				}	
			}
		}
	}
	if(multicatalog){DisplayScopeOptions();}
}
function InitRadio(elem , name)
{
	tval = fetchcookieval("ad" + name);
	if(tval != 'blank' && tval != '')
	{
		for(i=0; i<elem.length; i++)
		{
			if(elem[i].value == unescape(tval))
			{
				elem[i].checked = true;
				break;
			}
		}
	}
}
function InitSelect(elem , name , prefix)
{
	tval = fetchcookieval(prefix + name);
	if(tval != 'blank' && tval != '')
	{
		for(i=0; i<elem.options.length; i++)
		{
			if(elem.options[i].value == unescape(tval))
			{
				elem.selectedIndex = i;
				break;
			}
		}
	}
}
function DisplayScopeOptions()
{
	cat = document.frmaSrch.catalog;
	var selected = 0;
	for(i=0; i<cat.length; i++)
	{
		if(cat[i].checked)
		{
			selected = i;
			break;
		}
	}
	var exclude = cat[selected].getAttribute("exclude");
	if(optElems)
	{
		var x = optElems.split('|');
		for(i= 0 ; i<x.length ; i++)
		{
			var optionrow = MS_GetEl(x[i] + "row");
			if(optionrow){optionrow.style.display = "block";}
		}
	}
	x = exclude.split('|');
	for(i= 0 ; i<x.length ; i++)
	{
		var optionrow = MS_GetEl(x[i] + "row");
		if(optionrow){optionrow.style.display = "none";}
	}
}
function SaveSrchState(state)
{
	if(PageSubmit == '1'){return;}
	var elem;
	// save Query Value
	elem = document.frmaSrch.query;
	srch_setcookieval("adquery", UnicodeFixup(escape(elem.value)));
	// save catalog.Value
	elem = document.frmaSrch.catalog;
	// Check if there are multiple catalogs
	if(elem.length){SaveRadioState(elem,"catalog");}
	if(state == 'False'){return;}	
	// Save Title State
	elem = document.frmaSrch.pwt;
	SaveSelectState(elem,"pwt");
	// save KeyWordType value
	elem = document.frmaSrch.kt;
	SaveSelectState(elem,"kt");
	// Save Title State
	elem = document.frmaSrch.title;
	SaveSelectState(elem,"title");
	// save Modified date value
	elem = document.frmaSrch.mdt;
	SaveSelectState(elem,"mdt");
	// save scope options
	if(document.getElementsByName)
	{
		elem = document.getElementsByName("ast");
		for(i=0; i<elem.length; i++)
		{
			var optrow = MS_GetEl(elem[i].value + "row");
			if(optrow.style.display == "block" || optrow.style.display == "")
			{
				if(elem[i].checked){srch_setcookieval("ad" + elem[i].value, '1');}
				else{srch_setcookieval("ad" + elem[i].value, '0');}
			}
			else{elem[i].value = "";}
		}
	}
	if(optElems)
	{	
		options = optElems.split('|');
		for(i=0; i<options.length; i++)
		{
			elem = document.getElementById(options[i].toString());
			if(elem)
			{
				var optrow = MS_GetEl(options[i] + "row");
				if(optrow.style.display == "block" || optrow.style.display == "")
				{
					if(elem.checked){srch_setcookieval("ad" + options[i], '1');}
					else{srch_setcookieval("ad" + options[i], '0');}
				}
				else{elem.value = "";}
			}
		}
	}
}
function SaveRadioState(elem ,name)
{
	for(i=0; i<elem.length; i++)
	{
		if(elem[i].checked){srch_setcookieval('ad'+ name ,escape(elem[i].value));}
	}
}
function SaveSelectState(elem ,name)
{
	srch_setcookieval('ad' + name,escape(elem.options[elem.selectedIndex].value));
}
function InitSrch()
{
	// Initalize query box
	elem = document.frmsrch.query;
	tval = fetchcookieval("lquery")
	if(tval != 'blank' && tval != ''){elem.value=UnicodeFixup(unescape(tval));}
	elem = document.frmsrch.catalog;
	if(elem.options){InitSelect(elem , "catalog" ,"l")}
}
function SaveLeftSrch()
{
	var elem;	
	// save Query Value
	elem = document.frmsrch.query;
	srch_setcookieval("lquery", UnicodeFixup(escape(elem.value)));
	// save catalog.Value
	elem = document.frmsrch.catalog;
	// Check if there are multiple catalogs
	if(elem.options){srch_setcookieval('l' + name,escape(elem.options[elem.selectedIndex].value));}
}
function SubmitSearch(state)
{
	SaveSrchState(state);
	PageSubmit = 1;
}
function DoSubmit(frm)
{
	for(i=0; i<frm.srch.length; i++)
	{
		if(frm.srch[i].checked)
		{
			if(frm.srch[i].value == 'msc')
			{
				var msurl = mscomurl + OutputEncoder_EncodeUrl(frm.query.value);
				document.location.href=msurl;
				return false;
			}
			else if(frm.srch[i].value == 'sup')
			{
				if(frm.srch.length > 2)
				{
					frm.ast.value	= '';
					frm.more.value='false';
				}
				var tval = fetchcookieval("adcat");
				if(tval == 'blank' || tval == '0') frm.cat.value='false';
				else frm.cat.value='true';
			}
		}
	}
	frm.submit();
}

function resizeNewsFrame()
{
    document.getElementById('news').height = "100%";
    document.getElementById('news').width = "100%";
}

function RemoveMsviGlobalSearch()
{
	var globalSearch = document.getElementById("msviGlobalSearch");
	if(globalSearch != null){globalSearch.innerHTML = "&nbsp;";}
}