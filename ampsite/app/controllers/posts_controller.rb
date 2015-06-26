class PostsController < ApplicationController

  before_action :authorize, only: [:new, :create]

  def index
  end

  def show
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic
    @comments = @post.comments
    render 'show'
  end

  def new
    @topic_id = params[:topic_id]
    @post = Post.new
    render 'new'

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to topic_path(@post.topic_id)
    else
      render action: :new
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
    params.require(:post).permit(:user_id, 
                                 :topic_id,
                                 :title, 
                                 :content)
  end
  
end
