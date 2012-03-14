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
end