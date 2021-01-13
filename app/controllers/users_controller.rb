class UsersController < ApplicationController
    def index
        @users = User.all.limit(20)
    end
    
    def show
        @user = User.find(params[:id])
        @post = current_user.posts.new
    end
end
