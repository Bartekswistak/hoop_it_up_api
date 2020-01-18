class PlayercardsController < ApplicationController
    def index      
        @playercards = Playercard.all 
        render json: @playercards
        # if logged_in?
        # @playercard = current_user.playercard
        # render json: PlayerCardSerializer.new(@playercard)
       
        # else 
        #     render json: {
        #         error: "You must be logged in to see your player card."
        #     }
        # end
    end

    def show
        @playercard = Playercard.find(params[:id])
        render json: @playercard
            
        # @playercard = current_user.playercard
            
           
            # else 
            #     render json: {
            #         error: "You must be logged in to see your player card."
            #     }
            # end
    end

    def create 
        @playercard = Playercard.new(playercard_params)
            if @playercard.save
                render json: @playercard
                # render json: PlayerCardSerializer.new(@playercard), status: :created
            else
            render json: {

                error: @playercard.errors.full_messages.to_sentence, status: :unproccessable_entity
            }
            end

end

def update
    @playercard = Playercard.find(params[:id])
    if @playercard.update(playercard_params)
      render json: @playercard
    else
        render json: {

            error: @playercard.errors.full_messages.to_sentence, status: :unproccessable_entity
         }
    end
  end

  private 

  def playercard_params
      params.require(:playercard).permit(:player_nickname, :player_height_in_feet, :player_height_in_inches, :player_weight, :player_age, :player_fav_player, :user_id)
  end
end
