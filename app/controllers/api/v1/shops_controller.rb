class Api::V1::ShopsController < Api::V1::BaseController

  respond_to :json
  #acts_as_token_authentication_handler_for Customer, only: [ :show ]
  before_action :set_shop, only: [:show]
  skip_before_action :authenticate_customer!, only: [:index, :show, :create, :new]
  skip_after_action :verify_authorized

  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      response = { message: 'Shop created successfully', auth_token: @shop.authentication_token }
      render json: response, status: :created
    else
      render json: @shop.errors, status: :bad
    end
  end

  def edit
  end

  def pundit_user
    current_shop
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
    authorize @shop
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :address, :avatar_url, :opening_hours, :rating_from_diaping,:email, :password)
  end

  def render_error
    render json: { errors: @shop.errors.full_messages },
      status: :unprocessable_entity
  end
end

