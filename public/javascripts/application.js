//setCategory = function(id) {
//    $('#search_with_category').val(id);
//    $('#search_new').submit();
//};

mark_all_cbs_with_selector = function(val, selector) {
    $(selector).each(function() {
        $(this).attr('checked', val);
    });
};

submitBulkForm = function(url, target) {
    $('#route_to').val(url);
    $('#bulk_actions_form').removeAttr("target");
    if (target != undefined) {
        $('#bulk_actions_form').attr("target", target);

    }
    $('#bulk_actions_form').submit();
};

jQuery(document).ready(function() {

    $('.td_actions ul').hide(); // for ie7 - do not delete this line
    
    $('.td_actions a').bind("mouseenter", function(){
        $(this).next().show();
        $(this).parent().addClass("tda_hover");       
    });

    $('.td_actions').live("mouseleave", function(){
        $(this).children("ul").hide();
        $(this).removeClass("tda_hover");
    });


});