class Administration::YoutubeIntroductionsController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'global'

  before_filter :set_youtube_introduction, only: [:edit, :update, :destroy]

  def new
    @youtube_introduction = YoutubeIntroduction.new
  end

  def create
    @youtube_introduction = YoutubeIntroduction.new(youtube_introduction_params)

    common_save(@youtube_introduction, success: { redirect: edit_administration_setting_path })
  end

  def update
    @youtube_introduction.assign_attributes(youtube_introduction_params)

    common_save(@youtube_introduction, success: { redirect: edit_administration_setting_path })
  end

  def destroy
    common_destroy(@youtube_introduction, success: { redirect: edit_administration_setting_path })
  end

  private

  def set_youtube_introduction
    @youtube_introduction = YoutubeIntroduction.find(params[:id])
  end

  def youtube_introduction_params
    params.require(:youtube_introduction).permit(:url, :locale_code, :site, image_attributes: [:data])
  end
end
