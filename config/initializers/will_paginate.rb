module WillPaginate
  module ActiveRecord
    module Pagination
      alias_method :old_paginate, :paginate

      def paginate(options)
        show_all = options.delete(:show_all)
        options[:per_page] = self.length if show_all

        old_paginate(options)
      end
    end
  end
end

# module WillPaginate
#   module Finders
#     module Base
#       def paginate(*args, &block)
#         options = args.pop
#
#         page, per_page, total_entries = wp_parse_options(options)
#
#         if options.delete(:show_all)
#           per_page = count >= 1 ? count : 1
#           page = 1
#         end
#
#         WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
#           query_options = options.except :page, :per_page, :total_entries
#           wp_query(query_options, pager, args, &block)
#         end
#       end
#     end
#   end
#
#   module ViewHelpers
#     def will_paginate(collection = nil, options = {}) #:nodoc:
#       options, collection = collection, nil if collection.is_a? Hash
#       collection ||= infer_collection_from_controller
#
#       _params_copy = request.parameters.dup
#       paginator = super(collection, options.symbolize_keys).to_s
#       if collection and (request.parameters[:show_all] or collection.total_pages > 1)
#         _params_copy[:show_all] ? _params_copy.delete(:show_all) : _params_copy.merge!({:show_all => 1})
#         paginator += content_tag(:p, link_to((_params_copy[:show_all] ? t("common.show_all") : t("common.show_paginated")), _params_copy, :class => "bt show_all_link"), :class => "pdd_5 ta_c")
#       end
#       paginator.try(:html_safe)
#     end
#   end
# end
