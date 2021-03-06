class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :current_user, only: [:edit, :update, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
	
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
end
