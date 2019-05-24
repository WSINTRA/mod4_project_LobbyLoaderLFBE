class UsersController < ApplicationController

  skip_before_action :authorized, only: [:create]
  before_action :find_user, only: [:update]

   def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user, username may already exist or an error occured' }, status: :not_acceptable
    end
  end

  def update
    @user.update(update_params)
    render json: @user
  end
 
  private
 
 def find_user
 @user = User.find(params[:id])
 end

 def update_params
   params.require(:user).permit(:username,:email, :image_url, :display_name, :bio, :tag_line)
 end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end


 