class Api::V1::ShopsController < Api::V1::BaseController

  respond_to :json
  acts_as_token_authentication_handler_for Shop, except: [ :show, :index ]
  before_action :set_shop, only: [:show]
  skip_before_action :authenticate_customer!, only: [:index, :show]

  def index
    @shops = policy_scope(Shop)
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.shop = current_shop
    authorize @shop
    if @shop.save
      render :show, status: :created
    else
      render_error
    end
  end

  def edit
  end


  private

  def set_shop
    @shop = Shop.find(params[:id])
    authorize @shop
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :address, :avatar_url, :opening_hours, :rating_from_diaping)
  end

  def render_error
    render json: { errors: @shop.errors.full_messages },
      status: :unprocessable_entity
  end
end

