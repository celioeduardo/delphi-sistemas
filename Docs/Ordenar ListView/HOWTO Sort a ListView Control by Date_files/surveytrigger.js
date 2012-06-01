function triggerInit()
{
	var MiliDay = 86400000;
	var maturity = 1;
	var curDate = new Date();
	var visits = fetchcookieval(CookieDef);
	var parts = visits.split('_');
	if(null == visits || parts.length != 2 || isNaN(parts[0]))
	{
		setcookieval(CookieDef, '1_' + (curDate.getTime()/MiliDay - Exp));
		return false;
	}
	else
	{
		var origDate = parseInt(parts[1]);
		visits = parseInt(parts[0]);
		if
		(
			((!isNaN(Freq)) && (Freq > 0)) && ((visits >= maturity) && ((curDate.getTime()/MiliDay - Exp) >= origDate) && (Math.floor(Math.random() * Freq) == 0))
		)
		{
			setcookieval(CookieDef, visits+1 + '_' + curDate.getTime()/MiliDay);
			return true;
		}
		else
		{
			setcookieval(CookieDef, visits+1 + '_' + parts[1]);
			return false;
		}
	}
}

function fireTrigger(SurveyURL)
{
	if(triggerInit())
	{		
		var sSiteID = '', sSiteRegionID = '', sReferringURL = '', P0 = '', P1 = '', P2 = '', P3 = '', P4 = '', P5 = '', P6 = '', P7 = '', P8 = '', P9 = '';		
		if(fireTrigger.arguments.length > 1){sSiteID = fireTrigger.arguments[1];}
		if(fireTrigger.arguments.length > 2){sSiteRegionID = fireTrigger.arguments[2];}
		if(fireTrigger.arguments.length > 3){sReferringURL = fireTrigger.arguments[3];}
		if(fireTrigger.arguments.length > 4){P0 = fireTrigger.arguments[4];}
		if(fireTrigger.arguments.length > 5){P1 = fireTrigger.arguments[5];}
		if(fireTrigger.arguments.length > 6){P2 = fireTrigger.arguments[6];}
		if(fireTrigger.arguments.length > 7){P3 = fireTrigger.arguments[7];} 
		if(fireTrigger.arguments.length > 8){P4 = fireTrigger.arguments[8];}
		if(fireTrigger.arguments.length > 9){P5 = fireTrigger.arguments[9];}		
		if(fireTrigger.arguments.length > 12){P8 = fireTrigger.arguments[12];}
		if(fireTrigger.arguments.length > 13){P9 = fireTrigger.arguments[13];}	
		
		var fullURL = SurveyURL + '&site=' + sSiteID + '&SurveyStyle=' + SurveyStyle + '&siteregion=' + sSiteRegionID + '&url=' + sReferringURL + '&p0=' + P0 + '&p1=' + P1 + '&p2=' + P2 + '&p3=' + P3 + '&p4=' + P4 + '&p5=' + P5 + '&p6=' + P6 + '&p7=' + P7 + '&p8=' + P8 + '&p9=' + P9;
		
		if (EmailStyle == 1)
			fullURL = fullURL + '&emailsurveyid=' + EmailSurveyID + '&sessionid=-1';
				
		if (DisplayIntroPage != '1')
			fullURL = fullURL + '&showpage=1';		
		if (SurveyStyle == null)
			SurveyStyle = "popup";		
		SurveyStyle = SurveyStyle.toLowerCase();
		if (SurveyStyle == 'full screen'){		
			window.open(fullURL, '_blank', 'resizable=yes,scrollbars=yes,menubar=no,location=no,toolbar=no,status=no,left=0,top=0,height=' + (screen.height-5)+ ',width=' + (screen.width-5));
		}
		else if (SurveyStyle == "embedded"){
			if (embedSurveyPrompt == 'nothing') 
				window.location.href=fullURL;
			else
			{			
				if (embedSurveyPrompt != "" && window.screenTop<10000 && window.confirm(embedSurveyPrompt) == true) //unload event
				{
					// we can not do a window.location.href for the redirection because when refreshing the window that redirection won't work
					// Optimally if it is refreshing, we should not do survey. But we have no way to know it is refreshing window, so we keep the behavior same				
					document.writeln('<html><body>');
					document.writeln('<form name="the_form" action="' + fullURL + '" method="post"><\/form>');
					document.writeln("<\/body><\/html>");
					document.the_form.submit();
				}					
			}
		}
		else if (EmailStyle == 1)
			window.open(fullURL, '_blank', 'resizable=yes,scrollbars=yes,menubar=no,location=no,toolbar=no,status=no,left=0,top=0,height=300,width=500');
		else
			window.open(fullURL, '_blank', 'resizable=yes,scrollbars=yes,menubar=no,location=no,toolbar=no,status=no,left=0,top=0,height=500,width=725');
	}
}