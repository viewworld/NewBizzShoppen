class SupplierHomeController < ApplicationController
  set_tab "home"

  def show
    @news = Article::News::Supplier.published.latest.limit(3)

    if user_signed_in? && current_user.has_role?(:lead_supplier)
      supplier
    else
      guest
    end
  end

  private

  def supplier
    @latest_leads = Lead.without_inactive
                        .interesting_for_user(current_user)
                        .published_only
                        .without_bought_and_requested_by(current_user)
                        .with_supplier_unique_categories(current_user.id)
                        .latest
                        .limit(3)

    @my_leads = current_user.has_role?(:supplier) ? current_user.bought_leads.latest.limit(3) : current_user.assigned_leads.latest.limit(3)

    render :sales_manager
  end

  def guest
    @latest_deals = Deal.without_inactive
                        .published_only
                        .latest
                        .limit(3)

    @latest_leads = Lead.without_inactive
                        .published_only
                        .without_bought_and_requested_by(current_user)
                        .without_unique_categories
                        .latest
                        .limit(3)

    render :guest
  end
end
