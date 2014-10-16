class EmailTemplate < ActiveRecord::Base
  include EmailTemplateHelp

  translates :subject, :body
  has_one :email_template_signature, as: :related
  has_many :email_template_translations
  belongs_to :resource, polymorphic: true

  validates_presence_of :subject, :from, :body
  validates_uniqueness_of :uniq_id, scope: [:resource_type,:resource_id]
  after_validation :check_syntax

  accepts_nested_attributes_for :email_template_signature, allow_destroy: true

  attr_protected :template
  attr_accessor :to, :preview, :enable_custom_signature, :country, :custom_email_template_signature

  scope :global, where("resource_type IS NULL and resource_id IS NULL")

  amoeba do
    enable
  end

  def can_be_managed_by?(user)
    user.admin? or (user.call_centre? and (resource.creator == user or resource.users.include?(user)))
  end

  def body_sanitized
    body.gsub(/\n/,"").gsub(/\r/,"").gsub(/[']/, '\\\\\'')
  end

  def chosen_signature
    custom_email_template_signature || email_template_signature || country.try(:email_template_signature)
  end

  def signature
    chosen_signature.try(:body) || ""
  end

  def blank_template?
    uniq_id == "blank_template"
  end

  def check_syntax
    errors.add :template, @syntax_error unless @syntax_error.nil?
  end

    def render_subject(options = {})
    Liquid::Template.parse(subject).render options
  end

  def body=(text)
    self[:body] = text

    begin
      @template = Liquid::Template.parse(text)
      self[:template] = @template.to_yaml

    rescue Liquid::SyntaxError => error
      @syntax_error = error.message
    end
  end

  def render(options = {})
    template.render options.stringify_keys
  end

  def deliver_to(address, options = {})
    options[:cc] ||= cc unless cc.blank?
    options[:bcc] ||= bcc unless bcc.blank?

    # Liquid doesn't like symbols as keys
    options = options.inject({}) { |h,(k,v)| h[k.to_s] = v; h }
    ApplicationMailer.email_template(address, self, options).deliver
  end

  def to_s
    "[EmailTemplate] From: #{from}, '#{subject}': #{body}"
  end

  def self.get_hash_with_available_objects_and_methods
    r = {}
    classes = Dir.glob("app/models/**/*.rb").map{ |path| path.sub('app/models/','').split('/').map{|p| p.gsub('.rb','').split('_').map(&:capitalize).join} * '::' }
    classes.each do |model_name|

      model = model_name.constantize
      if model.instance_methods.include?('to_liquid')
        r[model.to_s.gsub('::','_').underscore.to_sym] = model::LIQUID_METHODS.call(self).keys if model.constants.include?('LIQUID_METHODS')
      end
    end
    r
  end

  def self.duplicate(uniq_id)
    template = global.where(uniq_id: uniq_id).first
    duplicated_template = template.dup

    template.translations.each do |translation|
      duplicated_template.translations << translation.dup
    end

    duplicated_template
  end

  private

  #Template cannot be cached due to dynamic translations
  def template
    template_content = body
    template_content += signature.to_s unless preview
    Liquid::Template.parse(template_content)
  end
end
