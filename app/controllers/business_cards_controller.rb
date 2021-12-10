class BusinessCardsController < ApplicationController
    before_action :require_user

    def new
        @business_card = BusinessCard.new 
    end

    def create
        @business_card = BusinessCard.create(business_card_params)
        @business_card.user_id = session[:user_id]

        if @business_card.save 
            redirect_to '/index'
        else
            render :new
        end
    end

    def index 
    end

    def show 
    end

    private 

    # def require_login
    #     return head(:forbidden) unless session.include? :user_id
    #     redirect_to '/'
    # end

    def business_card_params
        params.require(:business_card).permit(:name, :description, :email, :web_site, :phone_number)
    end


end
