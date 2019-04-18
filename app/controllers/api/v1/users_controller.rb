class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [ :show, :update ]
  def index
    @users = User.all
  end


  def show
  end

  def update
    if @user.update(user_params)
      render :index
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:userId, :openId, :nickName, :gender, :language, :city, :province, :country, :avatarUrl)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

end
