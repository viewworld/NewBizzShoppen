class Role
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id

  def initialize(id)
    @id = id
    @key = User.valid_roles[@id]
  end

  def self.find(id, options={})
    Role.new(id.to_i)
  end

  def self.find_by_key(q)
    %w{category_supplier member supplier}.select { |x| x.include?(q) }.map { |key| Role.new(User.valid_roles.index(key.to_sym)) }
  end

  def self.base_class
    Role
  end

  def destroyed?
    false
  end

  def new_record?
    false
  end

  def persisted?
    true
  end

  def newsletter_sources
    NewsletterSource.where(:sourceable_id => @id, :sourceable_type => "Role")
  end

  def users
    if @key == :supplier
      User::Supplier.with_role(:supplier).with_roles_except([:category_supplier])
    elsif @key == :category_supplier
      User::CategorySupplier.all
    else
      User::Member.all
    end
  end

  def name
    @key
  end
end