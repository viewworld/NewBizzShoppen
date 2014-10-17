function custom_form_validator_for_field(form_id, field_id, validation_type){
  $(form_id + " li[id='" + field_id + "_input'] p").remove();
  var is_valid = true;
  if(validation_type == "not_empty"){
    if(jQuery.trim($(form_id + ' #'+field_id).val()) == "") {
        custom_validation_error_for_field(form_id, field_id, I18n.t("common.js.field_cant_be_blank"));
        is_valid = false;
    }
  }
  else if(validation_type == "selected"){
    if($(form_id +' #'+field_id + ' option:selected').val() == ""){
        custom_validation_error_for_field(form_id, field_id, I18n.t("common.js.field_cant_be_blank"));
        is_valid = false;
    }
  }
  else if(validation_type == "valid_email"){
      var  email_reg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      if(jQuery.trim($(form_id + ' #'+field_id).val()) == "" || !email_reg.test($('#'+field_id).val())) {
          custom_validation_error_for_field(form_id, field_id, I18n.t("common.js.field_incorrect_format"));
          is_valid = false;
      }
  }
  return is_valid
}

function custom_validation_error_for_field(form_id, field_id, message){
    $(form_id + " li[id='" + field_id + "_input']").append("<p class='inline-errors'>" + message + "</p>");
}

function custom_clear_form(form_id, fields){
    $.map(fields, function (field) {
        $(form_id + " li[id='" + field + "_input'] p").remove();
        $(form_id + ' #'+ field).val('');
    });
}