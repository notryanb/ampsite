class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
    render 'show'
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user, 
                                 :title, 
                                 :content)
  end
  
end
