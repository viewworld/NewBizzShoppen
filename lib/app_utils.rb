module DestroyPrevention
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def check_associations_before_destroy(*associations)
         class_eval <<-EOV
            before_destroy :check_listed_associations_for_existing_objects

            private

            def check_listed_associations_for_existing_objects
              obj = self.is_a?(User) ? self.with_role : self
              [#{associations.map{ |a| ":#{a.to_s}" }.join(", ")}].detect do |method|
                obj.respond_to?(method) and (obj.send(method).respond_to?(:empty?) ? !obj.send(method).empty? : !obj.send(method).nil?)
              end.nil?
            end
          EOV
      end
   end
 end

 ActiveRecord::Base.send(:include, DestroyPrevention)

module ActsAsSubscribable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_subscribable(options={})
        options.merge!(:email_field => "email", :name_field => "full_name", :source_associations => [:category])

         class_eval <<-EOV
            has_one :newsletter_subscriber, :as => :subscribable
            before_create :create_newsletter_subscriber
            before_destroy :destroy_newsletter_subscriber
            before_update :update_newsletter_subscriber
          EOV
      end

      def acts_as_newsletter_source
        class_eval <<-EOV
          has_many :newsletter_sources, :as => :sourceable
        EOV
      end
   end
end

ActiveRecord::Base.send(:include, ActsAsSubscribable)