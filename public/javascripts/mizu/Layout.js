
//default layout values
var def_background_color = '#94c23f';
var def_background_border_color = HoverCalc(def_background_color, -10);
var def_general_text_color = '#444444';
var def_button_color = '#01afd4';
var def_button_border_color = HoverCalc(def_button_color, -10);
var def_button_text_color = "#ffffff";
var def_webphone_width = 256;
var def_webphone_height = 450;
var def_call_button_color = '#00ff00';
var def_hangup_button_color = '#ff0000';
var def_brandname = 'Mizutech';
var def_company_webpage = 'http://www.mizu-voip.com';

//current layout values
var curr_background_color = '';
var curr_background_border_color = '';
var curr_general_text_color = '';
var curr_button_color = '';
var curr_button_border_color = '';
var curr_button_text_color = '';
var curr_webphone_width = 0;
var curr_webphone_height = 0;
var curr_call_button_color = '';
var curr_hangup_button_color = '';
var curr_brandname = '';
var curr_company_webpage = '';


function ApplyCustomSkin() // called on page loading from Common.js
{
	SetBgColor();
}

function SetBgColor()
{
	try{
	try{
		if (general_text_color != null && general_text_color.length > 2)
		{
			curr_general_text_color = general_text_color;
		}else
		{
			curr_general_text_color = def_general_text_color;
		}
	}catch (e) {curr_general_text_color = def_general_text_color;}


	try{
		if (background_color != null && background_color.length > 2)
		{
			curr_background_color = background_color;
		}else
		{
			curr_background_color = def_background_color;
		}
	}catch (e) {curr_background_color = def_background_color;}
	
	curr_background_border_color = HoverCalc(curr_background_color, -10);
	
	
	try{
		if (button_color != null && button_color.length > 2)
		{
			curr_button_color = button_color;
		}else
		{
			curr_button_color = def_button_color;
		}
	}catch (e) {curr_button_color = def_button_color;}
	
	curr_button_border_color = HoverCalc(curr_button_color, -10);
	
	
	try{
		if (button_text_color != null && button_text_color.length > 2)
		{
			curr_button_text_color = button_text_color;
		}else
		{
			curr_button_text_color = def_button_text_color;
		}
	}catch (e) {curr_button_text_color = def_button_text_color;}
	
	try{
		if (webphone_width != null && webphone_width > 0 && !isNaN(webphone_width))
		{
			curr_webphone_width = webphone_width;
		}else
		{
			curr_webphone_width = def_webphone_width;
		}
	}catch (e) {curr_webphone_width = def_webphone_width;}
	
	try{
		if (webphone_height != null && webphone_height > 0 && !isNaN(webphone_height))
		{
			curr_webphone_height = webphone_height;
		}else
		{
			curr_webphone_height = def_webphone_height;
		}
	}catch (e) {curr_webphone_height = def_webphone_height;}
	
	try{
		if (call_button_color != null && call_button_color.length > 2)
		{
			curr_call_button_color = call_button_color;
		}else
		{
			curr_call_button_color = def_call_button_color;
		}
	}catch (e) {curr_call_button_color = def_call_button_color;}
	
	try{
		if (hangup_button_color != null && hangup_button_color.length > 2)
		{
			curr_hangup_button_color = hangup_button_color;
		}else
		{
			curr_hangup_button_color = def_hangup_button_color;
		}
	}catch (e) {curr_hangup_button_color = def_hangup_button_color;}
	
	try{
		if (brandname != null && brandname.length > 1)
		{
			curr_brandname = brandname;
		}else
		{
			curr_brandname = def_brandname;
		}
	}catch (e) {curr_brandname = def_brandname;}
	
	try{
		if (company_webpage != null && company_webpage.length > 2)
		{
			curr_company_webpage = company_webpage;
		}else
		{
			curr_company_webpage = def_company_webpage;
		}
	}catch (e) {curr_company_webpage = def_company_webpage;}
	
	
	var loginTextBoxBorderColor = HoverCalc(curr_background_color, -20);
	loginTextBoxBorderColor = HoverCalc(loginTextBoxBorderColor, -20);
	loginTextBoxBorderColor = HoverCalc(loginTextBoxBorderColor, -20);
	
	var widthHeightPlus = 0;
	if ($.browser.msie) {widthHeightPlus = 4;}
	
	var widthTmp = curr_webphone_width + widthHeightPlus;
	var heightTmp = curr_webphone_height + widthHeightPlus
	
	document.getElementById("bg_container").style.width = widthTmp + 'px';
	document.getElementById("bg_container").style.height = heightTmp + 'px';
	
	var container_register_width = Math.floor(curr_webphone_width * 0.7);
	document.getElementById("container_register").style.width = container_register_width + 'px';
	document.getElementById("register_form").style.width = container_register_width + 'px';
	
	var container_dial_width = Math.floor(curr_webphone_width * 0.9);
	document.getElementById("container_dial").style.width = container_dial_width + 'px';
	
	
	document.getElementById("username_input").style.borderColor = loginTextBoxBorderColor;
	document.getElementById("password_input").style.borderColor = loginTextBoxBorderColor;
    
    if (document.getElementById('license_key_input') != null)       document.getElementById("license_key_input").style.borderColor = loginTextBoxBorderColor;
    if (document.getElementById('server_address_input') != null)    document.getElementById("server_address_input").style.borderColor = loginTextBoxBorderColor;
	
	document.body.style.color = curr_general_text_color;
	
	if (document.getElementById("btn_callhangup") != null)
	{
		document.getElementById("PhoneNumberDiv").style.backgroundColor = '#ffffff';
		document.getElementById("PhoneNumberDiv").style.borderColor = curr_background_border_color;
		
		document.getElementById("PhoneNumber").style.color = curr_general_text_color;
		document.getElementById("PhoneNumber").style.backgroundColor = '#ffffff';
	}else
	{
		document.getElementById("PhoneNumberDiv").style.backgroundColor = HoverCalc(curr_background_color, 30);
		document.getElementById("PhoneNumberDiv").style.borderColor = curr_background_border_color;
		
		document.getElementById("PhoneNumber").style.color = curr_general_text_color;
		document.getElementById("PhoneNumber").style.backgroundColor = HoverCalc(curr_background_color, 30);
	}
		
	document.getElementById("bg_container").style.backgroundColor = curr_background_color;
	document.getElementById("bg_container").style.borderColor = curr_background_border_color;
	if (document.getElementById('logo_a') != null)		document.getElementById("logo_a").style.color = curr_general_text_color;
	if (document.getElementById('logo2_a') != null)		document.getElementById("logo2_a").style.color = curr_general_text_color;
	document.getElementById("btn_connect").style.color = curr_button_text_color;
	document.getElementById("btn_connect").style.backgroundColor = curr_button_color;
	document.getElementById("btn_connect").style.borderColor = curr_button_border_color;
	
	var logoDivWidth = container_dial_width - 62;
	if (document.getElementById('logo') != null)		document.getElementById("logo").style.width = logoDivWidth + 'px';
	
	if (curr_company_webpage.indexOf("http://") < 0)
	{
		curr_company_webpage = "http://" + curr_company_webpage;
	}
	if (document.getElementById('logo_a') != null)		document.getElementById("logo_a").href = curr_company_webpage;
	if (document.getElementById('logo_a') != null)		document.getElementById("logo_a").innerHTML = curr_brandname;
	if (document.getElementById('logo_a') != null)		$("a#logo_a").attr("title",curr_brandname + ' Home Page');
	
	if (document.getElementById('logo2_a') != null)		document.getElementById("logo2_a").href = curr_company_webpage;
	if (document.getElementById('logo2_a') != null)		document.getElementById("logo2_a").innerHTML = curr_brandname;
	if (document.getElementById('logo2_a') != null)		$("a#logo2_a").attr("title",curr_brandname + ' Home Page');
	
	
	// numpad
	var borderDial = 0;
	var borderCallHangup = 0;
	var borderCallfunction = 0;
    var btnLineWidthDiff = 0
	if ($.browser.msie)
	{
		var browserVersion = parseInt($.browser.version, 10);
		if (browserVersion > 6)
		{						// IE 7,8,9,...
			borderDial = 20;
			borderCallHangup = 16;
			borderCallfunction = 10;
            btnLineWidthDiff = 22;
			
			// add <br> between img and span in all IE versions but 6
			if (document.getElementById("btn_chat") != null && document.getElementById("btn_transfer") != null && document.getElementById("btn_hold") != null && document.getElementById("btn_conference") != null)
			{
				$("#btn_chat img").after("<br />");
				$("#btn_transfer img").after("<br />");
				$("#btn_hold img").after("<br />");
				$("#btn_conference img").after("<br />");
			}
			if (document.getElementById('lines') != null)
			{
				document.getElementById('lines').style.marginLeft = '2px';
			}
		}else
		{						// IE 6
			borderDial = 24;
			borderCallHangup = 23;
			borderCallfunction = 15;
            btnLineWidthDiff = 26;
			
			if (document.getElementById("btn_chat") != null && document.getElementById("btn_transfer") != null && document.getElementById("btn_hold") != null && document.getElementById("btn_conference") != null)
			{
				document.getElementById("btn_chat").firstChild.style.display = 'none';
				document.getElementById("btn_chat").style.lineHeight = '31px';
				
				document.getElementById("btn_transfer").firstChild.style.display = 'none';
				document.getElementById("btn_transfer").style.lineHeight = '31px';
				
				document.getElementById("btn_hold").firstChild.style.display = 'none';
				document.getElementById("btn_hold").style.lineHeight = '31px';
				
				document.getElementById("btn_conference").firstChild.style.display = 'none';
				document.getElementById("btn_conference").style.lineHeight = '31px';
			}
			if (document.getElementById('lines') != null)
			{
				document.getElementById('lines').style.marginLeft = '5px';
			}
		}
		document.getElementById("numpad").style.paddingLeft = '2px';
		if (document.getElementById("callfunctions") != null)
		{
			document.getElementById("callfunctions").style.width = (Math.floor((container_dial_width - borderCallfunction + 4) / 4) * 4) + 'px';
		}
	}else
	{							// Other browsers
		borderDial = 31;
		borderCallHangup = 25;
		borderCallfunction = 12;
        btnLineWidthDiff = 35;
		
		if (document.getElementById("callfunctions") != null)
		{
			document.getElementById("callfunctions").style.marginLeft = '-2px';
		}
		
		// add <br> between img and span in all other browsers
		if (document.getElementById("btn_chat") != null && document.getElementById("btn_transfer") != null && document.getElementById("btn_hold") != null && document.getElementById("btn_conference") != null)
		{
			$("#btn_chat img").after("<br />");
			$("#btn_transfer img").after("<br />");
			$("#btn_hold img").after("<br />");
			$("#btn_conference img").after("<br />");
		}
		if (document.getElementById('lines') != null)
		{
			document.getElementById('lines').style.marginLeft = '3px';
		}
	}
	var buton_width = Math.floor((container_dial_width - borderDial) / 3)
	var buton_call_width = Math.floor((container_dial_width - borderCallHangup) / 2)
	var buton_callfunctions_width = Math.floor((container_dial_width - borderCallfunction) / 4)
	
	for (var i = 0; i < 12; i++)
	{
		var currId = "btn_"+i;
		var button = document.getElementById(currId);
		
		button.style.backgroundColor = curr_button_color;
		button.style.borderColor = curr_button_border_color;
		button.style.color = curr_button_text_color;
		
		button.style.width = buton_width + 'px';
	}
	
	if (document.getElementById("callbuttons") != null)
	{
		document.getElementById("btn_call").style.backgroundColor = curr_call_button_color;
		document.getElementById("btn_call").style.borderColor = HoverCalc(curr_call_button_color, -10);
		document.getElementById("btn_call").style.color = curr_button_text_color;
		document.getElementById("btn_call").style.width = buton_call_width + 'px';
	
		document.getElementById("btn_hangup").style.backgroundColor = curr_hangup_button_color;
		document.getElementById("btn_hangup").style.borderColor = HoverCalc(curr_hangup_button_color, -10);
		document.getElementById("btn_hangup").style.color = curr_button_text_color;
		document.getElementById("btn_hangup").style.width = buton_call_width + 'px';
	}
	
	if (document.getElementById("acceptreject") != null)
	{
		document.getElementById("btn_accept").style.backgroundColor = curr_call_button_color;
		document.getElementById("btn_accept").style.borderColor = HoverCalc(curr_call_button_color, -10);
		document.getElementById("btn_accept").style.color = curr_button_text_color;
		document.getElementById("btn_accept").style.width = buton_call_width + 'px';
		
		document.getElementById("btn_reject").style.backgroundColor = curr_hangup_button_color;
		document.getElementById("btn_reject").style.borderColor = HoverCalc(curr_hangup_button_color, -10);
		document.getElementById("btn_reject").style.color = curr_button_text_color;
		document.getElementById("btn_reject").style.width = buton_call_width + 'px';
	}
	
	if (document.getElementById("btn_callhangup") != null)
	{
		if ($.browser.msie)
		{
			var browserVersion = parseInt($.browser.version, 10);
			if (browserVersion > 6)
			{						// IE 7,8,9,...
				document.getElementById("btn_callhangup").style.width = Math.floor((container_dial_width - 36) / 3) + 'px';
			}else
			{						// IE 6
				document.getElementById("btn_callhangup").style.width = Math.floor((container_dial_width - 45) / 3) + 'px';
			}
		}else
		{							// Other browsers
			document.getElementById("btn_callhangup").style.width = Math.floor((container_dial_width - 56) / 3) + 'px';
		}
		
		document.getElementById("PhoneNumberDiv").style.width = Math.floor((container_dial_width * 2) / 3) + 'px'
		document.getElementById("btn_callhangup").style.backgroundColor = curr_call_button_color;
		document.getElementById("btn_callhangup").style.borderColor = HoverCalc(curr_call_button_color, -10);
		document.getElementById("btn_callhangup").style.color = curr_button_text_color;
		document.getElementById("btn_callhangup").innerHTML = 'Call';
	}
	
	if (document.getElementById("callfunctions") != null)
	{
		document.getElementById("callfunctions").style.backgroundColor = curr_button_color;
		document.getElementById("callfunctions").style.borderColor = curr_button_border_color;
		document.getElementById("callfunctions").style.color = curr_button_text_color;
	}
	
	if (document.getElementById("btn_chat") != null && document.getElementById("btn_transfer") != null && document.getElementById("btn_hold") != null && document.getElementById("btn_conference") != null)
	{
		document.getElementById("btn_chat").style.backgroundColor = curr_button_color;
		document.getElementById("btn_chat").style.borderColor = curr_button_border_color;
		document.getElementById("btn_chat").style.width = buton_callfunctions_width + 'px';
		
		document.getElementById("btn_transfer").style.backgroundColor = curr_button_color;
		document.getElementById("btn_transfer").style.borderColor = curr_button_border_color;
		document.getElementById("btn_transfer").style.width = buton_callfunctions_width + 'px';
		
		document.getElementById("btn_hold").style.backgroundColor = curr_button_color;
		document.getElementById("btn_hold").style.borderColor = curr_button_border_color;
		document.getElementById("btn_hold").style.width = buton_callfunctions_width + 'px';
		
		document.getElementById("btn_conference").style.backgroundColor = curr_button_color;
		document.getElementById("btn_conference").style.borderColor = curr_button_border_color;
		document.getElementById("btn_conference").style.width = buton_callfunctions_width + 'px';
		
		var spanWidth = buton_callfunctions_width - 2;
		$("#btn_chat span").css('width', spanWidth + 'px');
		$("#btn_transfer span").css('width', spanWidth + 'px');
		$("#btn_hold span").css('width', spanWidth + 'px');
		$("#btn_conference span").css('width', spanWidth + 'px');
	}
	
    // manage Multiline skin
	var divLines;
	if (isMultiLineSkin && nrOfLines > 1)
	{
		divLines = document.getElementById('lines');
		
		for (var i = 0; i < nrOfLines; i++)
		{
			var line = i + 1;
			//divLines.innerHTML += "<div id=\"line_" + line + "\" style=\"float:left; margin-top:6px;\"><div id=\"btn_line_" + line + "\" onclick=\"WJSAPI_ChangeLine("+line+")\">Line " + line + "</div><span id=\"status_line_" + line + "\"style=\"padding:0px; float:left; display:inline-block; margin-top:5px; margin-left:5px; font-size:11px; color:#26b14a; font-weight:bold; white-space:nowrap; overflow:hidden;\"></span></div>";
            divLines.innerHTML += "<div id=\"btn_line_" + line + "\" onclick=\"WJSAPI_ChangeLine("+line+")\"><span id=\"btn_line_" + line + "_span\" style=\"display:inline-block; overflow:hidden;\">Line " + line + "</span></div>";
		}
		
		for (var i = 0; i < nrOfLines; i++)
		{
			var line2 = i + 1;
			var idBtnLines = 'btn_line_' + line2;
			
			var currBtn = document.getElementById(idBtnLines);

			currBtn.style.backgroundColor = curr_button_color;
			currBtn.style.borderColor = curr_button_border_color;
			currBtn.style.color = curr_button_text_color;
			
            var btnWith = Math.floor((container_dial_width - btnLineWidthDiff) / 4);
            
			currBtn.style.width = btnWith + 'px';
            
            var btnSpanWidth = btnWith - 5;            
            document.getElementById('btn_line_' + line2 + '_span').style.width = btnSpanWidth + 'px';
			
			// hover
			$("div#"+idBtnLines).mouseenter(function()
			{
                var theLine = ($(this).attr('id')).charAt(($(this).attr('id')).length - 1);
                
				if ($.browser.msie)
				{
                    if (theLine == currLine)
                    {
                        $(this).children().css("background-color",HoverCalc(curr_call_button_color, 15));
                    }else
                    {
                        $(this).children().css("background-color",HoverCalc(curr_button_color, 15));
                    }
				}else
				{
                    if (theLine == currLine)
                    {                        
                        $(this).css("background-color",HoverCalc(curr_call_button_color, 15));
                    }else
                    {
                        $(this).css("background-color",HoverCalc(curr_button_color, 15));
                    }
				}
			}).mouseleave(function()
			{
                var theLine = ($(this).attr('id')).charAt(($(this).attr('id')).length - 1);
                
				if ($.browser.msie)
				{
                    if (theLine == currLine)
                    {
                        $(this).children().css("background-color",curr_call_button_color);
                    }else
                    {
                        $(this).children().css("background-color",curr_button_color);
                    }
				}else
				{
                    if (theLine == currLine)
                    {
                        $(this).css("background-color",curr_call_button_color);
                    }else
                    {
                        $(this).css("background-color",curr_button_color);
                    }
				}
			});
		}
		disableSelection(document.getElementById('lines'));
	}
    
    // manage Multiline skin button's style
    if (isMultiLineSkin && nrOfLines > 1)
    {
        for (var i = 1; i <= nrOfLines; i++)
        {
            if (i == currLine)
            {
                $("div#btn_line_"+i).css("background-color",curr_call_button_color);
                if (!$.browser.msie)    $("div#btn_line_"+i).css("border-color",HoverCalc(curr_call_button_color, -10));
                $("div#btn_line_"+i).css("font-weight","bold");
            }else
            {
                $("div#btn_line_"+i).css("background-color",curr_button_color);
                if (!$.browser.msie)    $("div#btn_line_"+i).css("border-color",curr_button_border_color);
                $("div#btn_line_"+i).css("font-weight","normal");
            }
        }
    }
	
	}catch (e) {  }
	
	if (document.getElementById('logo') != null)			disableSelection(document.getElementById('logo'));
	if (document.getElementById('logo2') != null)			disableSelection(document.getElementById('logo2'));
	if (document.getElementById('btn_connect') != null)		disableSelection(document.getElementById('btn_connect'));
	if (document.getElementById('header') != null)			disableSelection(document.getElementById('header'));
	if (document.getElementById('info') != null)			disableSelection(document.getElementById('info'));
	if (document.getElementById('numpad') != null)			disableSelection(document.getElementById('numpad'));
	if (document.getElementById('callbuttons') != null)		disableSelection(document.getElementById('callbuttons'));
	if (document.getElementById('acceptreject') != null)	disableSelection(document.getElementById('acceptreject'));
	if (document.getElementById('callfunctions') != null)	disableSelection(document.getElementById('callfunctions'));
	
    curvyCorners.init();
}

function HoverCalc(color, modifyValue) // vilagosabb szint csinal
{
	try{
//	var modifyValue = 15; // the value that every color (RGB) is modified when hover
	var origColor = color;
	var pos = color.indexOf('#');
	if (pos >= 0)
	{
		color = color.substring(pos+1);
	}
	
	if (color.length == 6)
	{
		var red = parseInt(color.substring(0,2), 16);
		var green = parseInt(color.substring(2,4), 16);
		var blue = parseInt(color.substring(4,6), 16);
		
		if ((red  + modifyValue) > 255)		{red = red - modifyValue;}	else if ((red  + modifyValue) < 0)		{red = red - modifyValue;}	else {red = red + modifyValue;}
		if ((green  + modifyValue) > 255)	{green = green - modifyValue;}	else if ((green  + modifyValue) < 0)	{green = green - modifyValue;}	else {green = green + modifyValue;}
		if ((blue  + modifyValue) > 255) 	{blue = blue - modifyValue;}	else if ((blue  + modifyValue) < 0)		{blue = blue - modifyValue;}	else {blue = blue + modifyValue;}
		
		red = red.toString(16);
		green = green.toString(16);
		blue = blue.toString(16);
		
		if (red.length < 2)		{red = '0' + red;}
		if (green.length < 2)	{green = '0' + green;}
		if (blue.length < 2)	{blue = '0' + blue;}
		
		color = '#' + red + green + blue;
	}else if (color.length == 3)
	{
		var red = parseInt(color.substring(0,1), 16);
		var green = parseInt(color.substring(1,2), 16);
		var blue = parseInt(color.substring(2,3), 16);
		
		if ((red  + modifyValue) > 255)		{red = red - modifyValue;}	else if ((red  + modifyValue) < 0)		{red = red - modifyValue;}	else {red = red + modifyValue;}
		if ((green  + modifyValue) > 255)	{green = green - modifyValue;}	else if ((green  + modifyValue) < 0)	{green = green - modifyValue;}	else {green = green + modifyValue;}
		if ((blue  + modifyValue) > 255) 	{blue = blue - modifyValue;}	else if ((blue  + modifyValue) < 0)		{blue = blue - modifyValue;}	else {blue = blue + modifyValue;}
		
		red = red.toString(16);
		green = green.toString(16);
		blue = blue.toString(16);
		
		if (red.length < 2)		{red = '0' + red;}
		if (green.length < 2)	{green = '0' + green;}
		if (blue.length < 2)	{blue = '0' + blue;}
		
		color = '#' + red + green + blue;
	}else
	{
		return origColor;
	}
	return color;
	}catch (e){}
	return '';
}


// button mouseover and mouseout event management

$("div#btn_connect").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_0").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_1").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_2").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_3").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_4").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_5").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_6").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_7").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_8").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_9").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_10").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_11").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_button_color);
	}else
	{
		$(this).css("background-color",curr_button_color);
	}
});

$("div#btn_call").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_call_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_call_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_call_button_color);
	}else
	{
		$(this).css("background-color",curr_call_button_color);
	}
});

$("div#btn_hangup").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_hangup_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_hangup_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_hangup_button_color);
	}else
	{
		$(this).css("background-color",curr_hangup_button_color);
	}
});

$("div#btn_accept").mouseenter(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",HoverCalc(curr_call_button_color, 15));
	}else
	{
		$(this).css("background-color",HoverCalc(curr_call_button_color, 15));
	}
}).mouseleave(function()
{
	if ($.browser.msie)
	{
		$(this).children().css("background-color",curr_call_button_color);
	}else
	{
		$(this).css("background-color",curr_call_button_color);
	}
});

if (document.getElementById("btn_callhangup") != null)
{
	$("div#btn_callhangup").mouseenter(function()
	{
		if ($.browser.msie)
		{
			if (callhangup_isInCall)
			{
				$(this).children().css("background-color",HoverCalc(curr_hangup_button_color, 15));
			}else
			{
				$(this).children().css("background-color",HoverCalc(curr_call_button_color, 15));
			}
		}else
		{
			if (callhangup_isInCall)
			{
				$(this).css("background-color",HoverCalc(curr_hangup_button_color, 15));
			}else
			{
				$(this).css("background-color",HoverCalc(curr_call_button_color, 15));
			}
		}
	}).mouseleave(function()
	{
		if ($.browser.msie)
		{
			if (callhangup_isInCall)
			{
				$(this).children().css("background-color",curr_hangup_button_color);
			}else
			{
				$(this).children().css("background-color",curr_call_button_color);
			}
		}else
		{
			if (callhangup_isInCall)
			{
				$(this).css("background-color",curr_hangup_button_color);
			}else
			{
				$(this).css("background-color",curr_call_button_color);
			}
		}
	});
}

if (document.getElementById("btn_chat") != null && document.getElementById("btn_transfer") != null && document.getElementById("btn_hold") != null && document.getElementById("btn_conference") != null)
{
	$("div#btn_chat").mouseenter(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
		}else
		{
			$(this).css("background-color",HoverCalc(curr_button_color, 15));
		}
	}).mouseleave(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",curr_button_color);
		}else
		{
			$(this).css("background-color",curr_button_color);
		}
	});
	
	$("div#btn_transfer").mouseenter(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
		}else
		{
			$(this).css("background-color",HoverCalc(curr_button_color, 15));
		}
	}).mouseleave(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",curr_button_color);
		}else
		{
			$(this).css("background-color",curr_button_color);
		}
	});
	
	$("div#btn_hold").mouseenter(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
		}else
		{
			$(this).css("background-color",HoverCalc(curr_button_color, 15));
		}
	}).mouseleave(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",curr_button_color);
		}else
		{
			$(this).css("background-color",curr_button_color);
		}
	});
	
	$("div#btn_conference").mouseenter(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",HoverCalc(curr_button_color, 15));
		}else
		{
			$(this).css("background-color",HoverCalc(curr_button_color, 15));
		}
	}).mouseleave(function()
	{
		if ($.browser.msie)
		{
			$(this).children().css("background-color",curr_button_color);
		}else
		{
			$(this).css("background-color",curr_button_color);
		}
	});
}

// disable text selection
function disableSelection(target)
{
	if (typeof target.onselectstart!="undefined") //For IE 
	    target.onselectstart=function(){return false}
		
	else if (typeof target.style.MozUserSelect!="undefined") //For Firefox
    	target.style.MozUserSelect="none"
	else //All other route (For Opera)
    	target.onmousedown=function(){return false}
	
	target.style.cursor = "default"
}


$(function(){
    $('#mizu_main').draggable();
});
