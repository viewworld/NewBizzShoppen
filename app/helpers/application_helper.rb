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

  def generic_table(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:headers, :cells)
    block.call(@hb)
    options[:default_action] ||= :show
    options[:link_to_show] = true unless options.has_key?(:link_to_show)
    options[:link_to_edit] = true unless options.has_key?(:link_to_edit)
    options[:link_to_delete] = true unless options.has_key?(:link_to_delete)
    options[:custom_links] ||= []
    render(:partial => '/shared/generic_table', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def fields_for_leads_translations(f)
    new_object = current_user.has_any_role?(:admin, :call_centre) ? Lead.new : current_user.leads.build
    new_object.lead_translations = [LeadTranslation.new]
    fields = f.fields_for :lead_translations, new_object.lead_translations do |builder|
      render("/shared/leads/lead_fields", :f => builder)
    end
    "add_fields(this, \"#{escape_javascript(fields)}\")"
  end

  def fields_for_deals_translations(f)
    new_object = (!user_signed_in? or current_user.has_any_role?(:admin, :call_centre)) ? Lead.new : current_user.leads.build
    new_object.lead_translations = [LeadTranslation.new]
    fields = f.fields_for :lead_translations, new_object.lead_translations do |builder|
      render("/shared/deals/deal_fields", :f => builder)
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

  def fields_for_subscription_plan_line_fields(f)
    region = SubscriptionPlanLine.new
    fields = f.fields_for :subscription_plan_lines, region do |builder|
      render("subscription_plan_line_fields", :f => builder)
    end
    "add_subscription_plan_line(this, \"#{escape_javascript(fields)}\")"
  end

  def fields_for_survey_options_fields(f)
    region = SurveyOption.new
    fields = f.fields_for :survey_options, region do |builder|
      render("survey_option_fields", :f => builder)
    end
    "add_survey_option_field(this, \"#{escape_javascript(fields)}\")"
  end

  def fields_for_associated(klass, form, partial)
    _instance = klass.new
    _fields = form.fields_for klass.to_s.tableize, _instance do |builder|
      render(partial, :f => builder)
    end
    "add_#{klass.to_s.underscore}(this, \"#{escape_javascript(_fields)}\")"
  end

  def available_templates_list(lead)
    lead.lead_templates(false).reject { |lt| lt.is_filled_out_for(lead) }
  end

  def custom_error_for_field(form, field)
    if form.object.errors[field].present?
      content_tag(:p, form.object.errors[field].join(", "), :class => "inline-errors") + tag("br")
    end
  end

  def custom_error_for_object_and_field(object, field)
    if object.errors[field].present?
      content_tag(:p, object.errors[field].join(", "), :class => "inline-errors") + tag("br")
    end
  end

  def custom_error_for_object(object)
    if object
      content_tag(:p, object.errors.full_messages.join(", "), :class => "inline-errors") + tag("br")
    end
  end

  def available_locales_list(translations)
    existing = translations.map(&:locale)
    Locale.enabled.map(&:code).reject { |c| c == I18n.locale.to_s or existing.include?(c) }.map { |c| [t('models.locale.' + c).to_s, c] }.sort
  end


  def bulk_form(&block)
    form_tag(bulk_action_path, {:method => :post, :id => 'bulk_actions_form'}, &block)
  end

  def icon(name, alt = nil, opts = {})
    opts[:alt] = alt
    image_tag("bt_icons/#{name.to_s}.png", opts)
  end

  def bt_link_to(icon_name, text, url, opts = {})
    icon_alt = text || icon_name.to_s.capitalize
    link_class = text.nil? ? "bt bt_icon" : "bt"
    opts[:class].nil? ? opts[:class] = link_class : opts[:class] = "#{link_class} #{opts[:class]}"
    icon_tag = ""
    icon_tag = icon(icon_name, icon_alt) unless icon_name.nil?
    icon_tag << "#{text}" unless text.nil?
    _url = 'javascript:void(0)'
    _url = url_for(url) unless url.nil?
    link_to(content_tag(:span, icon_tag), _url, opts)
  end

  def bt_link_to_function(icon_name, text, script, opts = {})
    icon_alt = text || icon_name.to_s.capitalize
    link_class = text.nil? ? "bt bt_icon" : "bt"
    opts[:class].nil? ? opts[:class] = link_class : opts[:class] = "#{link_class} #{opts[:class]}"
    icon_tag = ""
    icon_tag = icon(icon_name, icon_alt) unless icon_name.nil?
    icon_tag << "#{text}" unless text.nil?
    link_to_function(content_tag(:span, icon_tag), script, opts)
  end

  def as_currency(number, currency=nil, precision=nil)
    if currency
      number_to_currency(number,
                         :format => currency.format,
                         :unit => currency.symbol,
                         :separator => currency.separator,
                         :delimiter => currency.delimiter,
                         :precision => precision || t("number.format.precision").to_i)
    else
      number_to_currency(number,
                         :precision => precision || t("number.format.precision").to_i,
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
    if user_signed_in? and current_user.has_role?(:category_supplier) and @home_category
      main_menu_link_to(t("layout.main_menu.shared.home"), category_home_page_path(@home_category.cached_slug), :tab => "home")
    elsif user_signed_in? and current_user.has_role?(:member) and session[:site] == "fairdeals"
      main_menu_link_to(t("layout.main_menu.shared.home"), root_path, :tab => "home")
    else
      main_menu_link_to(t("layout.main_menu.shared.home"), url_to_role_specific_home_page, :tab => "home")
    end
  end

  def url_to_role_specific_home_page
    if !user_signed_in?
      root_path
    else
      if @home_category and current_user.has_role?(:category_supplier)
        category_home_page_path(@home_category.cached_slug)
      elsif current_user.has_any_role?(:call_centre, :call_centre_agent)
        agent_home_path
      elsif current_user.has_any_role?(:supplier, :lead_supplier, :lead_user, :agent, :member)
        (current_user.has_any_role?(:supplier, :lead_supplier, :lead_user)) ? supplier_home_path : self.send("#{current_user.role.to_s}_home_path")
      elsif current_user.has_any_role?(:admin)
        administration_root_path
      else
        root_path
      end
    end
  end

  def link_to_view_templates(category)
    role = current_user.role.to_s.pluralize
    role = "suppliers" if current_user.category_supplier?
    link_to(t("categories.index.view.view_lead_templates"), self.send("#{role}_lead_templates_path", :search => { :with_category => category.id }), :class => "text_action")
  end

  def link_to_view_deal_templates(category)
    if user_signed_in? and current_user.can_create_lead_templates? and !current_user.has_role?(:admin) and (current_user.has_role?(:supplier) and current_user.deal_category_id == category.id)
      link_to_view_templates(category)
    end
  end

  def link_to_view_lead_templates(category)
    if user_signed_in? and current_user.can_create_lead_templates? and !current_user.has_role?(:admin)
      link_to_view_templates(category)
    end
  end

  def link_to_edit_lead(lead)
    if current_user and (current_user == lead.creator or current_user.has_role?(:admin))
      link_to(t("leads.listing.edit_label"), send("edit_#{current_user.has_role?(:admin) ? "administration" : current_user.role.to_s.pluralize}_lead_path".to_sym, lead.id), :class => "text_action")
    end
  end

  def link_to_delete_lead(lead)
    if current_user and (current_user == lead.creator or current_user.has_role?(:admin))
      link_to(t("leads.listing.delete_label"), send("#{current_user.has_role?(:admin) ? "administration" : current_user.role.to_s.pluralize}_lead_path".to_sym, lead.id), :method => :delete, :class => "text_action")
    end
  end

  def link_to_edit_deal(deal)
    if current_user and (current_user == deal.creator or current_user.has_role?(:admin))
      link_to(t("deals.listing.edit_label"), send("edit_#{current_user.has_role?(:admin) ? "administration" : current_user.role.to_s.pluralize}_deal_path".to_sym, deal.id), :class => "text_action")
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
    date.strftime("#{I18n.t("date.formats.default")}#{' %H:%M' if with_time}") if date
  end

  def href(url)
    "window.location.href='#{url}'"
  end

  def escape_uri(uri)
    require 'uri'
    URI.escape(uri, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end

  def main_menu
    session[:site] ? "layouts/#{session[:site]}/main_menu" : "layouts/main_menu"
  end

  def deal_show_li(value, label)
    unless value.blank?
      content_tag(:li) do
        content_tag(:div, content_tag(:span, label, :class => "label")+value)
      end
    end
  end

  def link_to_show_all_without_pagination(form_id)
    show_all_enabled = params[:show_all] == "1"
    link_to show_all_enabled ? t("common.show_paginated") : t("common.show_all"), "javascript:show_all_pages('#{form_id}', '#{show_all_enabled ? 0 : 1}')", :class => "show_all_link", :class => "bt"
  end

  def st_lite(text)
    sanitize_options = {:tags=>[],:attributes=>[]}
    raw sanitize(text, sanitize_options)
  end

  def format_for_timesheet(timesheet, val, type)
    val = val / 3600.0 if type == :time_on_phone

    if [:hours, :time_on_phone].include?(type.to_sym)
      hours = val.to_i.abs
      minutes = ((val-val.to_i)*60).round.abs
      minutes = "0#{minutes}" if minutes < 10
      "#{'-' if val < 0}#{hours}:#{minutes}"
    elsif [:value, :cost, :payout].include?(type.to_sym)
      timesheet.currency.from_euro(val).to_i
    else
      val.to_i
    end
  end

  def value_or_none(value)
    value.presence || "-"
  end

  def seconds_to_minutes_and_seconds(seconds)
    seconds = seconds.to_i
    minutes = seconds / 60
    seconds = seconds - (minutes * 60)
    "#{minutes < 10 ? '0'+minutes.to_s : minutes}:#{seconds < 10 ? '0'+seconds.to_s : seconds}"
  end

  def humanize_object_class_name(object)
    if object.is_a?(ActsAsTaggableOn::Tag)
      "Tag"
    elsif object.is_a?(SubscriptionPlan)
      "Subscription"
    else
      object.class.to_s.tableize.humanize.singularize
    end
  end

  def edit_subscribable_object_path(subscriber)
    if subscriber.subscriber_type == "User"
      current_user.admin? ? edit_administration_user_path(:id => subscriber.subscriber_id) : ""
    elsif subscriber.subscriber_type == "Lead" or (subscriber.subscriber_type == "AbstractLead" and subscriber.subscriber.class.to_s == "Lead")
      current_user.admin? ? edit_administration_lead_path(:id => subscriber.subscriber_id) : edit_call_centres_lead_path(:id => subscriber.subscriber_id)
    elsif subscriber.subscriber_type == "Contact" or (subscriber.subscriber_type == "AbstractLead" and subscriber.subscriber.class.to_s == "Contact")
      edit_callers_campaign_contact_path(:id => subscriber.subscriber_id, :campaign_id => subscriber.subscriber.campaign_id)
    else
      ""
    end
  end

  def sorted_nested_set_options(class_or_item, sort_proc, mover = nil, level = 0)
    class_or_item = class_or_item.roots if class_or_item.is_a?(Class)
    items = Array(class_or_item)
    result = []
    items.sort_by(&sort_proc).each do |root|
      set = root.self_and_descendants
      result += build_node(set[0], set, sort_proc, mover, level){|x, level| yield(x, level)}
    end
    result
  end

  def build_node(node, set, sort_proc, mover = nil, level = nil)
    result ||= []
    if mover.nil? || mover.new_record? || mover.move_possible?(i)
      result << [yield(node, level), node.id]
      unless node.leaf?
        set.select{|i| i.parent_id == node.id}.sort_by(&sort_proc).map{ |i|
          result.push(*build_node(i, set, sort_proc, mover, level.to_i + 1){|x, level| yield(x, level)})
        }
      end
    end
    result
  end
end
