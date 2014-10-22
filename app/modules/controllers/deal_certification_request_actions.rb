module Controllers
  module DealCertificationRequestActions

    public

    def edit

    end

    def update
      if @deal.update_attributes(params[:deal])
        if user_signed_in?
          @deal.current_dcr.change_state(params[:accept] == "true" ? "agreed" : "fail")
          flash[:notice] = params[:accept] == "true" ? t("supplier.deal_certification_requests.update.flash.certify_success") : t("supplier.deal_certification_requests.update.flash.reject_success")
          redirect_to current_user.deal_certification_requests.blank? ? root_path : suppliers_deal_certification_requests_path
        else
          unless params[:accept] == "true"
            @deal.current_dcr.change_state("fail")
            flash[:notice] = t("supplier.deal_certification_requests.update.flash.reject_success")
          end
          params[:accept] == "true" ? redirect_to(new_deal_supplier_account_path(:id => params[:id], :token => params[:token])) : redirect_to(root_path)
        end
      else
        render :edit
      end
    end

    private

    def set_deal
      @deal = Deal.find(params[:id])

      unless (@deal.current_dcr and @deal.current_dcr.active? and ((user_signed_in? and @deal.current_dcr.email == current_user.email) or (!user_signed_in? and params[:token] == @deal.current_dcr.token)))
        flash[:notice] = t("supplier.deal_certification_requests.update.flash.not_authorized")
        redirect_to root_path
      else
        if !@deal.supplier.nil? and !user_signed_in?
          redirect_to edit_suppliers_deal_certification_request_path(@deal)
          sign_in(@deal.supplier)
        end
      end
    end
  end
end