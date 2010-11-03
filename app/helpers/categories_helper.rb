module CategoriesHelper
=begin
  <%= project_tree(@project,
                  :skip_subprojects => true,
                  :skip_issues => true,
                  :project_label => lambda {|project| link_to project.id, "http://www.google.pl"},
                  :issue_label => lambda {|issue| link_to issue.id, "http://www.google.pl"},
                  :before_issue => lambda {|issue| check_box_tag "issue_ids[]", issue.id }
                  :after_issue => lambda {|issue| "<b>(#{issue.spent_hours}h)</b>"}
                  :before_project => lambda {|project| link_to project.id, "http://www.google.pl"},
                  :after_project => lambda {|project| link_to project.id, "http://www.google.pl"})
                  :versioned => true
                 TODO http://www.kryogenix.org/code/browser/aqlists/
=end
  private

  def abstract_label(obj, obj_name, def_label, options)
    [if options["before_#{obj_name}".to_sym]
       options["before_#{obj_name}".to_sym].call(obj)
     end,


     if options["#{obj_name}_label".to_sym]
       options["#{obj_name}_label".to_sym].call(obj)
     else
       obj.send(def_label)
     end,

     if options["after_#{obj_name}".to_sym]
        options["after_#{obj_name}".to_sym].call(obj)
     end].compact.join(" ")
  end


  def category_label(category, options)
    abstract_label(category, "category", "name", options)
  end

  public

  def all_categories_tree(options={})
    content_tag(:ul, Category.roots.map { |c| content_tag(:li, category_tree(c, options), :class => "categories_node", :id => dom_id(c)) }.join.html_safe, :class => "categories_tree", :id => "categories_main_tree")

  end

  def category_tree(category, options={})
    [category_label(category, options), (category_children(category, options))].compact.join.html_safe
  end


  def category_children(category, options)
    unless category.children.empty?
      content_tag(:ul, :class => "category_children_tree") do
        category.children.map do |child|
          content_tag(:li, :class => "category_child_node", :id => dom_id(child)) do
            [category_label(child, options),
             category_children(child, options)].compact.join.html_safe
          end
        end.join.html_safe
      end
    end
  end

end