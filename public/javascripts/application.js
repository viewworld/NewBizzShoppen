//setCategory = function(id) {
//    $('#search_with_category').val(id);
//    $('#search_new').submit();
//};

function mark_all_cbs_with_selector(t) {
    var tr = $(t).parents('table').find("tr:not(.main_actions)");

    $(t).is(":checked") ? $("input=[type=checkbox]:not(:checked)", tr).attr("checked", "checked")
        : $("input=[type=checkbox]:checked", tr).attr("checked", "");
}

function select_all_contacts_with_result_and_agent(data_attr_name, data_attr_val) {
    $('#select_by_result_id').val();
    $('input.cb_contact_id').each(function(){this.checked=false});
    $('input.cb_contact_id[data-result-id="' + $('#select_by_result_id').val() + '"]').each(function(){this.checked=true});
    $('input.cb_contact_id[data-agent-id="' + $('#select_by_agent_id').val() + '"]').each(function(){this.checked=true});
}

submitBulkForm = function(url, target) {
    $('#route_to').val(url);
    $('#bulk_actions_form').removeAttr("target");
    if (target != undefined) {
        $('#bulk_actions_form').attr("target", target);

    }
    $('#bulk_actions_form').submit();
};

$(document).ajaxSend(function(e, xhr, options) {
    var sid = $("meta[name='csrf-token']").attr("content");
    xhr.setRequestHeader("X-CSRF-Token", sid);
});

jQuery(document).ready(function() {
    loadScripts();
    bindDataSearchFilters();
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
        $('tr:has(.default_action) td, p.element').filter(":not(:has(:checkbox, select, input)):not(.tda):not(:has(div.ajaxful-rating-wrapper))")
            .addClass("pointer")
            .click(
            function() {
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
            }).find("a").bind("click", function(e) {
                e.stopPropagation();
            });
    }

    /*--- clickable featured deals --- */

    if ($("div[id*='secondary_featured_deal_']").has("a.default_action").length != 0) {
        $("div[id*='secondary_featured_deal_']")
            .addClass("pointer")
            .click(function() {
                var link = $(this).find('a.default_action');
                if (link.attr("data-method") || link.attr("data-remote")) {
                    link.trigger("click");
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

function copy_taggable_ids_to_container(taggable_id){
    $("#taggable_ids option").remove();
    $("input:checked[id^=" + taggable_id + "]").each(function(){
        $("#taggable_ids").
            append($("<option></option>").
            attr("value", $(this).val()).
            text($(this).val()));
    });

    $("#taggable_ids  option").each(function()
    {
        $(this).attr("selected","selected");
    });
}

function select_tags_for_tagit(){
    $("selected_tag_names  option").each(function()
    {
        $(this).attr("selected","selected");
    });
}

function clear_filter() {
    $.each($(".search_box form input"), function(idx, input) {
        switch (input.type) {
            case 'text':
                input.value = '';
                break;
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

function displayWorkScreenTab(tab_id, header_translations) {
    var tab_ids = ["#results_sheet", "#call_sheet", "#pending_calls", "#completed_contacts"];
    tab_ids = $.grep(tab_ids, function(value) {
        return value != tab_id;
    });
    $(tab_ids.join(",")).hide();
    $(tab_id).show();
    $('#tab_change_links a').removeClass('bt_active');
    $(tab_id+'_switch_link').addClass('bt_active');
    if (tab_id == '#results_sheet') { $('#tab_change_header').html(header_translations[0])}
    if (tab_id == '#call_sheet') { $('#tab_change_header').html(header_translations[1])}
    if (tab_id == '#pending_calls') { $('#tab_change_header').html(header_translations[2])}
    if (tab_id == '#completed_contacts') { $('#tab_change_header').html(header_translations[3])}
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
            return "<input type=\"checkbox\"" + [' ' ,' checked=checked '][e[2]] + "value=\"1\" name=\"material_selected_" + material_id.toString() + "\" id=\"material_selected_" + material_id.toString() + "\" onclick=\"select_checkbox_for_file_from_repository(\'" + field_id + "\'," + e[0] + ")\">" + e[1]
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

function advanced_import_load_sortable_lists() {
    $("#sortable_object_fields, #sortable_object_fields_removed").sortable({
        items: "li:not(.disabled)",
        connectWith: ".sortable_object_fields_class"
    }).disableSelection();

    $("#sortable_spreadsheet_fields, #sortable_spreadsheet_fields_removed").sortable({
        items: "li:not(.disabled)",
        connectWith: ".sortable_spreadsheet_fields_class"
    }).disableSelection();
}

function show_all_pages(form_id, is_enabled) {
    $('#show_all').val(is_enabled);
    $(form_id).submit();
}

function submit_category_filter_form(form_id) {
    $('input[type=checkbox][id^=category]').attr("checked", "");
    $('#category_' + $('#category_selector').val()).attr("checked", "checked");
    $(form_id).submit();
}

function redirect_to_subcategory() {
    document.location = "/categories/deals/" + $('#category_selector').val()
}

function add_default_action_for_contact_row(id) {
    $('#' + id + ' td, p.element').filter(":not(:has(:checkbox, select)):not(.tda):not(:has(div.ajaxful-rating-wrapper))")
        .addClass("pointer")
        .click(
        function() {
            var link = $(this).parent().find('a.default_action');
            link.trigger("click");
        }).find("a").bind("click", function(e) {
            e.stopPropagation();
        });
}

function reset_class_cycle_for_contact_tables() {
    reset_class_cycle_for_table('call_sheet');
    reset_class_cycle_for_table('pending_calls');
}

function reset_class_cycle_for_table(name) {
    css_class = 'odd';
    $('#' + name + ' table tbody tr').each(function(i, row) {
        $(row).attr('class', css_class);
        css_class = css_class == 'odd' ? 'even' : 'odd';
    })
}

function select_subscription_radio_button(user_class, subscription_plan_id){
    $('input[name=' + user_class + '[subscription_plan_id]][value=' + subscription_plan_id.toString() + ']').click();
}

var notification_interval = 30000;
var notification_limit = 3;

function start_notifications() {
    setTimeout("check_notifications()", notification_interval);
}

function check_notifications() {
    $.getJSON('/notifications.json?per_page=' + notification_limit, function(json){
            if (json.length > 0) {
                $.each(json, function() {
                    $.gritter.add({
                        title: this["notification"].title,
                        text: this["notification"].text,
                        sticky: this["notification"].sticky,
                        id: this["notification"].id,
                        before_open: function(){
                            if($('.gritter-item-wrapper').length == notification_limit)
                                {
                                    // Returning false prevents a new gritter from opening
                                    return false;
                                }
                        },
                        after_open: function(e){
                            var unique_id = e.attr('id').split('-')[2];
                            $('#gritter-item-' + unique_id + ' div.gritter-without-image,div.gritter_with_image').find('p a').click(function(e) {
                                $.gritter.remove(unique_id, {}, null, true);
                            })
                        },
                        before_close: function(e, manual_close){
                            if (manual_close) {
                                $.ajax({
                                  type: 'PUT',
                                  url: '/notifications/' + e.attr('id').split('-')[2] + '.json',
                                  dataType: json
                                });
                            }
                        }
                    });
                });
            }
    });
    setTimeout("check_notifications()", notification_interval);
}

function exportDialog(jqEvent, jqSelectorFormExport, formatsHash) {
    jqEvent.preventDefault();

    var formats = formatsHash || {};
    var buttonsConfig = {};

    var createButtonConfig = function(format) {
        return function() {
            $(this).dialog("close");
            $(jqSelectorFormExport).attr('action', formats[format]);
            $(jqSelectorFormExport).submit();
        }
    }

    for (var key in formats) {
        if (formats[key]) {
            buttonsConfig[key] = createButtonConfig(key);
        }
    }

    $('#select_export_format').dialog({
        height: 125,
        modal: true,
        buttons: buttonsConfig
    });
}

function bindDataSearchFilters() {
    $('a[data-search=true]').each(function() {
        var self = $(this);
        var allAttrs = self.get(0).attributes;
        var prefix = "data-search-attr-";
        self.click(function(e) {
            var searchIds = [];
            e.preventDefault();
            $.each(allAttrs, function() {
                var attr = this;
                if (attr.specified) {
                    if (attr.name.substring(0, prefix.length) == prefix) {
                        var searchId = attr.name.substring(prefix.length, attr.name.length);
                        searchIds.push(searchId);
                        $('#' + searchId).val(attr.value);
                    }
                }
            });
            if (self.attr('data-search-submit-function')) {
                window[self.attr('data-search-submit-function')]();
            } else if (self.attr('data-search-submit') == 'true') {
                if (searchIds.length > 0) {
                    $('#' + searchIds[0]).parents("form").first().submit();
                }
            }
        });
    });
}
