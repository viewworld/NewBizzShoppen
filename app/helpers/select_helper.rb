module SelectHelper

  def children_for(root,collection)
    Array(root) + collection.select{|item| item.parent_id == root.id }.map{|item| children_for(item,collection)}.flatten
  end

  def nested_by_parent_id(items_or_klass, mover)
    roots = case
        when items_or_klass.is_a?(Array) then items_or_klass.select{|i| !items_or_klass.map(&:id).include?(i.parent_id)}
        when items_or_klass.is_a?(Class) then Array(items_or_klass.roots)
        else items_or_klass
    end
    result = []
    roots.each do |root|
            levels = []
            children = case
              when items_or_klass.is_a?(Array) then children_for(root,items_or_klass)
              else root.self_and_descendants
            end
            result += children.map do |i|
              if level = levels.index(i.parent_id)
                levels.slice!((level + 1)..-1)
              else
                levels << i.parent_id
                level = levels.size - 1
              end
              if mover.nil? || mover.new_record? || mover.move_possible?(i)
                [yield(i, level), i.id]
              end
            end.compact
    end
    result
  end

  def nested_set_options(klass_or_item, mover = nil)
    nested_by_parent_id(klass_or_item,mover) { |name, level| "#{'&nbsp;&nbsp;&nbsp;' * level} #{name}".html_safe }
  end
end
