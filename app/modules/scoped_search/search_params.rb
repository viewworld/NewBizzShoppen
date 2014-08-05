module ScopedSearch
  class SearchParams < ActiveSupport::HashWithIndifferentAccess
    attr_accessor :page, :klass, :options
    attr_reader :klass

    def initialize(constructor, options = {})
      @options = options
      super(extract_params(constructor))
    end

    def combined
      reverse_merge!(opts[:defaults]) if opts[:defaults]
      reverse_merge!(klass.default_scoped_search_params) if klass.default_scoped_search_params
      merge!(opts[:forced_defaults]) if opts[:forced_defaults]
      merge!(klass.forced_scoped_search_params) if klass.forced_scoped_search_params
      self
    end

    def self.new_from_hash_copying_default(hash)
      hash.dup
    end

    private

    def opts
      @options || {}
    end

    def extract_params(params = {})
      return params if params.blank? || params.delete(:_direct)
      search_params = if params.present?
                        (opts[:search_key] ? params[opts[:search_key]] : params[:search]) || {}
                      else
                        {}
                      end
      search_params ? search_params.merge(params[:page] ? {:page => params[:page]} : {}) : {}
    end
  end
end
