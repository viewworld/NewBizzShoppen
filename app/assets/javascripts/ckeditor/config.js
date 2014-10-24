/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.addQueryStringToUrl = function(url, params) {
    // copied from filebrowser plugin core
    var queryString = [];

    if (!params)
        return url;
    else {
        for (var i in params)
            queryString.push(i + "=" + encodeURIComponent(params[ i ]));
    }

    return url + ( ( url.indexOf("?") != -1 ) ? "&" : "?" ) + queryString.join("&");
};

CKEDITOR.on('instanceCreated', function(evt) {
  evt.editor.config.toolbar = evt.editor.element.$.getAttribute('toolbar');
});

CKEDITOR.editorConfig = function( config )
{

  config.filebrowserBrowseUrl = '/ckeditor/attachment_files';
  config.filebrowserFlashBrowseUrl = '/ckeditor/attachment_files';
  config.filebrowserFlashUploadUrl = '/ckeditor/attachment_files';
  config.filebrowserImageBrowseLinkUrl = '/ckeditor/pictures';
  config.filebrowserImageBrowseUrl = '/ckeditor/pictures';
  config.filebrowserImageUploadUrl = '/ckeditor/pictures';
  config.filebrowserUploadUrl = '/ckeditor/attachment_files';

  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'en';
  // config.uiColor = '#AADC6E';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;

  config.height = this.element.$.getAttribute('height') || '400px';
  config.width = this.element.$.getAttribute('width') || '600px';

  //config.resize_enabled = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;

  //config.startupFocus = true;

  // works only with en, ru, uk languages
  config.extraPlugins = "embed,attachment,email_template_vars,deal_links,email_template_vars_multiple";

  config.toolbar = config.toolbar

  config.toolbar_Easy =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];

  config.toolbar_Email =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image', 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];

  config.toolbar_EmailPopup =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image', 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak', 'insertEmailTemplVars', 'insertDealLinks']
    ];

    config.toolbar_EmailPopupMulti =
      [
          ['Source','-','Preview','Templates'],
          ['Cut','Copy','Paste','PasteText','PasteFromWord',],
          ['Maximize','-','About'],
          ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
          ['Styles','Format'],
          ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
          ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
          ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
          ['Link','Unlink','Anchor'],
          ['Image', 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak', 'insertEmailTemplVarsMultiple']
      ];

  config.toolbar_EmailSignature =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image', 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];

    config.toolbar_Lite =
    [
        ['Styles','Format'],
        ['Bold','Italic','Underline'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink'],
        ['Image']
    ];
};
