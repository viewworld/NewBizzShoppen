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
           def newsletter_config
             {:email_field => :#{options[:email_field]}, :name_field => :#{options[:name_field]}, :source_associations => [#{options[:source_associations].map{ |s| ":#{s.to_s}" }.join(", ")}]}
           end
        EOV

        class_eval do
          has_one :newsletter_subscriber, :as => :subscribable, :dependent => :destroy
          after_create :create_newsletter_subscriber
          before_destroy :destroy_newsletter_subscriber
          after_update :update_newsletter_subscriber

          def add_to_custom_source_of_newsletter_list!(newsletter_list)
            if newsletter_list.newsletter_subscribers.where(:email => self.send(newsletter_config[:email_field])).first.nil?
              newsletter_list.custom_source.newsletter_subscribers << get_or_create_newsletter_subscriber
            end
          end

          def newsletter_sources_enabled?
            if newsletter_subscriber.nil?
              newsletter_config[:source_associations].detect do |source_association|
                self.send(source_association).respond_to?(:newsletter_sources) and self.send(source_association).send(:newsletter_sources).any?
              end.present? or newsletter_sources_from_tags.any?
            else
              newsletter_subscriber.newsletter_sources.any?
            end
          end

          def all_newsletter_sources
            (newsletter_config[:source_associations].map do |source_association|
              self.send(source_association).respond_to?(:newsletter_sources) ? self.send(source_association).send(:newsletter_sources) : []
            end.flatten + newsletter_sources_from_tags).uniq
          end

          def newsletter_sources_from_tags
            if self.respond_to?(:tag_list) and self.tag_list.any?
              tag_groups = TagGroup.tagged_with(tag_list, :any => true).where(:match_all => false) +
                  TagGroup.tagged_with(tag_list, :match_all => true).where(:match_all => true)

              tag_groups.map do |tag_group|
                tag_group.newsletter_sources
              end.flatten.uniq
            else
              []
            end
          end

          private

          def get_or_create_newsletter_subscriber
            newsletter_subscriber || NewsletterSubscriber.create(:subscribable => self, :email => self.send(newsletter_config[:email_field]), :name => self.send(newsletter_config[:name_field]))
          end

          def create_newsletter_subscriber
            if newsletter_sources_enabled?
              get_or_create_newsletter_subscriber
            end
          end

          def update_newsletter_subscriber
            if newsletter_sources_enabled?
              get_or_create_newsletter_subscriber.update_attributes(:email => self.send(newsletter_config[:email_field]), :name => self.send(newsletter_config[:name_field]))
            end
          end

          def destroy_newsletter_subscriber
            if newsletter_subscriber
              #unsubscribe!
            end
          end
        end
      end

      def acts_as_newsletter_source
        class_eval do
          has_many :newsletter_sources, :as => :sourceable
        end
      end
   end
end

ActiveRecord::Base.send(:include, ActsAsSubscribable)