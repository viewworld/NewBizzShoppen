class Lead < ActiveRecord::Base
  translates :header, :description, :hidden_description

  belongs_to :creator, :polymorphic => true, :foreign_key => "creator_id"
  belongs_to :category

  validates_presence_of :company_name, :lead_name, :phone_number


  def buyable?
    true #Some more complex logic here...
  end
end
