class AdvancedImportProxy

  def initialize(object, object_id, method, uploaded_file_path, notify_user, options={})
    @object_id = object_id
    if object.instance_of?(Class)
      @target_class = object.to_s
    else
      @target_object = object
    end
    @method = method
    @uploaded_file_path = uploaded_file_path
    @notify_user = notify_user
    @options = options
    @temp_dir = "public/system/import_temp"
    @temp_file = "#{Pathname(@uploaded_file_path).basename.to_s}"
    @temp_file_path = "#{@temp_dir}/#{@temp_file}"
    FileUtils.mkdir_p(Rails.root.join(@temp_dir))
    FileUtils.cp(@uploaded_file_path, @temp_file_path)
  end

  def import!
    @target = @target_class.present? ? @target_class.constantize : @target_object
    @result = @target.send(@method.to_sym, @options.merge(:spreadsheet => Sheet.new(@temp_file_path, true).roo_instance))
    if !@result
      notify!(:advanced_import_fail)
    elsif !@result[:errors].blank?
      notify!(:advanced_import_success_with_errors, {:errors => @result[:errors], :counter => @result[:counter]})
    else
      notify!(:advanced_import_success, {:counter => @result[:counter]})
    end
  end

  def notify!(template, params={})
    target_class = @target_class.present? ? @target_class : @target_object.class.name
    TemplateMailer.new(
        @notify_user.email,
        template.to_sym,
        Country.get_country_from_locale,
        {:user => @notify_user, :target_class => target_class, :sender_id => nil}.merge(params)).deliver!
  end

end