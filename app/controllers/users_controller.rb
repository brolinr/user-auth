class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        flash[:success] = "User successfully created"
        redirect_to @user
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end

    def show
      @user = User.find(params[:id])
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = 'Object was successfully deleted.'
        redirect_to users_url
      else
        flash[:error] = 'Something went wrong user was not deleted.'
        redirect_to users_url
      end
    end

    def index
      @users = User.all
      @user_count = @users.count
    end
    
end
