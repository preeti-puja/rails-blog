class UsersController < ApplicationController

    def index
        @users = User.all
        if params[:query].present?
            @users = @users.where("first_name LIKE ? OR email LIKE ?", "#{params[:query]}%", "#{params[:query]}%")  
        end 
    end

    def new
        @user = User.new
        @user.addresses.new

        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @user = User.new(user_params)

        unless @user.save!
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, addresses_attributes: [:street1, :street2, :city, :state, :country, :pin_code])
    end
end
