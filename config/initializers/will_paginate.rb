module WillPaginate
  module Finders
    module Base
      def paginate(*args, &block)
        options = args.pop

        page, per_page, total_entries = wp_parse_options(options)

        if options.delete(:show_all)
          per_page = count >= 1 ? count : 1
        end

        WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
          query_options = options.except :page, :per_page, :total_entries
          wp_query(query_options, pager, args, &block)
        end
      end
    end
  end
end