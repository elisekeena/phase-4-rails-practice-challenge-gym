class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid



    def index
    memberships = Membership.all 
    render json: memberships, status: :ok
    end

    def show
    memberships = Membership.find(params[:id])
    render json: memberships, status: :ok
    end

    def create
        membership = Membership.create!(membership_params)   
        render json: membership, status: :created
    end

    private

    def not_found
        render json:{error: 'Membership Not Found'}, status: 404
    end

    def invalid
        render json:{error: 'Membership must have a gym'}, status: 422
    end

    def membership_params
        params.permit(:charge, :client_id, :gym_id)
    end






end
