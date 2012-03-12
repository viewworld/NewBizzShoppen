class ChainMailsController < ApplicationController

  def show
    if @chain_mail = ChainMail.find_by_id(params[:id])
      @chain_mail.register_click!
      redirect_to params[:redirect]
    else
      redirect_to root_path
    end
  end

end
