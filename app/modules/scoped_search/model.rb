module ScopedSearch
  module Model
    extend ActiveSupport::Concern

    included do
      cattr_accessor :default_scoped_search_params, :forced_scoped_search_params, :scopes
      cattr_accessor :keyword_fields
      self.default_scoped_search_params ||= {}
      self.forced_scoped_search_params ||= {}
      self.scopes ||= []
      self.keyword_fields ||= []

      scope :with_keyword, lambda { |*args| keyword=args.shift; where(with_keyword_where_clause(args), {:keyword => "%#{keyword.db_downcase}%"}) }
    end

    module ClassMethods
      def scope(name, scope_options = {})
        super.tap do
          self.scopes = self.scopes | [name]
        end
      end

      def scopes
        self.scopes
      end

      def with_keyword_fields(*fields)
        self.keyword_fields = self.keyword_fields | fields
      end

      def with_keyword_where_clause(custom_fields=[])
        conditions = self.keyword_fields.map do |field|
          "lower(#{table_name}.#{field}) LIKE :keyword"
        end

        custom_fields.present? && custom_fields.each do |field|
          conditions << "lower(custom_fields -> '#{field}') LIKE :keyword"
        end

        conditions.join(" OR ")
      end

      def scoped_search(*args)
        params = args.shift
        options = args.extract_options!
        params = ::ScopedSearch::SearchParams.new(params, options)
        params.klass = self
        construct_scoped_search_object(params, options)
      end

      def scoped_order(*columns_names)
        if defined?(Mongoid) && self.include?(::Mongoid::Document)
          columns_names.each do |column_name|
            scope :"ascend_by_#{column_name}", order_by([column_name.to_sym, :asc])
            scope :"descend_by_#{column_name}", order_by([column_name.to_sym, :desc])
          end
        else
          columns_names.each do |column_name|
            scope :"ascend_by_#{column_name}", order("#{self.table_name}.#{column_name} asc")
            scope :"descend_by_#{column_name}", order("#{self.table_name}.#{column_name} desc")
          end
        end
      end

      private

      def construct_scoped_search_object(params, options)
        ::ScopedSearch::Base.new(self, params, options)
      end
    end
  end
end
