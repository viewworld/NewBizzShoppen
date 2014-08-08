module CommonOwner
  extend ActiveSupport::Concern

  included do
    belongs_to :owner, class_name: "User"
    belongs_to :creator, polymorphic: true, foreign_key: "creator_id"

    scope :created_or_owned_by, ->(user) { where("creator_id = ? or owner_id = ?", user.id, user.id) }

    attr_accessor :skip_validations
  end

  def owner_email
    owner.try(:email)
  end

  def owner_email=(new_email)
    self.owner = User.where(email: new_email).first
  end

  def created_or_owned_by?(user)
    user.admin? || creator_id == user.id || owner_id == user.id
  end

  private
  # TODO: owner from creator should be set in callbacks per model (not every model sets owner from creator during creation)
  def set_owner_from_creator
    self.owner = creator
  end

  def is_owner_eql_to?(user)
    owner && (owner.id == user.id)
  end

  def owner_is_present_and_valid
    if owner.nil?
      errors.add(:owner_email, :blank)
    elsif owner and !owner.has_any_role?(:admin, :call_centre, :supplier, :category_supplier)
      errors.add(:owner_email, :invalid)
    end

    true
  end
end
