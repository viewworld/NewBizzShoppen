module CommonNewsletter
  def self.included(base)
    base.class_eval do
      validates_presence_of :name, :unless => Proc.new{|n| n.skip_validations}
      validates_uniqueness_of :name, :scope => :owner_id, :unless => Proc.new{|n| n.skip_validations}

      include ScopedSearch::Model

      scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }
      scope :with_archived, lambda{ |q| where("is_archived = ?", q.to_i == 1) }
      scope :without_archived, where("is_archived is FALSE")

      attr_accessor :skip_validations
    end
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    public

    def archive_or_retrieve!
      update_attribute(:is_archived, !is_archived?)
    end

  end
end