class HelpPopupsController < ApplicationController
  layout 'help_popup'
  def show
    @article = Article::Cms::HelpPopup.where(:key => params[:id]).first
  end
end