/*
Deal comments functions

All methods below are only deal-specific methods, the rest should be taken from general comments.js
*/

function deal_reply_to(thread_id,comment_id,commentable_id,comment_title) {
    if ($('#reply_'+comment_id).size() == 0) {
        $.get('/deal_comments/replies/new.js',
              'thread_id='+thread_id+'&comment_id='+comment_id+'&title='+encodeURIComponent(comment_title)+'&commentable_id='+commentable_id,
               function(data){
                   $('#reply_'+comment_id).slideDown('slow');
               });
    } else {
        $('#reply_'+comment_id).slideToggle('slow');
    }
  }

  var MarkAsReadCallbacks = [];

  function deal_mark_comments_as_read(lead_id){
      if($.inArray(lead_id, MarkAsReadCallbacks) == -1){
          MarkAsReadCallbacks.push(lead_id);
          $.post('/deal_comments/comment_readers.js', 'lead_id='+lead_id);
      }
  }

  function load_deal_comments(lead_id){
        $.ajax({
            url: '/deal_comments/deals/' + lead_id + '.js',
            type: 'GET'
        });
      deal_mark_comments_as_read(lead_id);
      mark_row_as_read('lead_' + lead_id);
  }