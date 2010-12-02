class HelpPopupsController < ApplicationController
  layout 'help_popup'
  def show
    @help = Article::Cms.help_popups.where(:key => params[:id]).first
  end
end