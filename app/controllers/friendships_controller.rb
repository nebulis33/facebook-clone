class FriendshipsController < ApplicationController
    def create
        @request = current_user.requests_sent.build(requestee_id: params[:user_id])
        if @request.save
            redirect_to user_path(params[:user_id])
        else
            flash[:errors] = @request.errors.full_messages
            redirect_to user_path(params[:user_id])
        end
    end

    def update
        @request = Friendship.find_by(requestor_id: params[:user_id], requestee_id: current_user.id)
        if @request.toggle!(:status)
            redirect_to user_path(params[:user_id])
        else
            flash[:errors] = @request.errors.full_messages
            redirect_to user_path(params[:user_id])
        end
    end

    def destroy
        @request = Friendship.find_by(requestor_id: params[:user_id], requestee_id: current_user.id)
        @request.destroy
        redirect_to user_path(params[:user_id])
    end
end
