module ApplicationHelper
  include ScopedSearch::Helpers

  class HelperBlocks
    attr_accessor :results

    def initialize(*names)
      @results = {}
      names.each do |name|
        @results["block_#{name}".to_sym] = nil
        eval <<-EOM
            def #{name.to_s}(&block)
              @results[:block_#{name}] = block
            end
        EOM
      end
    end
  end
  
  def fields_for_leads_translations(f)
    new_object = current_user.has_role?(:admin) ? Lead.new : current_user.leads.build
    new_object.lead_translations = [LeadTranslation.new]
    fields = f.fields_for :lead_translations, new_object.lead_translations do |builder|
       render("lead_fields", :f => builder)
    end
    "add_fields(this, \"#{escape_javascript(fields)}\")"
  end

  def custom_error_for_field(form, field)
    if form.object.errors[field].present?
      content_tag(:p, form.object.errors[field], :class => "inline-errors") + tag("br")
    end
  end

  def custom_error_for_object_and_field(object, field)
    if object.errors[field].present?
      content_tag(:p, object.errors[field], :class => "inline-errors") + tag("br")
    end
  end

  def available_locales_list(translations)
    existing = translations.map(&:locale)
    Locale.all.map(&:code).reject { |c| c == I18n.locale.to_s or existing.include?(c) }
  end


  def bulk_form(&block)
    form_tag(bulk_action_path, {:method => :post, :id => 'bulk_actions_form'}, &block)
  end

  def icon(name, alt = nil, opts = {})
    opts[:alt] = alt
    image_tag("bt_icons/#{name.to_s}.png", opts)
  end

  def bt_link_to(icon_name, text, url, opts = {})
    icon_alt   = text || icon_name.to_s.capitalize
    link_class = text.nil? ? "bt bt_icon" : "bt"
    opts[:class].nil? ? opts[:class] = link_class : opts[:class] = "#{link_class} #{opts[:class]}"
    icon_tag   = ""
    icon_tag = icon(icon_name, icon_alt) unless icon_name.nil?
    icon_tag << "#{text}" unless text.nil?
    _url       = 'javascript:void(0)'
    _url = url_for(url) unless url.nil?
    link_to(content_tag(:span, icon_tag), _url, opts)
  end

  def as_currency(number,currency)
    number_to_currency(number, :format => currency.format, :unit => currency.symbol)
  end

  def current_user_has_role?(r)
    current_user && current_user.has_role?(r)
  end

end
