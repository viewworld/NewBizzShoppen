  var ckeditor_initialised = 0;

  function reload_ck_editor(){
      if(true){
      CKEDITOR.instances.body_editor.destroy();
      window.ckeditor_initialised = 0;
      init_ck_editor();
      setTimeout("CKEDITOR.instances.body_editor.setData( $('#" + $('#modal_for_email_template_edit').dialog("option", "model_name_field_prefix") + "_email_template_body').val())",200)
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
      model_field_prefix = $('#modal_for_email_template_edit').dialog("option", "model_name_field_prefix");
      $.each(['subject', 'from', 'bcc', 'cc', 'body'], function(index, value) {
          if( jQuery.trim($('#' + model_field_prefix + '_email_template_' + value).val()) != ""){
              eval(value + " = \'" + $('#' + model_field_prefix + '_email_template_' + value).val().split("\n").join("") + "\'");
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
      model_field_prefix = $('#modal_for_email_template_edit').dialog("option", "model_name_field_prefix");
      modal_box_id = "#modal_for_email_template_edit";
      $('#' + model_field_prefix + '_email_template_subject').val($(modal_box_id + ' #subject').val());
      $('#' + model_field_prefix + '_email_template_from').val($(modal_box_id + ' #from').val());
      $('#' + model_field_prefix + '_email_template_bcc').val($(modal_box_id + ' #bcc').val());
      $('#' + model_field_prefix + '_email_template_cc').val($(modal_box_id + ' #cc').val());
      $('#' + model_field_prefix + '_email_template_body').val(CKEDITOR.instances.body_editor.getData());
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

  function setup_jquery_dialog(model_name_field_prefix){
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
      $('#modal_for_email_template_edit').dialog("option", "model_name_field_prefix", model_name_field_prefix);
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
    $('#modal_for_email_template_vars').dialog('open');
  }

  function open_email_variables_multiple_dialog(instance_name){
    $('#modal_email_vars_' + instance_name).dialog('open');
  }

  function insert_variable_to_editor(variable, instance_name){
      CKEDITOR.instances[instance_name].insertHtml( variable );
      $('#modal_for_email_template_vars').dialog('close');
  }

  function insert_variable_to_multiple_editor(variable, instance_name){
      CKEDITOR.instances[instance_name].insertHtml( variable );
      $('#modal_email_vars_' + instance_name).dialog('close');
  }

  function test_send_email_prompt(url, subject_field_id, ckeditor_body_instance_id){
      if(subject_field_id == null){ subject_field_id = 'email_template_subject' }
      if(ckeditor_body_instance_id == null){ ckeditor_body_instance_id = 'email_template_body_editor' }

      var email = prompt(I18n.t("common.js.enter_email_address"));
      if(email != null){
        $.ajax({
          type: 'POST',
          url: url,
          data: {email: email, subject: $('#' + subject_field_id).val(), body: eval('CKEDITOR.instances.' + ckeditor_body_instance_id +'.getData()')}
        });
      }
  }

  function set_email_variables_for_popup(variables){
      html_content = [];
      $.each(variables, function(index, variable) {
          html_content.push("<a href=\"#\" onclick=\"insert_variable_to_editor('" + variable + "', 'body_editor'); return false;\">" + variable + "</a>");
      });
      if(html_content.length == 0){
          $('#modal_for_email_template_vars').html("No variables available for this template.");
      }
      else
      {
          $('#modal_for_email_template_vars').html(html_content.join("<br />"));
      }

  }

  function setup_jquery_deal_links_dialog(){
      $('#modal_for_deal_links').dialog({
          autoOpen: false,
          width: 700,
          height: 500,
          title: 'Insert deal links',
          modal: true
      });
  }

  function open_deal_links_dialog(){
      $('#deal_links_container').html(I18n.t("common.js.loading"));
     $.get('/deals/show_all.js');
     $('#modal_for_deal_links').dialog('open');
  }

  function check_uncheck_deal_link(id){
      checkbox_selector = "input[type=checkbox][name^=deal_links][value^='" + id + "']";
      if($(checkbox_selector).attr("checked")){
          $(checkbox_selector).attr("checked", "");
      }
      else
      {
          $(checkbox_selector).attr("checked", "true")
      }
  }

  function insert_deal_links_into_ckeditor(instance_name, domain_name){
    link_tmp = "";
    $('input[type=checkbox][id^=deal_links]:checked').each(function(){
        link_tmp += "<a href=\"http://" + domain_name + "/deals/" + $(this).val() + "\">" + $("#" + $(this).attr("id") + "_header").val() + "</a><br/>";
    });
    CKEDITOR.instances[instance_name].insertHtml("<p>&nbsp;</p><p>" + link_tmp + "</p><p>&nbsp;</p>");
    $('#modal_for_deal_links').dialog('close');
  }

  function search_deal_links(query){
      query = query.toString().split(" ").join("_");
      $('div[id^=div_link_container_]').hide();
      $('div[id^=div_link_container_][id*=' + query + ']').show()
  }

  function show_all_deal_links(){
      $('div[id^=div_link_container_]').show();
  }

  function show_selected_deal_links(){
      $('div[id^=div_link_container_]').hide();
      $('input:checked').closest("div").show();
  }