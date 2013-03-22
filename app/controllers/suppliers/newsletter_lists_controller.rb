class Suppliers::NewsletterListsController < Suppliers::AdvancedSupplierController
  inherit_resources

  set_tab "newsletter"
  set_subtab "newsletter_lists"

  def index
    if current_user.cm_client and !current_user.my_leads_list
      current_user.setup_my_leads_list!
    end
    @newsletter_lists = current_user.newsletter_lists.reorder("id DESC")
  end
end