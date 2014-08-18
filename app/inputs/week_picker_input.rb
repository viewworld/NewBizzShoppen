class WeekPickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge({
        id: "weekpicker",
        class: "formtastic-ui-weekpicker weekpicker"
      })
  end
end
