//setCategory = function(id) {
//    $('#search_with_category').val(id);
//    $('#search_new').submit();
//};

function mark_all_cbs_with_selector(t) {
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


jQuery(document).ready(function() {
    loadScripts();
});

function loadScripts() {
    /* --- subcategories > show/hide ---*/

    $("table td > ul.category_children_tree").hide();

    $(".hide_subcategory").bind("click", function() {
        $(this).hide()
                .prev().show()
                .parent().prev(".category_children_tree").slideUp();
    });

    $(".show_subcategory").bind("click", function() {
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

    if ($('table').has("a.default_action").length != 0) {
//      old method
//      $('td:not(.cl, .cr, .tda)', 'table tbody tr:not(.pagination, .main_actions)').filter(":not(:has(:checkbox, select, a))")
        $('tr:has(.default_action) td,td h4').filter(":not(:has(:checkbox, select, a))")
                .addClass("pointer")
                .click(function() {
            var link = $(this).parent().find('a.default_action');
            var link_confirm_msg = $(this).parent().find('input.default_action_confirmation_msg');
            if (link.attr("data-method") || link.attr("data-remote")) {
                if (link_confirm_msg.val() == undefined) {
                    link.trigger("click");
                }
                else {
                    if (confirm(link_confirm_msg.val())) {
                        link.trigger("click");
                    }
                }
            }
            else {
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
    try {
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
    catch(e) {
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

    $("#basket_bt").bind("mouseenter", function() {
        $("#cart_details").slideDown(250);
    });

    $("#cart_details").bind("mouseleave", function() {
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
    $('.search_box #search_new').click();
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

function show_briefing(briefing_html) {
    $("#agent_work_screen_call_result").html(briefing_html);
    $("#agent_work_screen_dashboard").toggle();
    $("#agent_work_screen_call_result").toggle();
    $('#new_result_form').toggle();
    if ($("a:.bt_grey_small").attr('href') == "/callers/campaigns") {
        $("a:.bt_grey_small").attr('href', "javascript:show_briefing('');")
    }
    else {
        $("a:.bt_grey_small").attr('href', "/callers/campaigns")
    }
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

function uncheck_category_checkboxes() {
    $("input:checkbox:checked[id^=category_]").attr('checked', false);
}

var materials_repository_files = [];

function select_checkbox_for_file_from_repository(field_id, material_id) {
    selected_index = -1;
    $.each(window.materials_repository_files, function(index, value) {
        if (value[0] == material_id) {
            selected_index = index;
        }
    });
    value = 0;
    if (window.materials_repository_files[selected_index][2] == 1) {
        value = 0;
    } else {
        value = 1;
    }
    window.materials_repository_files[selected_index][2] = value;
    insert_material_ids_to_value(field_id);
}

function select_file_from_repository(field_id, material_id, material_file_name) {
    if (jQuery.inArray(material_id, $.map(window.materials_repository_files, function (e) {
        return e[0]
    })) == -1) {
        window.materials_repository_files.push([material_id, material_file_name, 1]);
    }

    $('#material_' + field_id + '_name').html($.map(window.materials_repository_files,
            function (e) {
                return "<input type=\"checkbox\"" + [' ' ,' checked=checked '][e[2]] + "value=\"1\" name=\"material_selected_12\" id=\"material_selected_" + material_id.toString() + "\" onclick=\"select_checkbox_for_file_from_repository(\'" + field_id + "\'," + e[0] + ")\">" + e[1]
            }).join('<br />'));
    insert_material_ids_to_value(field_id);
}

function insert_material_ids_to_value(field_id) {
    active_materials = $.grep(window.materials_repository_files, function(n, i) {
        return (n[2] == 1);
    });
    $('#material_' + field_id).attr('value', $.map(active_materials,
            function (e) {
                return e[0]
            }).join(','));
}

function select_file_from_repository_dialog(field_id, material_id, material_file_name) {
    select_file_from_repository(field_id, material_id, material_file_name);
    $('#materials_dialog').dialog('close');
}

function serialize_material_repository_array() {
    return "[" + $.map(window.materials_repository_files,
            function (e) {
                return "[" + e[0] + ", \"" + e[1] + "\"," + e[2] + "]"
            }).join(",") + "]"
}

function deserialize_material_repository_array(serialized_array) {
    if (serialized_array != "") {
        return eval(serialized_array)
    }
    else {
        return []
    }
}

function advanced_import_next_button(error_message) {
    if ($('#sortable_object_fields li').length == $('#sortable_spreadsheet_fields li').length) {
        cf_array = new Array;
        sf_array = new Array;
        $('#sortable_object_fields li span').each(function(index) {
            cf_array.push($(this).text());
        });
        $('#sortable_spreadsheet_fields li').each(function(index) {
            sf_array.push($(this).text());
        });
        $('#object_field').val(cf_array);
        $('#spreadsheet_field').val(sf_array);
        $('#go_to_browse_page_form').submit();
    } else {
        alert(error_message)
    }
}

function advanced_import_load_sortable_lists(){
    $("#sortable_object_fields, #sortable_object_fields_removed").sortable({
        items: "li:not(.disabled)",
        connectWith: ".sortable_object_fields_class"
    }).disableSelection();

    $("#sortable_spreadsheet_fields, #sortable_spreadsheet_fields_removed").sortable({
        items: "li:not(.disabled)",
        connectWith: ".sortable_spreadsheet_fields_class"
    }).disableSelection();
}

function show_all_pages(form_id, is_enabled){
    $('#show_all').val(is_enabled);
    $(form_id).submit();
}

function submit_category_filter_form(form_id){
    $('input[type=checkbox][id^=category]').attr("checked", "");
    $('#category_' + $('#category_selector').val()).attr("checked", "checked");
    $(form_id).submit();
}