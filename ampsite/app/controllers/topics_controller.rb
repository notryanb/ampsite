class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(title: :asc)
    @comment_count = Comment.all.count
    render 'index'
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @posts = @topic.posts
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
  
end
