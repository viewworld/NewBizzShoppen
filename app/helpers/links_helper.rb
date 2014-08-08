module LinksHelper
   def menu_link_to(sub, * args, & block)
    options = args.dup.extract_options!
    class_name, tab_key = if sub
                            ["sub_menu_item", :subtab]
                          else
                            ["main_menu_item", :tab]
                          end

    content_tag(:li, link_to(* args, & block), :class => "#{options[:additional_class]} #{'link ' if tab_key == :subtab}#{class_name unless options[:additional_class] == "first"}#{' active' if self.send(tab_key) == (options[tab_key] || args.first.gsub(' ', '_').downcase)}")
  end

  def main_menu_link_to(*args, &block)
    content = args.shift
    menu_link_to(false, *args) do
      content_tag(:span, content)
    end
  end

  def sub_menu_link_to(*args, &block)
    menu_link_to(true, *args, &block)
  end

  def main_menu_link_with_subtabs_to(*args, &block)
    options = args.dup.extract_options!

    content_tag(:li, :class => "has_child#{' active' if self.send(:tab) == options[:tab]}") do
      content_tag(:a, content_tag(:span, options[:title]), :href => "#") + content_tag(:ul, main_menu_link_to(options[:title], "#", :additional_class => "first", :tab => options[:tab]) + capture(&block), :class => "subnav")
    end
  end
end
