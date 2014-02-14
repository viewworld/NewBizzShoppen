class Suppliers::LeadsController < Suppliers::BasicSupplierController
  before_filter :check_supplier_role

  def new
    @lead = Lead.new
  end

  def create
    lead = Lead.new(params[:lead])
    supplier_lead_adder = SupplierLeadAdder.new(lead, current_user)
    if supplier_lead_adder.process
      redirect_to suppliers_lead_purchases_path, :notice => I18n.t('lead_supplier.leads.create.controller.successful_created_notice')
    else
      @lead = supplier_lead_adder.lead
      render :new
    end
  end

  private

  def check_supplier_role
    redirect_to supplier_home_path unless current_user.has_role?(:supplier)
  end
end