//setCategory = function(id) {
//    $('#search_with_category').val(id);
//    $('#search_new').submit();
//};

function mark_all_cbs_with_selector(t)
{
    var tr = $(t).parents('table').find("tr:not(.main_actions)");

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
        loadScripts();
    });

function loadScripts() {
    /* --- subcategories > show/hide ---*/

    $(".categories_tree > li > ul.category_children_tree").hide();

    $(".hide_subcategory").bind("click", function()
    {
        $(this).hide()
               .prev().show()
               .parent().prev(".category_children_tree").slideUp();
    });

    $(".show_subcategory").bind("click", function()
    {
        $(this).hide()
               .next().show()
               .parent().prev(".category_children_tree").slideDown();
    });




    /* --- hints for inputs --- */
    $(".inputs_hint").each(function() {
        $(this).qtip({
            content: $(this).parent().next('.hidden'),
            position: {
                corner: {
                    target: 'rightMiddle',
                    tooltip: 'leftMiddle'
                },
                adjust: {
                    x: 5
                }
            },
            hide: {
                fixed: true
            },
            style: {
                name: "cream",
                border: {
                    radius: 3
                },
                tip: {
                    corner: 'leftMiddle',
                    size: {
                        x: 8,
                        y : 12
                    }
                }
            }
        });
    });


    /*--- clickable tr in leads browsing --- */

    if ($('table').has("a.default_action").length != 0)
    {
//      old method
//      $('td:not(.cl, .cr, .tda)', 'table tbody tr:not(.pagination, .main_actions)').filter(":not(:has(:checkbox, select, a))")
        $('tr:has(.default_action) td').filter(":not(:has(:checkbox, select, a))")
                .addClass("pointer")
                .click(function()
        {
            var link = $(this).parent().find('a.default_action');
            var link_confirm_msg = $(this).parent().find('input.default_action_confirmation_msg');
            if (link.attr("data-method") || link.attr("data-remote"))
            {
                if (link_confirm_msg.val() == undefined)
                {
                    link.trigger("click");
                }
                else
                {
                    if (confirm(link_confirm_msg.val())) {
                        link.trigger("click");
                    }
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

    $('.td_actions a').live("mouseenter", function() {
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
        $("a[id*='modal_box']").colorbox({
            opacity: "0.5",
            initialWidth: 200,
            initialHeight: 200
        })
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
        $("#cart_details").slideDown(250);
    });

    $("#cart_details").bind("mouseleave", function()
    {
        $(this).fadeOut(200);
    });


}

function set_contacts_id_hf(field_name) {
    $('#' + field_name).val('');
    $.each($('.cb_contact_id'), function() {
        if ($('#' + this.id).attr('checked')) {
            $('#' + field_name).val($('#' + field_name).val() + ',' + $('#' + this.id).val())
        }
    });
}

function clear_filter() {
    $.each($(".search_box form input"), function(idx, input) {
        switch (input.type) {
            case 'text': input.value = ''; break;
        }
    });
    $.each($(".search_box form option:selected"), function(idx, option) {
        option.selected = false;
    });
    $('.search_box #search_new').submit();
}

function show_agent_work_screen_dashboard() {
    $("#agent_work_screen_call_result").html("");
    $("#agent_work_screen_call_result").hide();
    $("#agent_work_screen_dashboard").show();
}

function show_agent_work_screen_call_result(call_result_html) {
    $("#agent_work_screen_call_result").html(call_result_html);
    $("#agent_work_screen_dashboard").hide();
    $("#agent_work_screen_call_result").show();
}


function display_notice(message, withTimeout) {
    $("#flashes .flash_notice").html(message);
    $("#flashes .flash_notice").show();
    if (withTimeout)
        window.time_out_for_display_notice = setTimeout('$("#flashes .flash_notice").hide()', 5000);
    else
        clearTimeout(window.time_out_for_display_notice);
}

function display_alert(message, withTimeout) {
    $("#flashes .flash_alert").html(message);
    $("#flashes .flash_alert").show();
    if (withTimeout)
        window.time_out_for_display_notice = setTimeout('$("#flashes .flash_notice").hide()', 5000);
    else
        clearTimeout(window.time_out_for_display_notice);
}

function displayWorkScreenTab(tab_id) {
    var tab_ids = ["#results_sheet", "#call_sheet", "#pending_calls", "#completed_contacts"];
    tab_ids = $.grep(tab_ids, function(value) {
      return value != tab_id;
    });   
    $(tab_ids.join(",")).hide();
    $(tab_id).show();
}

function uncheck_category_checkboxes(){
    $("input:checkbox:checked[id^=category_]").attr('checked', false);
}