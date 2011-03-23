$(document).ajaxStart(function(){
  $('#global_loader').show();
});

$(document).ajaxStop(function(){
  $('#global_loader').hide();
});

$(document).ready(function() {
   $('*.expandable').expander({
      slicePoint:           100,
      widow:                4,
      expandText:           I18n.t("common.js.read_more"),
      expandPrefix:         I18n.t("common.js.expand_prefix"),
      collapseTimer:        0,
      expandEffect:         'fadeIn',
      expandSpeed:          '',
      userCollapse:         true,
      userCollapseText:     I18n.t("common.js.collapse_expanded_text"),
      userCollapsePrefix:   I18n.t("common.js.collapse_prefix"),
      beforeExpand:         function($thisEl) {},
      afterExpand:          function($thisEl) {},
      onCollapse:           function($thisEl, byUser) {}
   });
});

function move_selected(src,dst){
$("#" + src + " option:selected").each(function()
{
    $("#" + dst).
            append($("<option></option>").
            attr("value", $(this).val()).
            text($(this).text()));
    $(this).remove();
});
}

function select_options_to_submit(select_name){
if($("#" + select_name + " option").length == 0)
{
   $("#" + select_name).append($("<option></option>"));
}

$("#" + select_name + " option").each(function()
{
    $(this).attr("selected","selected");
});
}

function clear_regions_select(field_prefix_id) {
    $('#' + field_prefix_id + '_region_id' + ' option').each(function()
    {

        if ($(this).text() != "") {
            $(this).remove();
        }
    });
}

function add_region(field_prefix_id, label, value) {
    $('#' + field_prefix_id + '_region_id').
            append($("<option></option>").
            attr("value", value).
            text(label));
}

function refresh_regions_list(field_prefix_id) {
    $.ajax({
        type: "GET",
        url: "/regions",
        data: "country_id=" + $('#' + field_prefix_id + '_country_id').val() + "&field_prefix=" + field_prefix_id
    });
}

function move_mouse_over(selector){
    $(selector).mouseenter();
}

function refresh_regions_list(field_prefix_id) {
    $.ajax({
        type: "GET",
        url: "/regions",
        data: "country_id=" + $('#' + field_prefix_id + '_country_id').val() + "&field_prefix=" + field_prefix_id
    });
}

function change_invoice_seller(invoice_id,new_seller_id) {
    $.ajax({
        type: "PUT",
        url: "/administration/invoicing/invoices/"+invoice_id+"/seller",
        data: "seller_id=" + new_seller_id
    });
}
