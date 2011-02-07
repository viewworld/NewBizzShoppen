//setCategory = function(id) {
//    $('#search_with_category').val(id);
//    $('#search_new').submit();
//};

function mark_all_cbs_with_selector(t)
{
    var tr = $(t).parents('table').find("tr");

    $(t).is(":checked") ? $("input=[type=checkbox]:not(:checked)", tr).attr("checked", "checked")
                        : $("input=[type=checkbox]:checked", tr).attr("checked", "");
}

submitBulkForm = function(url, target) {
    $('#route_to').val(url);
    $('#bulk_actions_form').removeAttr("target");
    if (target != undefined) {
        $('#bulk_actions_form').attr("target", target);

    }
    $('#bulk_actions_form').submit();
};


jQuery(document).ready(function()
{

    /*--- clickable tr in leads browsing --- */

    if( $('table').has("a.default_action").length != 0 )
    {
        $('td:not(.cl, .cr, .tda)', 'table tbody tr:not(.pagination, .main_actions)').filter(":not(:has(:checkbox, select, a))")
        .addClass("pointer")
        .click(function()
        {            
            var link = $(this).parent().find('a.default_action');
            var link_confirm_msg = $(this).parent().find('input.default_action_confirmation_msg');
            if(link.attr("data-method"))
            {
                if(link_confirm_msg.val() == undefined)
                {
                    link.trigger("click");
                }
                else
                {
                    if(confirm(link_confirm_msg.val())) {link.trigger("click");}
                }
            }
            else
            {
                window.location = link.attr("href");
            }

        });
    }


    /* --- other --- */


    $('.td_actions ul').hide(); // for ie7 - do not delete this line

    $('.td_actions a').bind("mouseenter", function() {
        $(this).next().show();
        $(this).parent().addClass("tda_hover");
    });

    $('.td_actions').live("mouseleave", function() {
        $(this).children("ul").hide();
        $(this).removeClass("tda_hover");
    });


    /* --- colorbox - modalbox --- */
    try
    {
        $("a[id*='help_popup_']").colorbox({
            opacity: "0.5",
            initialWidth: 200,
            initialHeight: 200

        });
    }
    catch(e)
    {
    }

    /* --- slider range --- */

    $(".string.range input[type='text']").bind("click", function() {
        $('.range_container:visible').hide();
        $(this).next().fadeIn(200);
    });


    $(".string.range input[type='text']").parents('li').bind("mouseleave", function() {
        $(this).find('.range_container').fadeOut(200);
    });

    $(".slider-range").slider({
        range: true,
        min: 0,
        max: 100,
        values: [ 0, 100 ]
    });

    /* --- show basket / hide --- */

    $("#basket_bt").bind("mouseenter", function()
    {
        $("#cart_details").slideDown(350);
    });

    $("#cart_details").bind("mouseleave", function()
    {
        $(this).fadeOut(200);
    });


});