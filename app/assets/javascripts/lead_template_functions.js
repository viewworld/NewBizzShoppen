function add_template() {
    $('#lead_template_container_' + $('#optional_templates_picker').val()).show();
    $('.destroy_hidden_field_lead_template_fields_' + $('#optional_templates_picker').val()).val('');
    $("#optional_templates_picker option[value=" + $('#optional_templates_picker').val() + "]").remove();
    if ($('#optional_templates_picker option').length == 1) {
        $('#optional_templates_span').hide();
    }
    else {
        $('#optional_templates_span').show();
    }
}

function remove_template(template_id, template_name) {
    $('#lead_template_container_' + template_id.toString()).hide();
    $('.destroy_hidden_field_lead_template_fields_' + template_id.toString()).val('true');
    $('#optional_templates_picker').append($("<option></option>").attr("value", template_id).text(template_name));
    if ($('#optional_templates_picker option').length > 1) {
        $('#optional_templates_span').show();
    }
}