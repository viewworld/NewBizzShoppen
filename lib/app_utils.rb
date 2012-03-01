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
                obj.respond_to?(method) and !obj.send(method).empty?
              end.nil?
            end
          EOV
      end
   end
 end

 ActiveRecord::Base.send(:include, DestroyPrevention)