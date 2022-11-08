class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        render json: Client.all, status: :ok
    end

    def show
        client = Client.find(params[:id])#we use find and not find_by because it raises an error and find_by raises an exception
        render json: client, status: 200
    end

    def update
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client, status: :ok
    end


    private

    def client_params
        params.permit(:name, :age)
    end

    def record_not_found
        render json: {error: "No client found"}
    end

end
