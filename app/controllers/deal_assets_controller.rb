class DealAssetsController < ApplicationController
  before_filter :set_deal
  before_filter :set_asset

  def download
    send_file (Rails.env == "production") ? @asset.url : @asset.asset.path
  end

  private

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def set_asset
    @asset = Asset.find(params[:id])
  end

end