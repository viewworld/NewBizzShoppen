  function reply_to(thread_id,comment_id,commentable_id,comment_title) {
    if ($('#reply_'+comment_id).size() == 0) {
        $.get('/comments/replies/new.js',
              'thread_id='+thread_id+'&comment_id='+comment_id+'&title='+encodeURIComponent(comment_title)+'&commentable_id='+commentable_id,
               function(data){
                   $('#reply_'+comment_id).slideDown('slow');
               });
    } else {
        $('#reply_'+comment_id).slideToggle('slow');
    }
  }

  function edit_comment(comment_id) {
      $('#edit_comment_'+comment_id).slideUp('slow');
      $('#edit_comment_'+comment_id).remove();
      $.get('/comments/threads/'+comment_id+'/edit.js',
            '',
             function(data){
                 $('#edit_comment_'+comment_id).slideDown('slow');
             });
  }

  function destroy_comment(comment_id){
      if(confirm(I18n.t("common.js.confrimation_message"))){
        $.post('/comments/threads/'+comment_id+'.js', '_method=DELETE');
      }
  }

  function block_user(comment_id, is_blocked){
      if(is_blocked == 0){
          $.post('/comments/blocked_conversations.js', 'id='+comment_id);
      }
      else
      {
          $.post('/comments/blocked_conversations/'+comment_id+'.js', '_method=DELETE');
      }
  }

  function block_comment(comment_id, is_blocked){
      $.post('/comments/threads/'+comment_id+'.js', '_method=PUT&comment[is_blocked]=' + is_blocked);
  }

  function validate_form(form_id){
      if(jQuery.trim($(form_id + " input[id='comment_title']").val()) == "" || jQuery.trim($(form_id + " textarea[id='comment_body']").val()) == "")
      {
          $(form_id + " li[id='comment_title_input'] p").remove();
          if(jQuery.trim($(form_id + " input[id='comment_title']").val()) == "")
          {
              $(form_id + " li[id='comment_title_input']").addClass("error");
              $(form_id + " li[id='comment_title_input']").append("<p class='inline-errors'>" + I18n.t("common.js.field_cant_be_blank") + "</p>")
          }
          else
          {
              $(form_id + " li[id='comment_title_input']").removeClass("error");
          }

          $(form_id + " li[id='comment_body_input'] p").remove();
          if(jQuery.trim($(form_id + " textarea[id='comment_body']").val()) == "")
          {
              $(form_id + " li[id='comment_body_input']").addClass("error");
              $(form_id + " li[id='comment_body_input']").append("<p class='inline-errors'>" + I18n.t("common.js.field_cant_be_blank") + "</p>")
          }
          else
          {
              $(form_id + " li[id='comment_body_input']").removeClass("error");
          }
      }
      else
      {
          $(form_id).submit();
      }
  }

  function clear_form(form_id){
      $(form_id + " input[type='text']").val("");
      $(form_id + " textarea").val("");
      $(form_id + " li[id*='comment_']").removeClass("error");
      $(form_id + " li[id*='comment_'] p[class='inline-errors']").remove();
  }

  function copy_checkboxes_to_bulk_form()
  {
      cb_ids = [];
      jQuery.each($("input:checkbox:checked[id^=lead_purchase_checkbox_]"), function(){
         cb_ids.push("<input type=\"hidden\" value=\""+this.value+"\" name=\"lead_purchase_ids[]\" id=\"duplicate_lead_purchase_checkbox_"+this.value+"\">");
      });
      $('#bulk_form_inputs').html("");
      $('#bulk_form_inputs').html(cb_ids.join(" "))

  }

  var MarkAsReadCallbacks = [];

  function mark_comments_as_read(lead_id){
      if($.inArray(lead_id, MarkAsReadCallbacks) == -1){
          MarkAsReadCallbacks.push(lead_id);
          $.post('/comments/comment_readers.js', 'lead_id='+lead_id);
      }
  }

  function mark_row_as_read(container_id){
      $('#' + container_id + ' a').removeClass("toggle_row_unread");
  }


  function show_hide_thread(comment_id){
      $('#thread_' + comment_id).slideToggle('slow');
      $('#truncated_thread_' + comment_id).slideToggle('slow');
  }