module AdvancedUserImport
  def self.included(base)

    base.send(:extend, ClassMethods)
  end

  module ClassMethods

    def advanced_import_objects_from_xls(spreadsheet, object_fields, spreadsheet_fields, current_user, category_id = nil)
      return false unless advanced_import_field_blank_validation(object_fields, spreadsheet_fields)
      object_fields, spreadsheet_fields = object_fields.split(","), spreadsheet_fields.split(",")
      return false unless advanced_import_field_size_validation(object_fields, spreadsheet_fields)

      headers, spreadsheet = advanced_import_headers(spreadsheet)
      merged_fields = advanced_import_merged_fields(headers, object_fields, spreadsheet_fields)
      counter, errors = 0, []

      2.upto(spreadsheet.last_row) do |line|
        object = self.new
        import_fields.each { |field| object = assign_field(object, field, spreadsheet.cell(line, merged_fields[field]), spreadsheet.celltype(line, merged_fields[field])) }
        object.created_by = current_user.id
        object.password = object.send(:generate_token, 10)
        object.password_confirmation = object.password
        object.agreement_read = true

        if object.save
          object.send_invitation_email(object.password)
          counter += 1
          unless category_id.blank?
            object.buying_categories << LeadCategory.find(category_id)
            object.save
          end
        else
          errors << object.errors.map { |k, v| "#{k} #{v}" }.*(", ")
        end
      end

      {:counter => "#{counter} / #{spreadsheet.last_row-1}", :errors => errors.*("<br/>")}
    end

    def import_fields
      "#{self.to_s}::CSV_ATTRS".constantize
    end

    def required_import_fields
      "#{self.to_s}::REQUIRED_FIELDS".constantize
    end

  end
end