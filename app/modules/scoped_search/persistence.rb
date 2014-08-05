#http://efreedom.com/Question/1-3689736/Rails-Alias-Method-Chain-Still-Used
module ScopedSearch
  module Persistence
    extend ActiveSupport::Concern
    module ClassMethods
      private

      def construct_scoped_search_object(params, options)
        if options[:current_user]
          filter_name = options.delete(:filter_name) || self.name
          if params.present?
            store_search_params(options[:current_user], params, filter_name)
          else
            params = restore_search_params(options[:current_user], filter_name, options)
            params.klass = self
          end
        end
        super(params, options)
      end

      def store_search_params(user, params, filter_name)
        ::ScopedSearch::PersistedParam.store_params(user, filter_name, params)
      end

      def restore_search_params(user, filter_name, options)
        ::ScopedSearch::PersistedParam.get_params(user, filter_name, options)
      end
    end
  end
end
