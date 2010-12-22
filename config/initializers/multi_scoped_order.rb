module MultiScopedOrder
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def multi_scoped_order(*columns_names)
      columns_names.each do |column_name|
        order_columns = column_name.to_s.split('_and_')
        scope :"ascend_by_#{column_name}",  order("#{order_columns.join(' asc, ')} asc")
        scope :"descend_by_#{column_name}", order("#{order_columns.join(' desc, ')} desc")
      end
    end
  end
end