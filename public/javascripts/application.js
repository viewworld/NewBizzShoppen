setCategory = function(id) {
    $('#search_with_category').val(id);
    $('#search_new').submit();
}

mark_all_cbs_with_selector = function(val,selector) {
    $(selector).each(function() {
        $(this).attr('checked', val);
    });
}

//$('select[data-remote]').live('change', function (e) {
//    $(this).callRemote();
//    e.preventDefault();
//});


//jQuery(function($) {
//    // create a convenient toggleLoading function
//    var toggleLoading = function() {
//        $("#loading").toggle()
//    };
//    $("#lead-purchase-update-form").bind("ajax:loading", toggleLoading).bind("ajax:complete", toggleLoading)
//});