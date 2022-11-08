class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
# rescue_from ActiveRecord: :RecordInvalid, with: :record_invalid
    
    def index
        render json: Gym.all, status: :ok
    end


    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    end

    def destroy
        Gym.find(params[:id]).destroy
        #render json: {} does it want an empty body like this?
        head :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def record_not_found
        render json: {error: "Gym not found"}
    end
end