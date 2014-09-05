CKEDITOR.plugins.add( 'deal_links',
{
	init: function( editor )
	{
		editor.addCommand( 'dealLinksDialog', { exec : function( editor ) { open_deal_links_dialog(); } }
 );
        editor.ui.addButton( 'insertDealLinks',
        {
            label: 'Insert deal links',
            command: 'dealLinksDialog',
            icon: this.path + 'images/icon.png'
        } );
	}
} );
