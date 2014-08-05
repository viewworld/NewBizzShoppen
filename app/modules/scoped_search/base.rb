# Based on - ScopedSearch, Copyright (c) 2010 Novagile.
# Written by Nicolas Blanco.
# Licensed under MIT license.
#

#TODO - Make it as default extension of AR...
module ScopedSearch
  class Base
    extend ActiveModel::Naming

    attr_reader :attributes, :model_class

    def initialize(klass, params, options)
      @options = options
      @model_class = klass
      @attributes = params.combined
      @page = @attributes.delete("page")
      klass.scopes.each { |s| spawn_multi_params(s) }
      set_variables
    end

    def collection(&block)
      _relation = configure_relation(&block)
      if @options[:disable_pagination]
        _relation.all
      elsif @options[:scoped]
        _relation.scoped
      else
        _relation.paginate(:page => @page, :per_page => per_page)
      end
    end

    def configure_relation(relation = nil, &block)
      block_given? ? block.call(build_relation(relation)) : build_relation(relation)
    end

    def build_relation(relation=nil)
      return model_class if attributes.empty? and relation.nil?
      _root = relation || model_class
      attributes.reject { |k, v| v.blank? || v.to_s == "false" }.inject(_root) do |s, k|
        if _root.scopes.include?(k.first.to_sym)
          if k.second.is_a?(Array) && multi_params?(k.first)
            s.send(*k.flatten)
          elsif k.second.to_s == "true"
            s.send(k.first)
          else
            s.send(k.first, k.second)
          end
        else
          s
        end
      end
    end

    def to_key
      nil
    end

    def method_missing(method_name, *args)
      build_relation.send(method_name, *args)
    end

    protected

    def set_variables
      attributes.each do |pair|
        unless model_class.scopes.include?(pair.first.to_sym)
          model_class.send("#{pair.first}=", pair.second) if model_class.respond_to?("#{pair.first}=")
        end
      end
    end

    def per_page
      @options[:per_page] || (@options[:current_user].respond_to?(:pagination_size) and @options[:current_user].pagination_size) || ::Metreno::Shared::PAGINATION_DEFAULT
    end

    def spawn_multi_params(attribute)
      self.class.class_eval <<-RUBY
          attr_accessor :#{attribute}_multi_params

          def #{attribute}
            @attributes[:#{attribute}]
          end

          def #{attribute}=(val)
            @attributes[:#{attribute}] = val
          end
      RUBY
    end

    def multi_params?(attribute)
      send("#{attribute}_multi_params").present?
    end
  end
end