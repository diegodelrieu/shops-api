class Api::V1::ShopsController < Api::V1::BaseController
  skip_before_action :authenticate_customer!, only: :index
  def index
    @shops = Shop.all
  end
end
