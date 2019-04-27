class PostsController < ApplicationController
	def top
	end

	def new
		@posts = Post.all
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		post = Post.new(post_params)
		if post.save
		    redirect_to post_path(post)
		    flash[:notice] = 'Book was successfully created.'
		end
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		if post.update(post_params)
		    redirect_to post_path(post)
		    flash[:notice] = 'Book was successfully updated.'
		end
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
			redirect_to new_post_path
			flash[:notice] = 'Book was successfully destroyed.'
    	end
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
