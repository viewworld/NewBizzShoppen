  var ckeditor_initialised = 0;

  function reload_ck_editor(){
      if(true){
      CKEDITOR.instances.body_editor.destroy();
      window.ckeditor_initialised = 0;
      init_ck_editor();
      setTimeout("CKEDITOR.instances.body_editor.setData( $('#call_result_email_template_body').val())",200)
      }
  }

  function init_ck_editor(){
      if(window.ckeditor_initialised == 0){
      if (CKEDITOR.instances['body_editor']) {
        CKEDITOR.remove(CKEDITOR.instances['body_editor']);}
        CKEDITOR.replace('body_editor', { height: '300px',filebrowserBrowseUrl: '/ckeditor/files',width: '1085px',filebrowserUploadUrl: '/ckeditor/create/file',language: 'en',filebrowserImageBrowseUrl: '/ckeditor/images',toolbar: 'EmailPopup',filebrowserImageUploadUrl: '/ckeditor/create/image' });
      window.ckeditor_initialised = 1;
      }
  }

  var template_initialised = 0;

  function set_email_template_editor_init_values_function_name(f_name){
      if(window.template_initialised == 0){
        $('#modal_for_email_template_edit').dialog('option', 'email_template_editor_init_values_function', f_name);
        window.template_initialised = 1;
      }
      else
      {
          $('#modal_for_email_template_edit').dialog('option', 'email_template_editor_init_values_function', "");
      }
  }

  function init_email_template_editor_with_values(){
      if($('#modal_for_email_template_edit').dialog("option", "email_template_editor_init_values_function") != ""){
          eval($('#modal_for_email_template_edit').dialog("option", "email_template_editor_init_values_function"))
      }
  }

  function fill_email_template_editor_with_values(subject, from, bcc, cc, body, uniq_id){

      $.each(['subject', 'from', 'bcc', 'cc', 'body'], function(index, value) {
          if( jQuery.trim($('#call_result_email_template_' + value).val()) != ""){
              eval(value + " = \'" + $('#call_result_email_template_' + value).val().split("\n").join("") + "\'");
          }
      });
      modal_box_id = "#modal_for_email_template_edit";
      $(modal_box_id + ' #subject').val(subject);
      $(modal_box_id + ' #from').val(from);
      $(modal_box_id + ' #bcc').val(bcc);
      $(modal_box_id + ' #cc').val(cc);
      $('#email_template_editor_uniq_id').val(uniq_id);
      CKEDITOR.instances.body_editor.setData(body);
  }

  function copy_email_template_editor_values(){
      modal_box_id = "#modal_for_email_template_edit";
      $('#call_result_email_template_subject').val($(modal_box_id + ' #subject').val());
      $('#call_result_email_template_from').val($(modal_box_id + ' #from').val());
      $('#call_result_email_template_bcc').val($(modal_box_id + ' #bcc').val());
      $('#call_result_email_template_cc').val($(modal_box_id + ' #cc').val());
      $('#call_result_email_template_body').val(CKEDITOR.instances.body_editor.getData());
  }

  function validate_email_field(field, modal_box_id, errors_count){
      $(modal_box_id + " li[id='template_editor_" + field + "_input'] p").remove();

      var  email_reg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

      if(jQuery.trim($(modal_box_id + ' #'+ field).val()) != "" && !email_reg.test($(modal_box_id + ' #' + field).val())){
          $(modal_box_id + " li[id='template_editor_" + field + "_input']").append("<p class='inline-errors'>" + I18n.t("common.js.field_incorrect_format") + "</p>");
          errors_count++;
      }

      return errors_count
  }

  function validate_template_editor_fields(){
      errors_count = 0;
      modal_box_id = "#modal_for_email_template_edit";

      $(modal_box_id + " li[id='template_editor_subject_input'] p").remove();


      if(jQuery.trim($(modal_box_id + ' #subject').val()) == ""){
          $(modal_box_id + " li[id='template_editor_subject_input']").append("<p class='inline-errors'>" + I18n.t("common.js.field_cant_be_blank") + "</p>");
          errors_count++;
      }

      errors_count = validate_email_field('bcc', modal_box_id, errors_count);
      errors_count = validate_email_field('cc', modal_box_id, errors_count);

      if(errors_count == 0){
          copy_email_template_editor_values();
      }

      return errors_count
  }

  function setup_jquery_dialog(){
      $('#modal_for_email_template_edit').dialog({
          autoOpen: false,
          width: 1120,

          title: 'Edit email template',
          open: function(event, ui) {
              init_ck_editor();
              setTimeout("init_email_template_editor_with_values();", 300);
          },
          beforeClose: function(event, ui) {
              if (validate_template_editor_fields() == 0) {
                  return true
              } else {
                  return false
              }
          },
          buttons: { "Save": function() {
              if (validate_template_editor_fields() == 0) {
                  $(this).dialog("close");
              }
          }}
      });
      $('#modal_for_email_template_edit').dialog("option", "email_template_editor_init_values_function", "");
  }

  function setup_jquery_vars_popup_dialog(){
      $('#modal_for_email_template_vars').dialog({
          autoOpen: false,
          width: 700,
          title: 'Insert variables',
          modal: true
      });
  }

  function open_email_variables_dialog(){
      if($('#email_template_editor_uniq_id').val() == "upgrade_contact_to_category_buyer"){
          $('#modal_for_email_template_vars').dialog('open');
      }
      else
      {
          alert("No variables are available for that template!")
      }

  }

  function insert_variable_to_editor(variable, instance_name){
      CKEDITOR.instances[instance_name].insertHtml( "{{" + variable + "}}" );
      $('#modal_for_email_template_vars').dialog('close');
  }