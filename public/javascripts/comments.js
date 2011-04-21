  function reply_to(thread_id,comment_id,commentable_id,comment_title) {
    if ($('#reply_'+comment_id).size() == 0) {
        $.get('/comments/replies/new.js',
              'thread_id='+thread_id+'&comment_id='+comment_id+'&title='+comment_title+'&commentable_id='+commentable_id,
               function(data){
                   $('#reply_'+comment_id).slideDown('slow');
               });
    } else {
        $('#reply_'+comment_id).slideToggle('slow');
    }
  }

  function edit_comment(comment_id) {
      $.get('/comments/threads/'+comment_id+'/edit.js',
            '',
             function(data){
                 $('#edit_comment_'+comment_id).slideDown('slow');
             });
  }

  function validate_form(form_id){
      if(jQuery.trim($(form_id + " input[id='comment_title']").val()) == "" || jQuery.trim($(form_id + " textarea[id='comment_body']").val()) == "")
      {
          $(form_id + " li[id='comment_title_input'] p").remove();
          if(jQuery.trim($(form_id + " input[id='comment_title']").val()) == "")
          {
              $(form_id + " li[id='comment_title_input']").addClass("error");
              $(form_id + " li[id='comment_title_input']").append("<p class='inline-errors'>can't be blank</p>")
          }
          else
          {
              $(form_id + " li[id='comment_title_input']").removeClass("error");
          }

          $(form_id + " li[id='comment_body_input'] p").remove();
          if(jQuery.trim($(form_id + " textarea[id='comment_body']").val()) == "")
          {
              $(form_id + " li[id='comment_body_input']").addClass("error");
              $(form_id + " li[id='comment_body_input']").append("<p class='inline-errors'>can't be blank</p>")
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
