class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @post = current_user.posts.new
    end
end
