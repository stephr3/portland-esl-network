class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @admin = Admin.find(params[:admin_id])
    @post = @admin.posts.new(post_params)
    if @post.save
      flash[:notice] = "You have successfully created your blog post!"
      redirect_to posts_path
    else
      flash[:alert] = "We're sorry, your post has not been successfully created."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
