class Api::V1::PlayercardController < ApplicationController
    def index      
        if params[:user_id]
            @user = set_user
            @playercard = @user.playercard
        else
            @playercard = Playercard.all   
        end
        render json: @playercard
    end

    def show
        @playercard = Playercard.find(params[:id])
        render json: @playercard
    end

    def create
         if logged_in?
            @playercard = Playercard.new(playercard_params)
            @user = current_user
            
            if @playercard.save
                render json: @user
            else
                render json: {
                error: @playercard.errors.full_messages.to_sentence
                }
            end
         end
    end

    def update
        @playercard = Playercard.find(params[:id])
            if @playercard.update(playercard_params)
                render json: @playercard
            else
                render json: {
                    error: @playercard.errors.full_messages.to_sentence
                }
            end
    end

    private 

    def playercard_params
      params.require(:playercard).permit(:player_nickname, :player_height_in_feet, :player_height_in_inches, :player_weight, :player_age, :player_fav_player, :user_id)
    end

    def set_user
        @user = User.find(params[:user_id])
    end
    
end
