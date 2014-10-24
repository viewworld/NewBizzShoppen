class TimePickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge({
      class: "timepicker"
    })
  end
end
