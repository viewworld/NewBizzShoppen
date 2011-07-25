module DealCreateActions

  def new
    @deal = Deal.new
    respond_to do |content|
      content.html {}
      content.js {
        @user = User::Customer.where(:email => params[:email]).first
      }
    end
  end

  def create
    @deal = current_user.admin? ? Deal.new(params[:deal]) : current_user.deals.build(params[:deal])
    @deal.creation_step = 1
    if @deal.save
      @deal.reload
      @deal.deal_template_ids = params[:deal][:deal_template_ids]
      @deal.save
      success(t("flash.deals.create.notice"))
    else
      render(:new)
    end
  end

end