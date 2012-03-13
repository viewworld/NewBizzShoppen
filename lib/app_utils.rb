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
      #options: :email_field => "email", :name_field => "full_name", :source_associations => [:category, :campaign, :tags]
      def acts_as_newsletter_subscribable(options={})
        if options[:email_field].nil? or options[:name_field].nil?
          throw "Following fields: email_field and name_field must be specified!"
        elsif !options[:source_associations].is_a?(Array)
          throw "Field: source_associations should be an array"
        end

         class_eval <<-EOV
            has_one :newsletter_subscriber, :as => :subscribable, :dependent => :destroy
            before_create :create_newsletter_subscriber
            before_destroy :destroy_newsletter_subscriber
            before_update :update_newsletter_subscriber

            def newsletter_sources_enabled?
              [#{options[:source_associations].map{ |s| ":#{s.to_s}" }.join(", ")}].detect do |source|
                self.send(source).send(:newsletter_sources).any?
              end.present?
            end

            private

            def get_or_create_newsletter_subscriber
              newsletter_subscriber || NewsletterSubscriber.create(:subscribable => self, :email => self.send(:#{options[:email_field]}))
            end

            def create_newsletter_subscriber
              if newsletter_sources_enabled?
                get_or_create_newsletter_subscriber
              end
            end

            def update_newsletter_subscriber
              if newsletter_sources_enabled?
                get_or_create_newsletter_subscriber.update_attributes(:email => self.send(:#{options[:email_field]}))
              end
            end

            def destroy_newsletter_subscriber
              if newsletter_subscriber
                #unsubscribe!
              end
            end

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