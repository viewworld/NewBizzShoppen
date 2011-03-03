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
