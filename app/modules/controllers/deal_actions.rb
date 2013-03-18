module DealActions

  def destroy
    @deal.destroy
    success(t("flash.deals.destroy.notice"))
  end

  def index
    params[:search] ||= {}
    params[:search][:active_is] = "1" if params[:search][:active_is].nil?
    params[:search][:descend_by_created_at] = "true" if params[:search][:descend_by_created_at].blank?
    @search = Deal.scoped_search(params[:search])
    @deals = current_user.admin? ? @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Settings.default_deals_per_page) :
        @search.where("creator_id IN (?) or email_address = ? or deal_admin_email IN (?)", (current_user.call_centre? ?
            current_user.subaccounts.map(&:id) + [current_user.id] : [current_user.id]), current_user.email, current_user.call_centre? ?
            current_user.subaccounts.map(&:email) + [current_user.email] : current_user.email).
            paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def edit
    @template = LeadTemplate.find_by_id(params[:template_id])
  end

  def update
    @deal.update_attributes(params[:deal]) ? success(t("flash.deals.update.notice")) : render(:edit)
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end

  def prepare_assets
    @images = @deal.images
    @materials = @deal.materials
    @internal_documents = @deal.internal_documents
  end

  def check_user
    if current_user and current_user.has_any_role?(:call_centre_agent, :call_centre) and !current_user.deal_maker?
      raise CanCan::AccessDenied
    end
  end

  def success_redirect_to(role)
    if params[:commit_stay]
      redirect_to send("edit_#{role}_deal_path".to_sym, @deal)
    elsif params[:commit_duplicate]
      redirect_to send("new_#{role}_deal_path".to_sym, :deal_id => @deal.id)
    else
      redirect_to send("#{role}_deals_path".to_sym)
    end
  end
end