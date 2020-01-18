class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
    
        render json: @users
        # users_json = UserSerializer.new(@users).serialized_json
        # render json: users_json
      end

      def show
        render json: @user
        # user_json = UserSerializer.new(@user).serialized_json
        # render json: user_json
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          render json: @user
        #   render json: UserSerializer.new(@user), status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user
          @user = User.find(params[:id])
        end
  
      def user_params
          params.require(:user).permit(:username, :email, :password)
      end
end
