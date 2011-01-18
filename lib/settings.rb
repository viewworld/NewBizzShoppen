class Settings < ActiveRecord::Base
  before_save :refresh_agents_certification_level

  def refresh_agents_certification_level
    if ['certification_level_1', 'certification_level_2'].include?(var) and value_changed?
      User.refresh_agents_certification_level
    end
  end
end