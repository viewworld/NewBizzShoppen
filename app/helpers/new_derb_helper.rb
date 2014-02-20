module NewDerbHelper
  def ibt(opts = {}, &block)
    classes = %w(bt)
    classes << 'bt_icon' if opts[:icon]
    classes << opts[:class] if opts[:class]
    content_tag(:div, :class => classes) do
      content_tag(:span) do
        capture(&block).tap do |html|
          html << image_tag("bt_icons/#{opts[:icon]}.png") if opts[:icon]
        end
      end
    end
  end
end
