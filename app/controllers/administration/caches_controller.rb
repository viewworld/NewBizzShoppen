class Administration::CachesController < Administration::AdministrationController
  def destroy
    begin
      I18n.cache_store.clear
    rescue
      #nothing
    end

    redirect_to :back, notice: t('common.cache_cleared')
  end
end
