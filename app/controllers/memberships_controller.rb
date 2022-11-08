class MembershipsController < ApplicationController

    def index
        render json: Membership.all, status: :ok
    end

    def create
        membership = Membership.create(membership_params)
        render json: membership, status: :created
    end



private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

end




 


