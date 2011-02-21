module ActionView
  module Helpers
    module FormHelper
      def price_range(object_name, method, options = {})
        hidden_field_tag object_name.to_sym, "#{method}_from".to_sym
        hidden_field_tag object_name.to_sym, "#{price_to}_to".to_sym
#        label "#{method}_from_to", "Price range"
#        text_field_tag "#{method}_from_to", '', {:readonly => "readonly", :id => "price_from_to", :style => "width: 75px"}
#        <div class="range_container">
#          <div id="price_range" class="slider-range"></div>
#        </div>
      end
    end
  end
end