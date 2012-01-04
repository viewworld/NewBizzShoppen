module ActiveRecord
  module Acts #:nodoc:
    module DeepCloneable #:nodoc:


      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_deep_cloneable(options = {})
          class_eval <<-EOV
            def acts_as_deep_cloneable_configuration
              #{options.inspect}
            end
          EOV
        end

        def skip_callbacks
          model = self
          callbacks_data ||= {}
          callbacks_data[model.name] = model.send(:fetch_callbacks_data)

          [:save, :update, :create].map do |type|
            self.reset_callbacks(type)
          end
          callbacks_data
        end

        def restore_callbacks(callbacks_data)
          callbacks_data.each do |class_name, callbacks|
            callbacks.each do |callback_data|
              class_name.constantize.set_callback(callback_data[:type], callback_data[:kind], callback_data[:filter])
            end
          end
        end

        def fetch_callbacks_data
          [:save, :update, :create].map do |type|
            self.send("_#{type.to_s}_callbacks").map{|c|{:filter => c.filter, :kind => c.kind, :type => type}}
          end.flatten
        end
      end

      # clones an ActiveRecord model.
      # if passed the :include option, it will deep clone the given associations
      # if passed the :except option, it won't clone the given attributes or associations
      # if passed the :validation option, it will deep clone with saving objects to database with validations
      # if passed the :attributes, it will change defined attributes values of cloned object of certain class
      # if passed the :associations, it will change cloned object associations according to definition
      #
      # specify deep clone default configuration using following line in your model
      #  acts_as_deep_cloneable :include => [:mateys, :treasures], :except => :name
      # deep clone configurations are not shared between models
      #
      # === Usage:
      #
      # ==== Cloning a model without an attribute or association
      #  pirate.deep_clone :except => :name
      #
      # ==== Cloning a model without multiple attributes or associations
      #  pirate.deep_clone :except => [:name, :nick_name]
      #
      # ==== Cloning one single association
      #  pirate.deep_clone :include => :mateys
      #
      # ==== Cloning multiple associations
      #  pirate.deep_clone :include => [:mateys, :treasures]
      #
      # ==== Cloning really deep
      #  pirate.deep_clone :include => {:treasures => :gold_pieces}
      #
      # ==== Cloning really deep with multiple associations
      #  pirate.deep_clone :include => [:mateys, {:treasures => :gold_pieces}]
      #
      # ==== Cloning with changing attributes of all cloned object of certain class
      #  pirate.deep_clone :attributes => {:class_name => {:field_name => "other name"}}
      #
      # ==== Cloning with changing associations objects of all cloned object
      #  pirate.deep_clone :associations => {old_parrot_object => new_parrot_object}
      #
      #
      # ==== Cloning with saving
      #  pirate.deep_clone!
      #
      # ==== Cloning with callbacks
      #  pirate.deep_clone! :with_callbacks => true
      #
      # ==== Changing associations objects of all cloned object without cloning
      #  pirate.deep_replace! :associations => {old_parrot_object => new_parrot_object}
      #
      # ==== Show original => cloned relations, grouped by table_name
      #  new_pirate = pirate.deep_clone! :include => :parrots
      #  new_pirate.get_clone_relations
      #    #=> {:parrots => {old_parrot_object => new_parrot}}
      #
      def deep_clone(options = {})
        self.send :process_cloneable, options
      end

      def deep_clone!(options = {})
        deep_clone(options.merge(:save => true))
      end

      def deep_replace(options = {})
        self.send :process_cloneable, options.merge(:replace_object_associations_only => true)
      end

      def deep_replace!(options = {})
        deep_replace(options.merge(:save => true))
      end

      def get_clone_relations(*table_names)
        result = {}
        @clone_relations = (@clone_relations || {})
        table_names = @clone_relations.keys if table_names.include?(:all)
        table_names.present? ? (table_names.each{ |table_name| result.merge!(@clone_relations[table_name.to_sym] || {})}) : result.merge!(@clone_relations)
        result
      end

      private
      def process_cloneable options
        options = self.send(:default_cloneable_configuration).merge(options)
        options.merge!(self.acts_as_deep_cloneable_configuration) if self.respond_to? :acts_as_deep_cloneable_configuration and !options[:sub]
          object = options[:replace_object_associations_only] ? send(:process_with_replacing, options) : send(:process_with_cloning, options)

          if options[:include]
            Array(options[:include]).each do |association, deep_associations|
              if (association.kind_of? Hash)
                deep_associations = association.values.first
                association      = association.keys.first
              end
              unless (options[:except] || {}).include?(association.to_sym)
                cloned_object = object.send :set_association, self, association, deep_associations, options
                object.send("#{association}=", cloned_object)
                object.send(:save_in_cloning, options)
              end
            end
          end
        object
      end

      def process_with_cloning(options)
        kopy = clone
        kopy.send :set_clone_relation, self
        kopy.send :set_default_values_for_attributes, options[:except] if options[:except]
        kopy.send :set_custom_values_for_attributes, options[:attributes] if options[:attributes]
        kopy.send :set_relation_values_for_attributes, options[:relation_attribute] if options[:relation_attribute]
        if options[:save]
          kopy.send(:save_in_cloning, options)
          kopy.send :clone_stamps, self
        end
        kopy.send :replace_object_associations, options if options[:associations]
        options[:associations].merge!(kopy.get_clone_relations(:all)) if options[:associations].present?
        kopy
      end

      def process_with_replacing(options)
        self.send(:save_in_cloning, options)
        self.send :replace_object_associations, options if options[:associations]
        self
      end

      def clone_stamps(original_object)
        [:created_at,:updated_at,:created_by,:updated_by].each do |attribute|
          self.update_attribute(attribute, original_object.send(attribute)) if self.respond_to? attribute
        end
      end

      def set_clone_relations(clone_relations_hash)
        clone_relations_hash.keys.each do |table_name|
          @clone_relations[table_name] ||= {}
          @clone_relations[table_name].merge!(clone_relations_hash[table_name])
        end
      end

      def clone_relations_to_hash
        hash = {}
        @clone_relations.values.each {|clone_relation| hash.merge!(clone_relation)}
        hash
      end

      def set_clone_relation(parent_object)
        @clone_relations = get_clone_relations.merge(self.class.table_name.to_sym => {parent_object => self})
      end

      def set_default_values_for_attributes(attributes)
        Array(attributes).each do |attribute|
          self.write_attribute(attribute, attributes_from_column_definition[attribute.to_s]) if self.respond_to? attribute
        end
      end

      def set_custom_values_for_attributes(attributes)
        self.attributes = attributes[self.class.table_name.to_sym] if attributes[self.class.table_name.to_sym].present?
      end

      def set_relation_values_for_attributes(attributes)
        self.attributes = attributes
      end

      def replace_object_associations(options)
        associations_reflections = self.class.reflect_on_all_associations(:belongs_to)
        associations_reflections.each do |assoc_reflection|
          object = self.send(assoc_reflection.name)
          self.send("#{assoc_reflection.name}=", options[:associations][object]) if options[:associations].keys.include?(object)
          self.send(:save_in_cloning, options)
        end
      end

      def set_association(original_object, association, deep_associations, options)
        opts = options.merge(:sub => true, :relation_attribute => nil, :include => deep_associations)
        case self.class.reflect_on_association(association).macro
          when :belongs_to, :has_one
            self.send(:set_has_one_or_belongs_to_association, original_object, association, opts)
          when :has_many
            self.send(:set_has_many_association, original_object, association, opts)
          when :has_and_belongs_to_many
            self.send(:set_has_and_belongs_to_many_association, original_object, association, opts)
        end
      end

      def set_has_one_or_belongs_to_association(original_object, association, options)
        if sub_kopy = (options[:associations] || {}).keys.include?(original_object.send(association)) ? options[:associations][original_object.send(association)] : original_object.send(association)
          sub_kopy.send(:process_cloneable, options)
          self.send(:set_clone_relations, sub_kopy.send(:get_clone_relations)) unless options[:replace_object_associations_only]
          sub_kopy
        end
      end

      def set_has_many_association(original_object, association, options)
        primary_key = original_object.class.reflect_on_association(association).primary_key_name.to_sym
        options.merge!(:relation_attribute => {primary_key => self.id})
        original_object.send(association).collect do |obj|
          sub_kopy = (options[:associations] || {}).keys.include?(obj) ? options[:associations][obj] : obj.send(:process_cloneable, options)
          self.send(:set_clone_relations, sub_kopy.send(:get_clone_relations)) unless options[:replace_object_associations_only]
          sub_kopy
        end
      end

      def set_has_and_belongs_to_many_association(original_object, association, options)
        original_object.send(association).collect{|object| (options[:replace_object_associations_only] and options[:associations].keys.include?(object)) ? options[:associations][object] : object}
      end

      def save_in_cloning(options)
        callbacks_data = !options[:with_callbacks] ? self.send(:skip_callbacks_in_relations) : nil
        self.save(:validate => options[:validate]) if options[:save]
        self.class.send(:restore_callbacks, callbacks_data) if callbacks_data
      end

      def skip_callbacks_in_relations
        model = self.class
        relation_class_names = model.reflections.values.collect{|a|a.class_name rescue nil}.compact
        res = model.send(:skip_callbacks)

        relation_class_names.map do |class_name|
          begin
            res.merge!(class_name.constantize.send :skip_callbacks)
          rescue
          end
        end
        res
      end


      def default_cloneable_configuration
        {
            :except => nil,
            :include => nil,
            :attributes => nil,
            :associations => nil,
            :save => false,
            :validate => false,
            :with_callbacks => false
        }
      end
    end
  end
end
