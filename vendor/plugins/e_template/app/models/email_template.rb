class EmailTemplate < ActiveRecord::Base
  ### Validation
  validates_presence_of :subject, :from, :body

  # http://code.dunae.ca/validates_email_format_of.html
  #validates_email_format_of :from, :allow_nil => true
  #validates_email_format_of :cc, :allow_nil => true
  #validates_email_format_of :bcc, :allow_nil => true

  #
  # Puts the parse error from Liquid on the error list if parsing failed
  #
  def after_validation
    errors.add :template, @syntax_error unless @syntax_error.nil?
  end

  ### Attributes
  attr_protected :template
  attr_accessor :to

  def render_subject(options = {})
    Liquid::Template.parse(subject).render options
  end

  #
  # body contains the raw template. When updating this attribute, the
  # email_template parses the template and stores the serialized object
  # for quicker rendering.
  #
  def body=(text)
    self[:body] = text

    begin
      @template = Liquid::Template.parse(text)
      self[:template] = @template.to_yaml

    rescue Liquid::SyntaxError => error
      @syntax_error = error.message
    end
  end

  ### Methods

  #
  # Delivers the email
  #
  def deliver_to(address, options = {})
    options[:cc] ||= cc unless cc.blank?
    options[:bcc] ||= bcc unless bcc.blank?

    # Liquid doesn't like symbols as keys
    options = options.inject({}) { |h,(k,v)| h[k.to_s] = v; h }
    ApplicationMailer.email_template(address, self, options).deliver
  end

  #
  # Renders body as Liquid Markup template
  #
  def render(options = {})
    template.render options.stringify_keys
  end

  #
  # Usable string representation
  #
  def to_s
    "[EmailTemplate] From: #{from}, '#{subject}': #{body}"
  end

  def self.get_hash_with_available_objects_and_methods
    r = {}
    Dir.glob("app/models/**/*.rb").map{|path| path.sub('app/models/','').split('/').map{|p| p.gsub('.rb','').split('_').map(&:capitalize).join}*'::'}.each do |model_name|

      model = model_name.constantize
      if model.instance_methods.include?('to_liquid')
        r[model.to_s.gsub('::','_').underscore.to_sym] = model::LIQUID_METHODS.call(self).keys if model.constants.include?('LIQUID_METHODS')
      end
    end
    r
  end

 private
  #
  # Returns a usable Liquid:Template instance
  #
  def template
    return @template unless @template.nil?

    if self[:template].blank?
      @template = Liquid::Template.parse body
      self[:template] = @template.to_yaml
      save
    else
      @template = YAML::load self[:template]
    end

    @template
  end
end