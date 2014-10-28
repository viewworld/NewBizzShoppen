class FixAssetableTypeForArticleAssets < ActiveRecord::Migration
  def up
    Asset.where("assetable_type like 'Article%'").update_all(assetable_type: 'Article')
  end

  def down
    Asset.where(assetable_type: 'Article').each do |asset|
      asset.update_attributes(assetable_type: asset.assetable.class.name)
    end
  end
end
