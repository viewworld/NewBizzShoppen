module ScopedSearch
  class PersistedParam < ActiveRecord::Base

    belongs_to :persistable, :polymorphic => true
    serialize :params

    class << self
      def get_params(user, filter_name, options = {})
        filter = find_filter(user, filter_name)
        params = ((filter.blank? || !filter.first.params.is_a?(Hash)) ? {} : filter.first.params).merge(_direct: true)
        result = ScopedSearch::SearchParams.new(params, options)
        result
      end

      def store_params(user, filter_name, params)
        filter = find_filter(user, filter_name)
        unless filter.blank?
          filter.first.update_attribute(:params, {}.merge(params))
        else
          create(persistable_id: user.id, persistable_type: user.class.name, filter_name: filter_name, params: {}.merge(params))
        end
      end

      private
      def find_filter(user, filter_name)
        where(persistable_id: user.id, persistable_type: user.class.name, filter_name: filter_name).order("id desc").limit(1)
      end
    end
  end
end
