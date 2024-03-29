# Set the default text field size when input is a string. Default is 50.
# Formtastic::SemanticFormBuilder.default_text_field_size = 50

# Set the default text area height when input is a text. Default is 20.
# Formtastic::SemanticFormBuilder.default_text_area_height = 5

# Should all fields be considered "required" by default?
# Rails 2 only, ignored by Rails 3 because it will never fall back to this default.
# Defaults to true.
# Formtastic::SemanticFormBuilder.all_fields_required_by_default = true

# Should select fields have a blank option/prompt by default?
# Defaults to true.
# Formtastic::SemanticFormBuilder.include_blank_for_select_by_default = true

# Set the string that will be appended to the labels/fieldsets which are required
# It accepts string or procs and the default is a localized version of
# '<abbr title="required">*</abbr>'. In other words, if you configure formtastic.required
# in your locale, it will replace the abbr title properly. But if you don't want to use
# abbr tag, you can simply give a string as below
# Formtastic::SemanticFormBuilder.required_string = "(required)"

# Set the string that will be appended to the labels/fieldsets which are optional
# Defaults to an empty string ("") and also accepts procs (see required_string above)
# Formtastic::SemanticFormBuilder.optional_string = "(optional)"

# Set the way inline errors will be displayed.
# Defaults to :sentence, valid options are :sentence, :list and :none
# Formtastic::SemanticFormBuilder.inline_errors = :sentence

# Set the method to call on label text to transform or format it for human-friendly
# reading when formtastic is used without object. Defaults to :humanize.
# Formtastic::SemanticFormBuilder.label_str_method = :humanize

# Set the array of methods to try calling on parent objects in :select and :radio inputs
# for the text inside each @<option>@ tag or alongside each radio @<input>@. The first method
# that is found on the object will be used.
# Defaults to ["to_label", "display_name", "full_name", "name", "title", "username", "login", "value", "to_s"]
# Formtastic::SemanticFormBuilder.collection_label_methods = [
#   "to_label", "display_name", "full_name", "name", "title", "username", "login", "value", "to_s"]

# Formtastic by default renders inside li tags the input, hints and then
# errors messages. Sometimes you want the hints to be rendered first than
# the input, in the following order: hints, input and errors. You can
# customize it doing just as below:
# Formtastic::SemanticFormBuilder.inline_order = [:input, :hints, :errors]

# Specifies if labels/hints for input fields automatically be looked up using I18n.
# Default value: false. Overridden for specific fields by setting value to true,
# i.e. :label => true, or :hint => true (or opposite depending on initialized value)
Formtastic::SemanticFormBuilder.i18n_lookups_by_default = true

# You can add custom inputs or override parts of Formtastic by subclassing SemanticFormBuilder and
# specifying that class here.  Defaults to SemanticFormBuilder.
# Formtastic::SemanticFormHelper.builder = MyCustomBuilder
module Formtastic
  module DatePicker
    protected

    def datepicker_input(method, options = {})
      format = options[:format] || I18n.t("date.formats.default") || '%d-%m-%Y'
      string_input(method, datepicker_options(format, method, object.send(method)).deep_merge(options))
    end

    # Generate html input options for the datepicker_input
    #
    def datepicker_options(format, method, value = nil)
      datepicker_options = {:label_html =>  {:class => "date"}, :input_html => {:id => "datepicker", :class => 'formtastic-ui-datepicker datepicker', :value => value.try(:strftime, format)}}
    end
  end
  module WeekPicker
    protected

    def weekpicker_input(method, options = {})
      format = options[:format] || I18n.t("date.formats.default") || '%d-%m-%Y'
      string_input(method, weekpicker_options(format, method, object.send(method)).deep_merge(options))
    end

    # Generate html input options for the datepicker_input
    #
    def weekpicker_options(format, method, value = nil)
      weekpicker_options = {:label_html =>  {:class => "date"}, :input_html => {:id => "weekpicker", :class => 'formtastic-ui-weekpicker weekpicker', :value => value.try(:strftime, format)}}
    end
  end
end
Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
Formtastic::SemanticFormBuilder.send(:include, Formtastic::WeekPicker)

module Formtastic
  class SemanticFormBuilder
      def find_collection_for_column(column, options) #:nodoc:
        collection = find_raw_collection_for_column(column, options)
        options[:sort] ||= true

        # Return if we have an Array of strings, fixnums or arrays
        return collection if (collection.instance_of?(Array) || collection.instance_of?(Range)) &&
                             [Array, Fixnum, String, Symbol].include?(collection.first.class) &&
                             !(options.include?(:label_method) || options.include?(:value_method))

        label, value = detect_label_and_value_method!(collection, options)
        collection = collection.sort_by(&label.to_sym) if options[:sort]
        collection.map { |o| [send_or_call(label, o), send_or_call(value, o)] }
      end
  end
end