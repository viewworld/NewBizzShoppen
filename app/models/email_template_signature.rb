class EmailTemplateSignature < ActiveRecord::Base

  belongs_to :related, :polymorphic => true
  translates :body
end
