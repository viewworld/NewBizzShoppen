class Callers::ChainMailTypesController < Callers::CallerController
  inherit_resources

  set_tab "content"
  set_subtab "chain_mail_type"

  before_filter :fetch_campaign
  before_filter :set_klass, :only => [:new, :create]

  protected

  def fetch_campaign
    @campaign = Campaign.find_by_id(params[:campaign_id])
  end

  def collection
    ChainMailType.purge_drafts!
    params[:search] ||= {}
    params[:search][:with_archived] = "0" unless params[:search][:with_archived].present?
    params[:search][:without_drafts] = true
    params[:search][:with_campaign] = params[:campaign_id] if params[:campaign_id]
    @search = ChainMailType.scoped_search(params[:search])
    @chain_mail_types = @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def set_klass
    @klass = "#{params[:type].capitalize}ChainMailType".constantize
  end

  public

  def update
    if params[:result_id_changed].to_i == 1
      flash[:notice] = I18n.t("chain_mail_types.update.flash.result_changed")
    end
    update! do |success, failure|
      success.html {
        if params[:chain_mail_type][:add_new_item] == "true"
          @chain_mail_type.chain_mail_items.create(:skip_validations => true)
        end
        redirect_to @campaign ? edit_callers_campaign_chain_mail_type_path(@campaign, @chain_mail_type) : edit_callers_chain_mail_type_path(@chain_mail_type)
      }
    end
  end

  def create
    create! do |success, failure|
      success.html { redirect_to callers_chain_mail_types_path }
    end
  end

  def new
    @chain_mail_type = @klass.create(:skip_validations => true, :active => false, :campaign_id => params[:campaign_id], :result_id => params[:result_id])
    if @chain_mail_type.campaign_id
      redirect_to edit_callers_campaign_chain_mail_type_path(@chain_mail_type.campaign_id,@chain_mail_type)
    else
      redirect_to edit_callers_chain_mail_type_path(@chain_mail_type)
    end
  end

end
