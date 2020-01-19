class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: @users
    end

    def new
      @user = User.new
    end

    def show
      @user = set_user
      render json: @user
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        render json: @user
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
