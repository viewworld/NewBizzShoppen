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
    abstract_label(category, "category", "name", options) + unless category.description.blank? or category.parent.present?
        content_tag(:p, category.description, :class => "category_desc")
      else
        ""
      end

  end

  public

  def all_categories_tree(options={})
    category_model = (options[:category_type] == "deal" ? "DealCategory" : "LeadCategory").constantize
    root_categories = category_model.roots_for(current_user)
    content_tag(:ul, root_categories.map { |c| content_tag(:li, (options[:roots] ? category_label(c, options).html_safe : category_tree(c, options)), :class => "categories_node", :id => dom_id(c)) }.join.html_safe, :class => ["categories_tree", options[:ul_css_class]].compact.join(" "), :id => "categories_main_tree")
  end

  def category_tree(category, options={})
    all_children = category_children(category, options)
    [category_label(category, options), (all_children), category_toggler(all_children.blank? ? false : true)].compact.join.html_safe
  end

  def category_tree_for_subcategories(category, options={})
    all_children = category_children(category, options)
    [all_children, category_toggler(all_children.blank? ? false : true)].compact.join.html_safe
  end


  def category_children(category, options)
    children_categories = category.children_for(current_user)
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

  def category_toggler(has_children)
      if has_children
        content_tag(:p, :class => "subcategory_btn") do
          link_to(t("common.more"), "javascript:void(0)", :class => "show_subcategory")+
          link_to(t("common.fewer"), "javascript:void(0)", :class => "hide_subcategory", :style => "display: none")
        end
      end
  end

  def categories_structure_root(root_category, all_categories=[], tree_type=:interests)
    result = [category_structure_tags(root_category, tree_type)]
    unless (children = all_categories.select { |c| c.parent_id == root_category.id }).empty?
      result << categories_structure_children(children, all_categories, 0, tree_type)
    end
    content_tag("ul", result.flatten.compact.join.html_safe, :id => "category_tree_#{root_category.id}")
  end

  def categories_structure_children(children, all_categories, level=0, tree_type=:interests)
    result = []
    children.each do |category|
      result << category_structure_tags(category, tree_type)
      unless (category_children = all_categories.select { |c| c.parent_id == category.id }).empty?
        result << categories_structure_children(category_children, all_categories, level + 1, tree_type)
      end
    end
    content_tag("ul", result.flatten.join.html_safe)
  end

  def category_structure_tags(category, tree_type)
    if tree_type == :interests
      "<li>" +
      check_box_tag("categories[]", category.id, current_user.categories.include?(category), :id => "category_#{category.id}") +
      label_tag("category_#{category.id}", category.name)
    elsif tree_type == :leads_catalog
      "<li>" +
      check_box_tag("search[with_selected_categories][]", category.id, @search.with_selected_categories.to_a.map(&:to_i).include?(category.id), :id => "category_#{category.id}") +
      label_tag("category_#{category.id}", category.name)
    end
  end

  def default_category_for_select(categories)
    selected_category = Category.find_by_id(session[:selected_category].to_i)
    if selected_category and categories.include?(selected_category) and selected_category.can_publish_leads?
      selected_category.id
    else
      categories.detect { |c| c.can_publish_leads? }.id
    end
  end

  def categories_listing(collection, options = {}, &block)
    @hb = ApplicationHelper::HelperBlocks.new(:tools, :bottom)
    block.call(@hb)
    render(:partial => '/categories/listing', :locals => options.merge({:collection => collection}.merge(@hb.results)))
  end

  def user_specific_category_counter(category)
    if count = (category.is_a?(LeadCategory) ? category.leads_count_for_user(current_user) : category.deals_count_for_user(current_user)) and count == 0
      t("layout.main_menu.shared.sold_out")
    else
      count
    end
  end

  def categories_sorted_for_select(collection, order)
    sorted_nested_set_options(collection, lambda(&order.to_sym)){|cat, i| "#{'&nbsp;&nbsp;&nbsp;'*cat.level}#{cat.name}".html_safe}
  end

end