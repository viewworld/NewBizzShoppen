class Deal < AbstractLead


  scope :with_category, lambda { |q| where(:category_id => Category.find_by_id(q).self_and_descendants.map(&:id)) }

  private

  def process_for_lead_information?
    false
  end

end