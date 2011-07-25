function submit_query(query_type, namespace) {
    buyer_email = $('#buyer_email').val();
    $.get('/' + namespace + '/deals/new.js',
        'email=' + encodeURIComponent(buyer_email) + '&query_type=' + query_type);
}

function setup_step(current_step) {
    if (current_step == 0) {
        $('#buyer_email_form').show();
        $('#deal_form').hide();
    }
    else if (current_step == 1) {
        $('#buyer_email_form').hide();
        $('#deal_form').show();
    }
}