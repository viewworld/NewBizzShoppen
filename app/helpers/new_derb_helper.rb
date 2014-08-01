module NewDerbHelper
  def ibt(opts = {}, &block)
    classes = %w(bt)
    classes << 'bt_icon' if opts[:icon]
    classes << opts[:class] if opts[:class]
    div_opts = {:class => classes}
    div_opts.merge(:style => opts[:style]) if opts[:style]

    content_tag(:div, div_opts) do
      content_tag(:span) do
        capture(&block).tap do |html|
          html << image_tag("bt_icons/#{opts[:icon]}.png") if opts[:icon]
        end
      end
    end
  end

  def header(opts = {}, &block)
    classes = %w(header_ribbon)
    classes << opts[:class] if opts[:class]
    back = opts[:back]
    refresh = opts[:refresh]
    content_tag(:div, :class => classes) do
      content_tag(:h1) do
        content_tag(:span) do
          capture_section(:block_header, &block)
        end
      end +

      unless back.blank?
        backurl = opts[:backurl]

        content_tag(:ul, :class => 'header_actions') do
          content_tag(:li, :class => 'bt_back') do
            if backurl
              bt_link_to(nil, 'Back', backurl, :class => 'bt_grey_small')
            else
              bt_link_to(nil, 'Back', 'javascript:void(0)', :onclick => 'history.go(-1)', :class => 'bt_grey_small')
            end
          end
        end
      end +

      unless refresh.blank?
        content_tag(:ul, :class => 'header_actions') do
          content_tag(:li, :class => 'bt_refresh') do
            bt_link_to(nil, 'Refresh', 'javascript:location.reload(true)', :class => 'bt_grey_small')
          end
        end
      end +
      capture_section(:block_actions, &block)
    end
  end

  def frm(opts = {}, &block)
    classes = %w(frm)
    classes << opts[:class] if opts[:class]
    title = opts[:title]

    content_tag(:div, :class => classes) do
      content_tag(:div, :class => 'frm_head') do
        content_tag(:div, nil, :class => 'frm_hl') +
          content_tag(:div, nil, :class => 'frm_hr') +
          content_tag(:div, nil, :class => 'frm_hc') do
            section = capture_section(:block_header, &block)
            if title
              section << content_tag(:h2, title)
            else
              section
            end
          end
      end +

      content_tag(:div, :class => 'frm_content') do
        capture_section(:block_content, &block)
      end +

      if rendered_actions = with_output_buffer { value = yield it_to(:block_actions) }
        content_tag(:div, :class => 'frm_foot_actions') do
          content_tag(:div, nil, :class => 'frm_fl') +
            content_tag(:div, nil, :class => 'frm_fr') +
            content_tag(:div, rendered_actions, :class => 'frm_fc')
        end
      else
        content_tag(:div, :class => 'frm_foot') do
          content_tag(:div, nil, :class => 'frm_fl') +
            content_tag(:div, nil, :class => 'frm_fr') +
            content_tag(:div, nil, :class => 'frm_fc')
        end
      end
    end
  end
end
