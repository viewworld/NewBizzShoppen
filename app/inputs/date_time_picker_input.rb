class DateTimePickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge({
        class: "datetimepicker"
      })
  end
end
