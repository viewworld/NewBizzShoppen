module CommonNewsletter
  def self.included(base)
    base.class_eval do
      belongs_to :owner, :class_name => "User"
      belongs_to :creator, :polymorphic => true

      validates_presence_of :name
      validates_uniqueness_of :name
      validate :owner_is_present_and_valid

      include ScopedSearch::Model

      scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }
      scope :with_archived, lambda{ |q| where("is_archived = ?", q.to_i == 1) }
      scope :without_archived, where("is_archived is FALSE")
      scope :created_or_owned_by, lambda { |creator| where("creator_id = ? or owner_id = ?", creator.id, creator.id) }
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

    def archive_or_retrieve!
      update_attribute(:is_archived, !is_archived?)
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