class Role
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id

  def initialize(id)
    @id = id
    @key = User::ROLES_PRIORITY[@id]
  end

  def self.find(id, options={})
    Role.new(id.to_i)
  end

  def self.base_class
    Role
  end

  def destroyed?
    false
  end

  def persisted?
    true
  end

  def newsletter_sources
    NewsletterSource.where(:sourceable_id => @id, :sourceable_type => "Role")
  end
end