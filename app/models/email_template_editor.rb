module EmailTemplateEditor

  def self.included(base)
    base.class_eval do
      attr_accessor :email_template_subject, :email_template_from, :email_template_bcc, :email_template_cc, :email_template_body
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public

    def customize_email_template(template)
      [:subject, :from, :bcc, :cc, :body].each do |field|
        template.send("#{field}=".to_sym, self.send("email_template_#{field}")) unless self.send("email_template_#{field}").blank?
      end
      template
    end

    def assets_to_path_names(assets)
      if assets.blank?
        []
      else
        assets.map{ |material| material.path_for_email_attachment(material.id.to_s) }
      end
    end
  end
end