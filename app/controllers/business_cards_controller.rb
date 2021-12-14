class BusinessCardsController < ApplicationController
    before_action :require_user

    def new
        @business_card = BusinessCard.new 
    end

    def create
        @business_card = BusinessCard.new(business_card_params)
        @business_card.user_id = session[:user_id]

        if @business_card.save 
            redirect_to business_card_path(@business_card)
        else
            render :new
        end
    end

    def index 
    end

    def show 
        @business_card = BusinessCard.find_by(params[:id])
    end

    private 

    def business_card_params
        params.require(:business_card).permit(:name, :description, :email, :web_site, :phone_number)
    end


end
