class Suppliers::NewsletterListsController < Suppliers::AdvancedSupplierController
  inherit_resources

  set_tab "newsletter"
  set_subtab "newsletter_lists"

  def index
    @newsletter_lists = current_user.newsletter_lists.reorder("id DESC")
  end
end