class Api::V1::ShopsController < Api::V1::BaseController
  before_action :set_shop, only: [:show]
  def index
    @shops = Shop.all
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
