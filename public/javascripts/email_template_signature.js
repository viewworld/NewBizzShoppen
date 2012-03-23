function setup_ckeditor_for_field(field_id){
//<![CDATA[
if (CKEDITOR.instances[field_id]) {
        CKEDITOR.remove(CKEDITOR.instances[field_id]);}
        CKEDITOR.replace(field_id, { filebrowserImageBrowseUrl: '/ckeditor/images',toolbar: 'EmailPopupMulti',filebrowserImageUploadUrl: '/ckeditor/create/image',language: 'en',width: '1085px',filebrowserBrowseUrl: '/ckeditor/files',filebrowserUploadUrl: '/ckeditor/create/file',height: '300px' });
//]]>
}

function show_hide_custom_signature(){
    if($('#email_template_enable_custom_signature').attr('checked')){
        $('#custom_email_signature_div').show();
        $('#destroy_email_template_signature').val('')
    }
    else{
        $('#custom_email_signature_div').hide();
        $('#destroy_email_template_signature').val('true')
    }
}