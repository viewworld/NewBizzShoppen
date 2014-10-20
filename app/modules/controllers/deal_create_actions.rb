module Controllers
  module DealCreateActions

    def new
      @deal = Deal.new(:start_date => Date.today, :end_date => Date.today, :min_created_leads => Settings.default_group_deal_min_leads_created.to_i, :use_company_name_as_category => true,
                       :deal_confirmation_page => I18n.t("deals.common.default_confirmation_page_msg"))
      @deal_for_duplication = if current_user.admin?
                                Deal.find_by_id(params[:deal_id])
                              else
                                Deal.where("creator_id IN (?) or email_address = ? or deal_admin_email IN (?)", current_user.call_centre? ?
                                    current_user.subaccount_ids + [current_user.id] : current_user.id, current_user.email, current_user.call_centre? ?
                                               current_user.subaccounts.map(&:email) + [current_user.email] : current_user.email).find_by_id(params[:deal_id])
                              end
      @deal.duplicate_fields(@deal_for_duplication)
      @deal.creation_step = 1 if @deal_for_duplication
      respond_to do |content|
        content.html {}
        content.js {
          @user = User::Supplier.where(:email => params[:email]).first
        }
      end
    end

    def create

      @deal = current_user.has_any_role?(:admin, :call_centre, :call_centre_agent) ? Deal.new(params[:deal]) : current_user.deals.build(params[:deal])
      @deal.min_created_leads = Settings.default_group_deal_min_leads_created.to_i unless current_user.admin?
      @deal.creator = current_user if current_user.has_any_role?(:admin, :call_centre, :call_centre_agent)
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
end