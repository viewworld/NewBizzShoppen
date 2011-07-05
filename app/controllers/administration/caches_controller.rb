class Administration::CachesController < Administration::AdministrationController

  def destroy
    begin
      I18n.cache_store.clear
    rescue
      #nothing
    end

    flash[:notice] = t("common.cache_cleared")
    redirect_to :back
  end

end