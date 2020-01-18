class Api::V1::SessionsController < ApplicationController
    
    def create
       @user = User.find_by(username: params[:session][:username])

       if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
            render json: @user
       else
        render json: {
            error: "Invalid Name/Password"
        }
       end
    end

    def destroy
        session.clear
        session.delete(:user_id)
        render json: {
            notice: "Successfully Logged Out."
        }
    end


    def get_current_user
        if logged_in?
            render json: current_user
        else
        render json: {
            # error: "Log In To Continue"
        }
       end
    end

end