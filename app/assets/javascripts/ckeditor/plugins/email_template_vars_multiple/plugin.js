//this plugin is the same as email_template_vars but it can work with multiple instances of ckeditor simultaneously

CKEDITOR.plugins.add( 'email_template_vars_multiple',
{
	init: function( editor )
	{
		editor.addCommand( 'emailTemplVarsMultipleDialog', { exec : function( editor ) { open_email_variables_multiple_dialog(editor.name); } }
 );
        editor.ui.addButton( 'insertEmailTemplVarsMultiple',
        {
            label: 'Insert e-mail variables',
            command: 'emailTemplVarsMultipleDialog',
            icon: this.path + 'images/icon.png'
        } );
	}
} );
