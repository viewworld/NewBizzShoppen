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
    if user_signed_in?
      root_categories = if current_user.has_role?(:admin)
        Category.roots
      elsif current_user.has_role?(:category_buyer)
        current_user.parent_accessible_categories
      else
        current_user.has_accessible_categories? ? Category.roots.within_accessible(current_user) : current_user.has_role?(:customer) ? Category.roots.with_customer_unique(current_user) : Category.roots.with_agent_unique(current_user)
      end
    else
      root_categories = Category.roots.without_unique
    end

    root_categories = root_categories.without_locked_and_not_published unless user_signed_in? and current_user.has_role?(:admin)
    content_tag(:ul, root_categories.map { |c| content_tag(:li, (options[:roots] ? category_label(c, options).html_safe : category_tree(c, options)), :class => "categories_node", :id => dom_id(c)) }.join.html_safe, :class => "categories_tree", :id => "categories_main_tree")
  end

  def category_tree(category, options={})
    [category_label(category, options), (category_children(category, options))].compact.join.html_safe
  end


  def category_children(category, options)
    if user_signed_in?
      if current_user.has_role?(:admin)
        children_categories = category.children
      else
        children_categories = current_user.has_accessible_categories? ? category.children.within_accessible(current_user) : current_user.has_role?(:customer) ? category.children.with_customer_unique(current_user) : category.children.with_agent_unique(current_user)
      end
    else
      children_categories = category.children.without_unique
    end

    children_categories =  children_categories.without_locked_and_not_published unless user_signed_in? and current_user.has_role?(:admin)
    unless children_categories.empty?
      content_tag(:ul, :class => "category_children_tree") do
        children_categories.map do |child|
          content_tag(:li, :class => "category_child_node", :id => dom_id(child)) do
            [category_label(child, options),
             category_children(child, options)].compact.join.html_safe
          end
        end.join.html_safe
      end
    end
  end

end