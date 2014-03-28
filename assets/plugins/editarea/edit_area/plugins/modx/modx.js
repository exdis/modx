/**
 * @name       MODx Plugin for EditArea
 * @purpose    Add some functions to EditArea in a MODx context
 * @version    0.5.2 - March 17, 2010
 *
 * @authors     Gildas       <modx@ackwa.fr>
 *              pixelchutes       <http://www.pixelchutes.com>
 *               
 * @copyright  Copyright (c) 2006-2007 www.ackwa.fr
 * @license    GNU General Public License 2.0
 */
var EditArea_modx = {
    init: function(){	
    }

    ,get_control_html: function(ctrl_name){
        switch (ctrl_name) {
            case 'modx':
                return parent.editAreaLoader.get_button_html('save', 'save.png', 'modx_save');
        }
        return false;
    }

    ,onload: function(){ 
    }

    ,onkeydown: function(e){			
        /*
         * The "Ctrl" key is pressed 
         */
        if (CtrlPressed(e)) {
            if (EA_keys[e.keyCode]) {
                var key = EA_keys[e.keyCode];
            }
            else {
                var key = String.fromCharCode(e.keyCode).toLowerCase();
            }
            
            /*
             * CTRL+S   : Save the form
             *
             * NB : The "return false;" is required to bypass browser event manager 
             */
             
            switch(key) {
                case 's':
                    this.execCommand('modx_save');
                    return false;
                default:
            }
        }
    }

    ,execCommand: function(cmd, param){
        switch (cmd) {
            case 'modx_save':
                
		try{
			if( parent.document.getElementById('Button1') ){
                parent.document.getElementById('Button1').getElementsByTagName('a')[0].onclick();                
            }
		} catch(e){}

                return false;
        }
        return true;
    }
};
editArea.add_plugin('modx', EditArea_modx);
