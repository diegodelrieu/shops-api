class Api::V1::UsersController < Api::V1::BaseController
  #acts_as_token_authentication_handler_for User, only: [ :show, :index, :update ]
  before_action :set_user, only: [ :show, :update ]
  def index
    @users = User.all
  end


  def show
  end

  def update
    if @user.update(user_params)
      response = { message: 'User updated successfully' }
      render json: response
    else
      response = { message: 'Cannot update User' }
      render json: response
    end
  end

  private

  def set_user
    puts "paramsid is ...#{params[:id]}"
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :open_id, :nickName, :gender, :language, :city, :province, :country, :avatarUrl)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

end
