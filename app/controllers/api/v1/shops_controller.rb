class Api::V1::ShopsController < Api::V1::BaseController

  before_action :set_shop, only: [:show]
  skip_before_action :authenticate_customer!, only: [:index, :show]

  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def edit
  end


  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :address, :avatar_url, :opening_hours, :rating_from_diaping)
  end
end

