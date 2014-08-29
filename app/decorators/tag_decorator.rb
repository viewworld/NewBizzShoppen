class TagDecorator < ApplicationDecorator
  delegate_all

  def name_underscored
    name.gsub(' ', '_')
  end
end
