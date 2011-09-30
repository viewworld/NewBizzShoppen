  function validate_template_editor_fields(modal_box_id){
      errors_count = 0;

      $(modal_box_id + " li[id='template_editor_name_input'] p").remove();


      if(jQuery.trim($(modal_box_id + ' #name').val()) == ""){
          $(modal_box_id + " li[id='template_editor_name_input']").append("<p class='inline-errors'>" + I18n.t("common.js.field_cant_be_blank") + "</p>");
          errors_count++;
      }

      errors_count = validate_email_field('email_to', modal_box_id, errors_count);
      errors_count = validate_email_field('email_from', modal_box_id, errors_count);

      return errors_count
  }

  function validate_email_field(field, modal_box_id, errors_count){
      $(modal_box_id + " li[id='template_editor_" + field + "_input'] p").remove();

      var  email_reg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

      if(jQuery.trim($(modal_box_id + ' #'+ field).val()) == "" || !email_reg.test($(modal_box_id + ' #' + field).val())){
          $(modal_box_id + " li[id='template_editor_" + field + "_input']").append("<p class='inline-errors'>" + I18n.t("common.js.field_incorrect_format") + "</p>");
          errors_count++;
      }

      return errors_count
  }
