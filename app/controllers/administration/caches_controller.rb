class Administration::CachesController < Administration::AdministrationController

  def destroy
    I18n.cache_store.clear
    flash[:notice] = t("common.cache_cleared")
    redirect_to :back
  end

end