module CommonNewsletterSynch
  extend ActiveSupport::Concern

  included do
    attr_accessor :use_delayed_job

    validates_presence_of :newsletter_list_id

    belongs_to :newsletter_list
    belongs_to :notificable, :polymorphic => true

    after_create do
      if use_delayed_job
        self.delay(:queue => queue_name).send(:process!)
      else
        self.send(:process!)
      end
    end
  end
end