setCategory = function(id) {
    $('#search_with_category').val(id);
    $('#search_new').submit();
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