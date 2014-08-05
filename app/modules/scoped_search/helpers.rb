module ScopedSearch
  module Helpers
    extend ActiveSupport::Concern

    def form_for(record, *args, &block)
     if record.is_a?(::ScopedSearch::Base)
       options = args.extract_options!
       options.symbolize_keys!

       default_model_route = (polymorphic_path(record.model_class) rescue nil)

       options.reverse_merge!({:url => default_model_route, :as => :search})
       raise "You have to manually specify :url in your form_for options..." unless options[:url].present?

       options[:html] ||= {}
       options[:html].reverse_merge!({:method => :get})
       args << options
     end

     super(record, *args, &block).force_encoding(Encoding::UTF_8)
    end

    def order_for_scoped_search(column, search_param = :search)
      search_order = params[search_param].present? && params[search_param]["ascend_by_#{column}"].present? ? {"descend_by_#{column}" => true} : {"ascend_by_#{column}" => true}

      params[search_param] ||= {}
      search_without_order = params[search_param].clone
      search_without_order.delete_if { |k, v| k.to_s.starts_with?("ascend_by") || k.to_s.starts_with?("descend_by") }

      params.merge(search_param => search_without_order.merge(search_order))
    end
  end
end
