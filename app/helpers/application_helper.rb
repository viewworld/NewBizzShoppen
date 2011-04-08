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
    new_object = current_user.has_any_role?(:admin, :call_centre) ? Lead.new : current_user.leads.build
    new_object.lead_translations = [LeadTranslation.new]
    fields = f.fields_for :lead_translations, new_object.lead_translations do |builder|
       render("/shared/leads/lead_fields", :f => builder)
    end
    "add_fields(this, \"#{escape_javascript(fields)}\")"
  end

  def fields_for_leads_template_fields(f)
    lead_template_field = LeadTemplateField.new
    fields = f.fields_for :lead_template_fields, lead_template_field do |builder|
       render("/shared/lead_templates/lead_template_field_fields", :f => builder)
    end
    "add_lead_template_field(this, \"#{escape_javascript(fields)}\")"
  end

  def fields_for_result_fields(f)
    result_field = ResultField.new
    fields = f.fields_for :result_fields, result_field do |builder|
       render("/shared/results/result_field_fields", :f => builder)
    end
    "add_result_field(this, \"#{escape_javascript(fields)}\")"
  end  

  def fields_for_region_fields(f)
    region = Region.new
    fields = f.fields_for :regions, region do |builder|
       render("region_fields", :f => builder)
    end
    "add_region(this, \"#{escape_javascript(fields)}\")"
  end

  def available_templates_list(lead)
    lead.lead_templates(false).reject { |lt| lt.is_filled_out_for(lead) }
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
    Locale.all.map(&:code).reject { |c| c == I18n.locale.to_s or existing.include?(c) }.map { |c| [t('models.locale.' + c), c] }
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
     if currency
      number_to_currency(number,
                         :format => currency.format,
                         :unit => currency.symbol,
                         :precision => t("number.format.precision").to_i)
    else
      number_to_currency(number,
                         :precision => t("number.format.precision").to_i,
                         :unit => "")
    end
  end

  def current_user_has_role?(r)
    current_user && current_user.has_role?(r)
  end

  def current_user_has_any_role?(r)
    current_user && current_user.has_any_role?(r)
  end

  def main_menu_link_to_role_specific_home_page
    if @home_category
      if controller.class.name =~ /CategoryHome/
        main_menu_link_to(t("layout.main_menu.shared.site_home"), root_path, :tab => "home")
      else
        main_menu_link_to(t("layout.main_menu.shared.home"), category_home_page_path(@home_category.cached_slug), :tab => "home")
      end
    elsif !user_signed_in? or (['buyer_home', 'agent_home', 'purchase_manager_home'].include?(params[:controller]) and params[:action] == "show")
      main_menu_link_to((user_signed_in? or params[:controller].include?("_home")) ? t("layout.main_menu.shared.site_home") : t("layout.main_menu.shared.home"), root_path, :tab => "home")
    else
      main_menu_link_to(t("layout.main_menu.shared.home"), url_to_role_specific_home_page, :tab => "home")
    end
  end

  def url_to_role_specific_home_page
    if !user_signed_in? or (['buyer_home', 'agent_home', 'purchase_manager_home'].include?(params[:controller]) and params[:action] == "show")
      root_path
    else
      if @home_category and current_user.has_role?(:category_buyer)
        category_home_page_path(@home_category.cached_slug)
      elsif current_user.has_role?(:call_centre)
        agent_home_path
      elsif current_user.has_any_role?(:customer, :lead_buyer, :lead_user, :agent, :purchase_manager)
        (current_user.has_any_role?(:customer, :lead_buyer, :lead_user)) ? buyer_home_path : self.send("#{current_user.role.to_s}_home_path")
      else
        root_path
      end
    end
  end

  def link_to_view_templates(category)
    if user_signed_in? and current_user.can_create_lead_templates? and !current_user.has_role?(:admin)
      role = current_user.role.to_s.pluralize
      link_to(t("categories.index.view.view_lead_templates"), self.send("#{role}_lead_templates_path", :search => { :with_category => category.id }), :class => "text_action")
    end
  end

  def link_to_edit_lead(lead)
    if current_user and (current_user == lead.creator or current_user.has_role?(:admin))
      link_to(t("leads.listing.edit_label"), send("edit_#{current_user.has_role?(:admin) ? "administration" : current_user.role.to_s.pluralize}_lead_path".to_sym, lead.id), :class => "text_action")
    end
  end

  def blank_state_message(msg = t("common.nothing_to_display"))
    content_tag(:div, :class => "frm_tiny") do
      content_tag(:div, :class => "pdd_10") do
        content_tag(:p, msg, :class => "ta_c")
     end
    end
  end
  
  def bt_clear_filter(url=nil)
    link_to_function t("common.clear_filter"), "document.location = '#{url || request.path}'"
  end

  def bt_clear_filter_safe
    link_to t("common.clear_filter"), "javascript:clear_filter()"
  end
  
  def format_date(date, with_time=false)
    date.strftime("%d-%m-%Y#{' %H:%M' if with_time}")
  end

  def href(url)
    "window.location.href='#{url}'"
  end

  def t(key, options = {})
    super
#    if current_user_has_any_role? [:admin, :translator]
#      (super + link_to_function(" [edit]", "update_translation('#{I18n.locale}','#{key}')", :class => "update_translation_link")).html_safe
#      raw super + javascript_tag("attach_update_translation_link('#{I18n.locale}','#{key}')")
#      raw super + content_tag(:t, " [edit]", :id => "translate_#{locale}_#{key.gsub('.','_')}").html_safe
#      super + "#{I18n.locale.to_s}::#{key}"
#    else
#      super + "#{I18n.locale.to_s}::#{key}"
#    end
  end
end
