module Controllers
  module PrintActions
    def create
      respond_to do |format|
        format.html {
          @print = current_user.lead_purchases.where(:id => params[:lead_purchase_ids])
          render :file => "/printouts/index.html.erb", :layout => false
        }
      end
    end
  end
end