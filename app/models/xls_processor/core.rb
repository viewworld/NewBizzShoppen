class XlsProcessor::Core
  attr_accessor :current_user,
                :email_template,
                :directory,
                :download_path,
                :file_name,
                :template,
                :use_delayed_job

  def initialize(*args)
    options = args.extract_options!
    @current_user = options[:current_user]
    @directory = options[:directory]
    @download_path = options[:download_path]
    @email_template = options[:email_template]
    @file_name = options[:file_name]
    @template = options[:template]
    @use_delayed_job = options[:use_delayed_job]
  end

  def process
    if use_delayed_job
      delay(:queue => current_user.queue).save_and_notify!
      nil
    else
      rendered_string
    end
  end

  private

  def save_and_notify!
    save_file
    notify_by_email!
  end

  def rendered_string
    ActionView::Base.new(Rails.configuration.paths.app.views.first).render(
        :template => template,
        :format => :xls,
        :locals => locals
    )
  end

  def save_file
    FileUtils.mkdir_p(Rails.root.join("#{directory}/#{current_user.id}"))
    File.open(Rails.root.join("#{directory}/#{@current_user.id}/#{file_name_with_timestamp}"), 'w') { |f| f.write(rendered_string) }
  end

  def file_name_with_timestamp
    @file_name_with_timestamp ||= "#{file_name}_#{Time.now.strftime('%Y%m%d%M%S')}.xls"
  end

  def url
    "http://#{@current_user.domain_name}/#{download_path}?file=#{file_name_with_timestamp}"
  end

  def notify_by_email!
    TemplateMailer.new(current_user.email, email_template, Country.get_country_from_locale,
                       {:user => current_user, :timesheet_url => url, :sender_id => nil}).deliver!
  end
end
