class Callers::ChainMailItemsController < Callers::CallerController

  def update
    @chain_mail_item = ChainMailItem.find(params[:id])
    @chain_mail_item.chain_mail_materials << Asset.find(params[:material_id])
    @chain_mail_item.save
    respond_to do |format|
      format.js {  }
    end
  end

  def destroy
    @chain_mail_item = ChainMailItem.find(params[:id])
    @chain_mail_item.chain_mail_materials.delete(Asset.find(params[:material_id]))
    @chain_mail_item.save
    respond_to do |format|
      format.js {  }
    end
  end
end