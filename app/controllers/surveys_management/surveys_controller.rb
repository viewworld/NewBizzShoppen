class SurveysManagement::SurveysController < SurveysManagement::SurveysManagementController
  inherit_resources

  set_tab "campaigns"
  set_subtab "surveys"

  def new
    @survey = Survey.create(:skip_validations => true, :creator => current_user)
    redirect_to edit_surveys_management_survey_path(@survey)
  end

  def edit
    @survey = Survey.find(params[:id])
    @campaigns = Campaign.available_for_user(current_user)
  end

  def update
    update! do |success, failure|
      success.html { redirect_to surveys_management_surveys_path }
      failure.html { render 'edit' }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to surveys_management_surveys_path }
    end
  end

  def send_to_newsletters
    @survey = Survey.find(params[:id])
    @survey.delay(:queue => "surveys_sending_to_newsletter_lists").send_to_newsletter_lists!

    flash[:notice] = I18n.t("surveys_management.surveys.send_to_newsletters.flash.notice.survey_queued_for_sending_to_newsletters")
    redirect_to surveys_management_surveys_path
  end

  protected

  def collection
    @search = Survey.scoped_search(params[:search])
    @surveys = @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Survey.per_page)
  end
end