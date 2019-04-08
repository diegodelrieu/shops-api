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
    authorize @shop
  end

  def edit
  end


  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
