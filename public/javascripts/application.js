//setCategory = function(id) {
//    $('#search_with_category').val(id);
//    $('#search_new').submit();
//};

mark_all_cbs_with_selector = function(val,selector) {
    $(selector).each(function() {
        $(this).attr('checked', val);
    });
};

submitBulkForm = function(url){
    $('#route_to').val(url);
    $('#bulk_actions_form').submit();
};


