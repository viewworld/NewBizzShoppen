module User::CommonAgent
  def self.included(base)
    base.class_eval do
      include User::RegistrationValidations

      has_many :leads,
               :as => :creator,
               :dependent => :destroy
      has_many :category_agents, :foreign_key => "user_id"
      has_many :unique_categories, :through => :category_agents, :foreign_key => "user_id", :source => :category
      has_many :category_agents, :foreign_key => "user_id"
      has_many :unique_categories, :through => :category_agents, :source => :category
      has_many :materials, as: :assetable, class_name: 'Material', dependent: :destroy

      after_update :update_leads_creator_name_cache
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods

    private

    def update_leads_creator_name_cache
      if changed.any? { |attr| ["last_name", "first_name"].include?(attr) }
        Lead.update_all({:creator_name => name}, {:id => lead_ids})
      end
    end

    public

    def name
      full_name
    end

    def can_publish_leads?
      ![User::NOT_CERTIFIED, User::NOT_CERTIFIED_LOCKED].include?(read_attribute(:certification_level))
    end

    def can_reply_to_comment?(comment)
      blocked_conversations.where("lead_id = ? and buyer_id = ?", comment.commentable_id, comment.root.user_id).first.nil?
    end

    def all_contacts_with_results
      Contact.with_agents(id).with_results
    end

    def site
      :faircalls
    end

    alias_method :to_s, :name
  end
end
