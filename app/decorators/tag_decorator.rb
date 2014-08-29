class TagDecorator < ApplicationDecorator
  def name_underscored
    name.gsub(' ', '_')
  end
end
