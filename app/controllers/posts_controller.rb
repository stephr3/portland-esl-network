class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @admin = Admin.find(params[:admin_id])
    @post = @admin.posts.new(post_params)
    if @post.save
      flash[:notice] = "You have successfully created your blog post!"
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      flash[:alert] = "We're sorry, your post has not been successfully created."
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @post = Post.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:admin_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have successfully submitted your edits for this post."
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      flash[:alert] = "We're sorry, your post updates have not been successfully processed."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
