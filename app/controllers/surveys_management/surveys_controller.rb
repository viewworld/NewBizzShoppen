class SurveysManagement::SurveysController < SurveysManagement::SurveysManagementController
  inherit_resources
  before_filter :fetch_object, :only => [:edit, :setup, :update, :show, :destroy, :send_to_newsletters, :duplicate]

  set_tab "campaigns"
  set_subtab "surveys"

  def new
    @survey = Survey.create(:skip_validations => true, :creator => current_user)
    redirect_to edit_surveys_management_survey_path(@survey)
  end

  def edit
    @campaigns = Campaign.available_for_user(current_user)
  end

  def update
    @campaigns = Campaign.available_for_user(current_user)

    update! do |success, failure|
      success.html { redirect_to surveys_management_surveys_path }
      failure.html { render 'edit' }
      success.js {  }
    end
  end

  def destroy
    if @survey.destroy
      flash[:notice] = t("surveys_management.surveys.destroy.flash.notice.destroy_success")
    else
      flash[:alert] = t("surveys_management.surveys.destroy.flash.alert.destroy_failure")
    end
    redirect_to surveys_management_surveys_path
  end

  def duplicate
    if @survey.duplicate!
      flash[:notice] = t("surveys_management.surveys.duplicate.flash.notice.duplication_success")
    else
      flash[:alert] = t("surveys_management.surveys.duplicate.flash.alert.duplication_failure")
    end

    redirect_to :back
  end

  def send_to_newsletters
    @survey.delay(:queue => "surveys_sending_to_newsletter_lists").send_to_newsletter_lists!

    flash[:notice] = I18n.t("surveys_management.surveys.send_to_newsletters.flash.notice.survey_queued_for_sending_to_newsletters")
    redirect_to :back
  end

  def show
    @survey_recipient = @survey.survey_recipients.new
    @survey_recipient.build_survey_answers_ordered
  end

  protected

  def collection
    @search = Survey.scoped_search(params[:search])
    @search.created_by = current_user unless current_user.admin?
    @surveys = @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Survey.per_page)
  end

  def fetch_object
    @survey = Survey.find(params[:id])
    raise CanCan::AccessDenied unless @survey.can_be_managed_by?(current_user)
  end
end
