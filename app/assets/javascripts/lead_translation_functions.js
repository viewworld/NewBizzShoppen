    function add_fields(link, content) {
        if ($('#locale_picker').text() != null)
        {
            var new_id = new Date().getTime();
            var regexp = new RegExp("");
            content = content.replace(/lead_translations_attributes_\d+/g, "lead_translations_attributes_" + nestedFormsCount.toString());
            content = content.replace(/\[lead_translations_attributes\]\[\d+\]/g, "[lead_translations_attributes][" + new_id.toString() + "]");
            content = content.replace(/LOCALE_LANG/, $('#locale_picker').val());
            $('.nested_locale_container:last').append(content);
            $('.locale_hidden_field:last').val($('#locale_picker').val());
            $('.locale_title:visible:last').html(language_names[$('#locale_picker').val()]);
            $('.lead_template_value_translations_container_' + $('#locale_picker').val()).show();
            $('.destroy_hidden_field_template_value_tr_' + $('#locale_picker').val()).val('');
            $("#locale_picker option[value=" + $('#locale_picker').val() + "]").remove();
            nestedFormsCount = nestedFormsCount + 1;
            if ($("#locale_picker option[value!='']").size() == 0) {
                $("#locale_picker_div").hide();
            }
        }
    }

        function remove_language(id, locale, record_id) {
            nestedFormsCount = nestedFormsCount - 1;
            $('.lead_template_value_translations_container_' + locale).hide();
            $('.destroy_hidden_field_template_value_tr_' + locale).val('true');
            $('#locale_picker').append($("<option></option>").attr("value", locale).text(language_names[locale]));
            if (record_id == null) {
                $('#lead_translation_form_' + id).remove();
            }
            else {
                $('#lead_translation_form_' + id).hide();
                $('#destroy_hidden_field_' + record_id.toString()).val('true')
            }
            $("#locale_picker_div").show();
        }