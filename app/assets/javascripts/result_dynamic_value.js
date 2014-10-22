function enable_dynamic_value(){
 enabled = $('#result_campaigns_results_attributes_0_is_dynamic_value').attr('checked');
 enable_dynamic_fields(enabled);
 $('#result_campaigns_results_attributes_0_value').attr('disabled', enabled);
}

function enable_dynamic_fields(enabled){
$('select[id*=field_type]').each(function(){
    field_row_id = $(this).closest(".result_field_row").attr('id');
    if($(this).val() == "1"){
        if(enabled){
            $('#' + field_row_id + ' .campaign_dynamic_value_span').show();
        } else
        {
            $('#' + field_row_id + ' .campaign_dynamic_value_span').hide();
        }

	}
    else
    {
        $('#' + field_row_id + ' .campaign_dynamic_value_span').hide();
    }
});
}

function showHideSurveys(){
    if($(event.currentTarget).closest("select[id^=result_result_fields_attributes_][id$=_field_type]").val() == "6"){
        $(event.currentTarget).closest("ol").find("li.survey_id").show()
    } else {
        $(event.currentTarget).closest("ol").find("li.survey_id").hide();
        $(event.currentTarget).closest("ol").find("li.survey_id").find("select").val('')

    }
}