function onEditAreaChanged(id) {
    document.getElementById(id).value = editAreaLoader.getValue(id);			
}

function getLangName( lang ) {
	var res = '';

	switch(lang)
	{
		case "czech": res = "cs"; break;
		//case "danish": res = "da"; break;
		case "english": res = "en"; break;
		case "english-british": res = "en"; break;
		case "finnish": res = "fi"; break;
		case "francais": res = "fr"; break;
		case "francais-utf8": res = "fr"; break;
		case "german": res = "de"; break;
		case "italian": res = "it"; break;
		case "japanese-utf8": res = "ja"; break;
		case "nederlands": res = "nl"; break;
		//case "norsk": res = "nn"; break;
		//case "persian": res = "fa"; break;
		case "polish": res = "pl"; break;
		case "portuguese": res = "pt"; break;
		case "russian": res = "ru"; break;
		case "russian-UTF8": res = "ru"; break;
		case "simple_chinese-gb2312": res = "zh"; break;
		case "spanish": res = "es"; break;
		//case "svenska": res = "sv"; break;
		//case "svenska-utf8": res = "sv"; break;
		default: res = 'en';
	}
	
	return res;
}

function initEditArea(el_name, lang, syntax) {		
	var elements = document.getElementsByName(el_name);
	if(!elements) return;
	var el = elements.item(0);
	
	if(!el.id) el.id = el.name;
        
	editAreaLoader.init({
		id: el.id,
		change_callback: 'onEditAreaChanged',
		language: getLangName( lang ),
		start_highlight: true,
		allow_resize: 'y',
		allow_toggle: true,
		word_wrap: true,
		syntax: syntax,
		toolbar: 'undo, redo, |, select_font, |, syntax_selection, |, change_smooth_selection, highlight, reset_highlight, word_wrap',
		syntax_selection_allow: 'css,html,js,php,xml,sql'			
	});
}