class Administration::YoutubeIntroductionsController < Administration::AdministrationController
  set_tab 'settings'
  set_subtab 'global'

  before_filter :set_youtube_introduction, only: [:edit, :update, :destroy]

  def new
    @youtube_introduction = YoutubeIntroduction.new
  end

  def create
    @youtube_introduction = YoutubeIntroduction.new(youtube_introduction_params)

    if @youtube_introduction.save
      redirect_to edit_administration_setting_path, notice: t('flash.actions.create.notice', resource_name: 'Youtube Introduction')
    else
      render :new
    end
  end

  def update
    if @youtube_introduction.update_attributes(youtube_introduction_params)
      redirect_to edit_administration_setting_path, notice: t('flash.actions.update.notice', resource_name: 'Youtube Introduction')
    else
      render :edit
    end
  end

  def destroy
    @youtube_introduction.destroy
    redirect_to edit_administration_setting_path, notice: t('flash.actions.destroy.notice', resource_name: 'Youtube Introduction')
  end

  private
  def set_youtube_introduction
    @youtube_introduction = YoutubeIntroduction.find(params[:id])
  end

  def youtube_introduction_params
    params.require(:youtube_introduction).permit(:url, :locale_code, :site, image_attributes: [:data])
  end
end
