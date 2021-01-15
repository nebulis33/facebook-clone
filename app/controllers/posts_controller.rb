class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            flash[:success] = "Your post has been posted!"
            redirect_to request.referer
        else
            flash.now[:errors] = @post.errors.full_messages
            render 'new'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destory
            flash[:success] = "Post succesfully deleted"
            redirect_to posts_url
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to posts_url
        end
    end

    def like
        post = Post.find(params[:id])
        like = post.likes.new(user_id: current_user.id)
        like.save
    end

    def unlike
        post = Post.find(params[:id])
        like = post.likes.where(user_id: current_user.id).first
        like.destroy if like
    end

    private
        def post_params
            params.require(:post).permit(:body)
        end
end
