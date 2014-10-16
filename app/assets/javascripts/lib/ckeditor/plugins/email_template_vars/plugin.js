CKEDITOR.plugins.add( 'email_template_vars',
{
	init: function( editor )
	{
		editor.addCommand( 'emailTemplVarsDialog', { exec : function( editor ) { open_email_variables_dialog(); } }
 );
        editor.ui.addButton( 'insertEmailTemplVars',
        {
            label: 'Insert e-mail variables',
            command: 'emailTemplVarsDialog',
            icon: this.path + 'images/icon.png'
        } );
	}
} );
