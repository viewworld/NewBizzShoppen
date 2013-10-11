module CommonOwner
  def self.included(base)
    base.class_eval do
      belongs_to :owner, :class_name => User.name
      belongs_to :creator, :polymorphic => true

      validate :owner_is_present_and_valid, :unless => Proc.new { |n| n.skip_validations }

      scope :created_or_owned_by, lambda { |creator| where("creator_id = ? or owner_id = ?", creator.id, creator.id) }

      attr_accessor :skip_validations
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public

    def owner_email
      owner ? owner.email : nil
    end

    def owner_email=(new_email)
      self.owner = User.where(:email => new_email).first
    end

    def created_or_owned_by?(user)
      user.admin? or creator_id == user.id or owner_id == user.id
    end

    private

    def owner_is_present_and_valid
      if owner.nil?
        errors.add(:owner_email, :blank)
      elsif owner and !owner.has_any_role?(:admin, :call_centre, :supplier, :category_supplier)
        errors.add(:owner_email, :invalid)
      end
      true
    end

  end
end