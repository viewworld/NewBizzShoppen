module ETemplate
  module ETemplate::SomeStaff

    LIQUID_PROXY_PATH = File.join(File.dirname(__FILE__), 'lib','templates','models','liquid_proxy.rb')
    MIGRATION_TEMPLATE_PATH = File.join(File.dirname(__FILE__), 'lib','templates','db','migrate','migration_template.rb')
    MODEL_TEMPLATE_PATH = File.join(File.dirname(__FILE__), 'lib','templates','models','model_template.rb')
    MAILER_PATH = File.join(File.dirname(__FILE__), 'lib','templates','models','application_mailer.rb')
    MAILER_VIEW_PATH = File.join(File.dirname(__FILE__), 'lib','templates','views','application_mailer','_email_template.dryml')
    CONTROLLER_TEMPLATE_PATH = File.join(File.dirname(__FILE__), 'lib','templates','controllers','email_templates_controller.rb')
    VIEWS_TEMPLATE_PATH = File.join(File.dirname(__FILE__), 'lib','templates','views','email_templates')

    def ask(string)
      print string
      (out = STDIN.gets.strip).blank? ? nil : out
    end

    def get_filename(path)
      File.basename(path)
    end

    def get_directories_without_file(path)
      path.sub(get_filename(path), "")
    end

    def prepare(class_type, template_name, mailer_name = nil)
      case class_type
      when :migration
        path = MIGRATION_TEMPLATE_PATH
      when :model
        path = MODEL_TEMPLATE_PATH
      when :controller
        path = CONTROLLER_TEMPLATE_PATH
      when :mailer
        path = MAILER_PATH
      when :mailer_view
        path = MAILER_VIEW_PATH
      end
      filter_text(File.open(path, "r").read, template_name, mailer_name)
    end

    def prepare_views(template_name)
      result = {}
      Dir.glob(File.join(VIEWS_TEMPLATE_PATH, '*')).each do |f|
        result[get_filename(f)] = filter_text(File.open(f, "r").read, template_name)
      end
      result
    end

    def filter_text(text, template_name, mailer_name = nil)
      text.gsub!("CreateEmailTemplates", "Create#{template_name.classify.pluralize}")
      text.gsub!("EmailTemplate.", "#{template_name.classify}.")
      text.gsub!("class EmailTemplate", "class #{template_name.classify}")
      text.gsub!("class EmailTemplatesController", "class #{template_name.classify.pluralize}Controller")
      text.gsub!("@email_templates", "@#{template_name.underscore.pluralize}")
      text.gsub!("@email_template", "@#{template_name.underscore.singularize}")
      text.gsub!(":email_templates", ":#{template_name.underscore.pluralize}")
      text.gsub!("email_templates_path", "#{template_name.underscore.pluralize}_path")
      text.gsub!("get_email_template", "get_#{template_name.underscore.singularize}")
      text.gsub!("new_email_template_path", "new_#{template_name.underscore.singularize}_path")
      text.gsub!("edit_email_template_path", "edit_#{template_name.underscore.singularize}_path")
      text.gsub!("email_template", "#{template_name.underscore.singularize}")
      text.gsub!("class ApplicationMailer", "class #{mailer_name.classify.singularize}") if mailer_name
      text.gsub!("ApplicationMailer.", "#{mailer_name.classify.singularize}.") if mailer_name
      text
    end

    def create_file(path, body)
      FileUtils.mkdir_p get_directories_without_file(path)
      file = File.open(path, "w")
      file.write(body)
      file.close
    end

    def add_method_mailer(path)
      sentinel = '< ActionMailer::Base'
      text = (file = File.open(MAILER_PATH, "r")).read
      method = text.scan(/^\s*def email_template[\s\S]*^/).first
      file.close
      text = (file = File.open(path, "r")).read
      text.sub!(sentinel, "#{sentinel}\n#{method}")
      file.reopen(file.path, "w")
      file.write(text)
      file.close
    end
  end
end

begin
  require 'rubygems'
  require 'active_record'
  require 'fileutils'
  require 'ftools'

  include ETemplate::SomeStaff

  template_name = ask("\n!!!Select name for template model(EmailTemplate): ") || "EmailTemplate"
  mailer_name = ask("\n!!!Select name for mailer class(ApplicationMailer): ") || "ApplicationMailer"

  create_file(
    File.join("db", "migrate", "#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_#{template_name.underscore.pluralize}.rb"),
    prepare(:migration, template_name)
  )

  create_file(
    File.join("app", "models", "#{template_name.underscore.singularize}.rb"),
    prepare(:model, template_name, mailer_name)
  )

  if File.exist?(path = File.join("app", "models", "#{mailer_name.underscore.singularize}.rb"))
    add_method_mailer(path)
  else
    create_file(
      File.join("app", "models", "#{mailer_name.underscore.singularize}.rb"),
      prepare(:mailer, template_name, mailer_name)
    )
  end

  create_file(
    File.join("app", "views", "#{mailer_name.underscore.singularize}", "#{template_name.underscore.singularize}.html.erb"),
    prepare(:mailer_view, template_name, mailer_name)
  )

  FileUtils.cp(ETemplate::SomeStaff::LIQUID_PROXY_PATH, File.join("app", "models", "liquid_proxy.rb"))

  create_file(
    File.join("app", "controllers", "#{template_name.underscore.pluralize}_controller.rb"),
    prepare(:controller, template_name)
  )

  prepare_views(template_name).each_pair do |file, body|
    create_file(
      File.join("app", "views", "#{template_name.underscore.pluralize}", file),
      body
    )
  end

  sentinel = 'ActionController::Routing::Routes.draw do |map|'
  route = "map.resources :#{template_name.underscore.pluralize}, :collection => {:send_template => [:post]}"
  text = (file = File.open(File.join("config", "routes.rb"), "r")).read
  text.sub!(sentinel, "#{sentinel}\n  #{route}\n")
  file.reopen(file.path, "w")
  file.write(text)
  file.close
end