#http://efreedom.com/Question/1-3689736/Rails-Alias-Method-Chain-Still-Used
module ScopedSearch
  module Paranoid
    extend ActiveSupport::Concern

    included do
      scope :without_deleted, -> { where(:deleted_at => nil) }
      scope :with_deleted,  where("\"#{self.table_name}\".\"deleted_at\" IS NULL OR \"#{self.table_name}\".\"deleted_at\" IS NOT NULL")
      scope :without_archived, -> { where(:archived_at => nil) }
      scope :with_archived,  where("\"#{self.table_name}\".\"archived_at\" IS NULL OR \"#{self.table_name}\".\"archived_at\" IS NOT NULL")

      if self.table_exists?
        if self.column_names.include?("deleted_at")

          default_scope { where(:deleted_at => nil) }

          self.class_eval do
            def deleted?
              !!deleted_at
            end

            def destroy(force=false)
              if force
                super()
              else
                deleted_at = Time.now
                self.class.transaction do
                  if update_attribute(:deleted_at, deleted_at)
                    act_on_dependent_destroy_associations(deleted_at)
                  end
                end
              end
            end

            def act_on_dependent_destroy_associations(deleted_at = Time.now)
              self.class.base_class.dependent_associations.each do |association|
                if association.collection? && association.klass.respond_to?(:paranoid?) && association.klass.paranoid?
                  association.klass.with_deleted.where(association.foreign_key.to_sym => self.id).update_all(:deleted_at => deleted_at) #, association.foreign_key.to_sym => self.id)
                end
              end
              true
            end
          end
        end

        if self.column_names.include?("archived_at")
          self.class_eval do
            def archived?
              !!archived_at
            end

            def toggle_archive!
              update_attribute(:archived_at, archived? ? nil : Time.now)
              archived_at
            end
          end
        end
      end
    end

    module ClassMethods

      def dependent_associations
        self.base_class.reflect_on_all_associations.select { |a| [:destroy, :delete_all].include?(a.options[:dependent]) }
      end

      def paranoid?
        self.ancestors.compact.include?(::ScopedSearch::Paranoid) && self.table_exists? && self.column_names.include?("deleted_at")
      end

      private

      def construct_scoped_search_object(params, options)
        %w(archived deleted).each do |column_name|
          if self.column_names.include?("#{column_name}_at")
            unless ::ActiveRecord::ConnectionAdapters::Column.value_to_boolean(params["with_#{column_name}"])
              params["without_#{column_name}"] = true
            end
          end
        end
        super(params, options)
      end
    end
  end
end
