module WillPaginate
  module ActiveRecord
    module Pagination
      alias_method :old_paginate, :paginate

      def paginate(options)
        show_all = options.delete(:show_all)
        options[:per_page] = length if show_all

        old_paginate(options)
      end
    end
  end
end
