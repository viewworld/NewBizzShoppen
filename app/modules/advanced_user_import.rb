module AdvancedUserImport
  def self.included(base)

    base.send(:extend, ClassMethods)
  end

  module ClassMethods

    def advanced_import_objects_from_xls(options)
      return false unless advanced_import_field_blank_validation(options[:object_fields], options[:spreadsheet_fields])
      object_fields, spreadsheet_fields = options[:object_fields].split(","), options[:spreadsheet_fields].split(",")
      return false unless advanced_import_field_size_validation(object_fields, spreadsheet_fields)

      headers, spreadsheet = advanced_import_headers(options[:spreadsheet])
      merged_fields = advanced_import_merged_fields(headers, object_fields, spreadsheet_fields)
      counter, errors, new_users = 0, [], []

      ActiveRecord::Base.transaction do
        2.upto(spreadsheet.last_row) do |line|
          object = self.new
          import_fields.each { |field| object = assign_field(object, field, spreadsheet.cell(line, merged_fields[field]), spreadsheet.celltype(line, merged_fields[field])) }
          object.created_by = options[:current_user].id
          object.password = object.send(:generate_token, 10)
          object.password_confirmation = object.password
          object.agreement_read = true
          object.assign_free_subscription_plan = true
          if object.save
            new_users << object
            counter += 1
          else
            errors << ("[line: #{line}] " + object.errors.map { |k, v| "#{k} #{v}" }.*(", "))
            counter = 0
            raise ActiveRecord::Rollback
          end
        end
      end

      #sending emails and add categories if
      if counter > 0
        category = options[:category_id].blank? ? nil : LeadCategory.find(options[:category_id])
        new_users.each do |new_user|
          new_user.send_invitation_email
          if category
            new_user.buying_categories << category
            new_user.save
          end
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