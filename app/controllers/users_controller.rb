class UsersController < ApplicationController
    def index
        @users = User.includes(:pending_sent_requests, :pending_received_requests, :friends_1, :friends_2).limit(20)
    end
    
    def show
        @posts = Post.where(author: current_user).order(created_at: :desc)
        @user = User.find(params[:id])
        @post = current_user.posts.new
    end

    def requests
        @requests = current_user.pending_received_requests
    end
end
