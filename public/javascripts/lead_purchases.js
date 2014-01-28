function setup_ckeditor_for_lead_purchase_note_field(field_id) {
//<![CDATA[
    if (CKEDITOR.instances[field_id]) {
        CKEDITOR.remove(CKEDITOR.instances[field_id]);
    }
    CKEDITOR.replace(field_id, {
        filebrowserImageBrowseUrl: '/ckeditor/images',
        toolbar: 'Lite',
        filebrowserImageUploadUrl: '/ckeditor/create/image',
        language: 'en',
        width: '535px',
        filebrowserBrowseUrl: '/ckeditor/files',
        filebrowserUploadUrl: '/ckeditor/create/file',
        height: '100px'
    });
//]]>
}

function setup_ckeditors_for_lead_purchases(ids) {
    $.each(ids, function (index, value) {
        setup_ckeditor_for_lead_purchase_note_field('owner_note_' + value)
    })
}

function save_owner_note(lead_purchase_id) {
    lead_purchase_id = lead_purchase_id.toString();
    $.post('/suppliers/lead_purchases/' + lead_purchase_id, {
        '_method': 'put',
        'lead_purchase[owner_note]': CKEDITOR.instances['owner_note_' + lead_purchase_id].getData(),
        'owner_note_changed': 1,
        'format': 'js'
    });
    $('#owner_note_form_' + lead_purchase_id).parents('.row_tooltip').effect('highlight', {color: '#d8ff9a'}, 500);
}
