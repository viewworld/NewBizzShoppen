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
    new_object = current_user.leads.build
    new_object.lead_translations = [LeadTranslation.new]
    fields = f.fields_for :lead_translations, new_object.lead_translations do |builder|
       render("lead_fields", :f => builder)
    end
    "add_fields(this, \"#{escape_javascript(fields)}\")"
  end

  def available_locales_list(translations)
    existing = translations.map(&:locale)
    Locale.all.map(&:code).reject { |c| c == I18n.locale.to_s or existing.include?(c) }
  end


  def bulk_form(&block)
    form_tag(bulk_action_path, {:method => :post, :id => 'bulk_actions_form'}, &block)
  end
end
