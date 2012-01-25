module AdvancedImport
  def self.included(base)
    base.send(:include, ClassMethods)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods

    def advanced_import_from_xls_headers(spreadsheet)
      headers = advanced_import_headers(spreadsheet)[0].uniq.compact()
      headers.join.match(/[^\d\w ]/) ? false : headers
    end

    def advanced_import_from_xls_preview(spreadsheet, model_fields, spreadsheet_fields)
      return false unless advanced_import_field_blank_validation(model_fields, spreadsheet_fields)
      model_fields, spreadsheet_fields = model_fields.split(","), spreadsheet_fields.split(",")
      return false unless advanced_import_field_size_validation(model_fields, spreadsheet_fields)

      headers, spreadsheet = advanced_import_headers(spreadsheet)
      merged_fields = advanced_import_merged_fields(headers, model_fields, spreadsheet_fields)

      rows = []
      2.upto(10) do |line|
        row = {}
        import_fields.each do |field|
          value = spreadsheet.cell(line, merged_fields[field])
          cell_type = spreadsheet.celltype(line, merged_fields[field])
          row[field] = if ["region", "country", "currency"].include?(field)
                         object = import_relation_value(field, value)
                         object ? object.name : ""
                       elsif field == "is_international"
                         import_boolean_value(value) ? I18n.t("shared.leads.form.country_international") : I18n.t("shared.leads.form.country_local_label")
                       elsif field == "published"
                         import_boolean_value(value) ? I18n.t("common.yes_label") : I18n.t("common.no_label")
                       elsif field == "purchase_decision_date"
                         import_date_value(cell_type, value)
                       elsif field.include?("custom|")
                         split_fields = field.split("|")
                         if split_fields[4].to_i == LeadTemplateField::DATE
                           import_date_value(cell_type, value)
                         elsif split_fields[4].to_i != LeadTemplateField::INTEGER and !value.blank? and cell_type == :float
                           import_not_numeric_value(value)
                         else
                           import_regular_value(value)
                         end
                       elsif !Lead::NUMERIC_FIELDS.include?(field) and !value.blank? and cell_type == :float
                         import_not_numeric_value(value)
                       else
                         import_regular_value(value)
                       end
        end
        rows << row
      end
      rows
    end

    private

    def assign_field(object, field, value, cell_type)
      if ["region", "country", "currency"].include?(field) and !object.class.to_s.include?("User::")
        object.send("#{field}=".to_sym, import_relation_value(field, value))
      elsif ["region", "country", "currency"].include?(field) and object.class.to_s.include?("User::")
        object.address.send("#{field}=".to_sym, import_relation_value(field, value))
      elsif ["address_line_1", "address_line_2", "address_line_3", "zip_code"].include?(field) and object.class.to_s.include?("User::")
        object.address.send("#{field}=".to_sym, import_not_numeric_value(value))
      elsif ["is_international", "published"].include?(field)
        object.send("#{field}=".to_sym, import_boolean_value(value))
      elsif field == "purchase_decision_date"
        object.purchase_decision_date = import_date_value(cell_type, value)
      elsif field.include?("custom|")
        split_fields = field.split("|")
        if split_fields[4].to_i == LeadTemplateField::DATE
          object.lead_template_values.build(:lead_template_field_id => split_fields[3], :field_type => split_fields[4], :value => import_date_value(cell_type, value))
        elsif split_fields[4].to_i != LeadTemplateField::INTEGER and !value.blank? and cell_type == :float
          object.lead_template_values.build(:lead_template_field_id => split_fields[3], :field_type => split_fields[4], :value => import_not_numeric_value(value))
        else
          object.lead_template_values.build(:lead_template_field_id => split_fields[3], :field_type => split_fields[4], :value => import_regular_value(value))
        end
      elsif !Lead::NUMERIC_FIELDS.include?(field) and !value.blank? and cell_type == :float
        object.send("#{field}=".to_sym, import_not_numeric_value(value))
      else
        object.send("#{field}=".to_sym, import_regular_value(value))
      end
      object
    end

    def import_lead_templates_fields
      result = []
      lead_templates.each do |lt|
        lt.lead_template_fields.map { |ltf| result << "custom|#{lt.name}|#{ltf.name}|#{ltf.id}|#{ltf.field_type}|#{ltf.is_mandatory}" }
      end
      result
    end

    def import_date_value(cell_type, value)
      cell_type == :date ? Date.parse(value.to_s).strftime("%d %b %Y") : "Invalid date" rescue "Invalid date"
    end

    def import_not_numeric_value(value)
      value.to_s.gsub(/\.0\z/, "")
    end

    def import_boolean_value(value)
      ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value) == true ? true : (!value.blank? and value.class == String and value.downcase == 'yes') ? true : false
    end

    def import_regular_value(value)
      value ? value : ""
    end

    def import_relation_value(field, value)
      field.classify.constantize.find_by_name(value.to_s)
    end

    def advanced_import_headers(spreadsheet)
      spreadsheet.default_sheet = spreadsheet.sheets.first
      headers = []
      1.upto(100) { |row| headers << spreadsheet.cell(1, row) }
      [headers, spreadsheet]
    end

    def advanced_import_field_blank_validation(lead_fields, spreadsheet_fields)
      (spreadsheet_fields.blank? or lead_fields.blank?) ? false : true
    end

    def advanced_import_field_size_validation(lead_fields, spreadsheet_fields)
      spreadsheet_fields.size == lead_fields.size ? true : false
    end

    def advanced_import_merged_fields(headers, lead_fields, spreadsheet_fields)
      spreadsheet_fields_number = spreadsheet_fields.map { |item| headers.index(item)+1 }
      merged_fields = {}
      lead_fields.each_with_index { |item, index| merged_fields[item] = spreadsheet_fields_number[index] }
      merged_fields
    end

  end
end