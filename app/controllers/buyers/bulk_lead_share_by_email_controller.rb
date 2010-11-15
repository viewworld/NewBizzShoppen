class Buyers::BulkLeadShareByEmailController < Buyers::BuyerController

  def new
   @email_template_preview = EmailTemplatePreview.new(1)
  end

  def create

  end
end