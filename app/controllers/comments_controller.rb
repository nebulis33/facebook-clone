class CommentsController < ApplicationController
    def index
        @commments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            flash[:success] = "Your comment has been commented!"
            redirect_to request.referer
        else
            flash.now[:errors] = @comment.errors.full_messages
            render 'new'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destory
            flash[:success] = "comment succesfully deleted"
            redirect_to request.referer
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to request.referer
        end
    end

    def like
        comment = Comment.find(params[:id])
        like = comment.likes.new(user_id: current_user.id)
        like.save
    end

    def unlike
        comment = Comment.find(params[:id])
        like = comment.likes.where(user_id: current_user.id).first
        like.destroy if like
    end

    private
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
end
