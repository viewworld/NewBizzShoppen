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

function save_pipeline_report_values_timer(lead_purchase_id){
    clearTimeout($.data(this, 'timer'));
    $(this).data('timer', setTimeout(function() {
        save_pipeline_report_values(lead_purchase_id);
    }, 1500));
}

function save_pipeline_report_values(lead_purchase_id) {
    lead_purchase_id = lead_purchase_id.toString();
    value = $('#value_' + lead_purchase_id).val();
    estimate = $('#estimate_' + lead_purchase_id).val();
    if (isNumeric(value) && isNumeric(estimate)) {
        $.post('/suppliers/lead_purchases/' + lead_purchase_id, {
            '_method': 'put',
            'lead_purchase[value]': value,
            'lead_purchase[estimate]': estimate,
            'format': 'js'
        });
        display_pipeline_value_result(calculate_pipeline_value(value, estimate), 'green', lead_purchase_id)
    }
    else {
        display_pipeline_value_result('provide two numbers...', 'red', lead_purchase_id)
    }
}

function display_pipeline_value_result(result, color, lead_purchase_id){
    result_container = $('#pipeline_value_' + lead_purchase_id);
    result_container.html(result);
    result_container.effect('highlight', {color: color}, 2000)
}

function calculate_pipeline_value(value, estimate) {
    return Math.round(parseFloat(value) * parseFloat(estimate) / 100 * 100) / 100
}

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
