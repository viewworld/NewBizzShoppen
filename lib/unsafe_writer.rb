=begin
a.send(:remove_attributes_protected_from_mass_assignment, {:question_id => 10, :value => 20}.with_indifferent_access)
WARNING: Can't mass-assign these protected attributes: question_id
{"value"=>20}


AnsweredQuestion::AnsweredQuestionOk.with_accessible_attributes(:tfs_result_id, :question_id, :value) do |klass|
  klass.create(ids.map { |question_id| {:tfs_result_id => self.id, :question_id => question_id, :value=> "false"} })
end
=end


module UnsafeWriter
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def with_accessible_attributes(&block)
      cloned_class =  Class.new(self)
      cloned_class.class_eval do

        def attributes=(new_attributes, guard_protected_attributes = false)
          super(new_attributes, guard_protected_attributes)
        end

        private
        def self.name
         superclass.name
        end
      end
      cloned_class
      yield(cloned_class)
    end
  end
end