class UsersController < ApplicationController

    def index
        if params[:query].present?
            @users = User.where("first_name=? OR email=?", params[:query], params[:query])
        else
            @users = User.all
        end 
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save!
            redirect_to @user
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name)
    end
end
