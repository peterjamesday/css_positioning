class CommentsController < ApplicationController
	before_filter :authenticate_user!, :only => [:create]



	def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create!(safe_comments_params)
        redirect_to @post
    end

    private
    	def safe_comments_params
    		params.require(:comment).permit(:body)
    	end
end
