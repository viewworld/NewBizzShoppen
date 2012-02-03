class AdvancedImportProxy

  def initialize(object, uploaded_file_path, object_field, spreadsheet_field, current_user, unique_only)
    @temp_dir = "public/system/import_temp"
    @temp_file = "#{Pathname(uploaded_file_path).basename.to_s}"
    @temp_file_path = "#{@temp_dir}/#{@temp_file}"
    FileUtils.mkdir_p(Rails.root.join(@temp_dir))
    FileUtils.cp(uploaded_file_path, @temp_file_path)
    @object = object
    @object_field = object_field
    @spreadsheet_field = spreadsheet_field
    @current_user = current_user
    @unique_only = unique_only
  end

  def import!
    @result = @object.class.advanced_import_contacts_from_xls(Sheet.new(@temp_file_path, true).roo_instance,
                                              @object_field,
                                              @spreadsheet_field,
                                              @current_user,
                                              @object.id,
                                              @unique_only)
    if !@result
      notify!(:advanced_import_fail)
    elsif !@result[:errors].blank?
      notify!(:advanced_import_success_with_errors, {:errors => @result[:errors], :counter => @result[:counter]})
    else
      notify!(:advanced_import_success, {:counter => @result[:counter]})
    end
  end

  def notify!(template, params={})
    TemplateMailer.new(
        @current_user.email,
        template.to_sym,
        Country.get_country_from_locale,
        {:user => @current_user, :target_class => @object.class.to_s, :target_name => @object.name, :sender_id => nil}.merge(params)).deliver!
  end

end