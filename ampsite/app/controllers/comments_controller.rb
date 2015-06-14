class CommentsController < ApplicationController
  
  def show
  end

  def new
    @post_id = params[:post_id]
    @comment = Comment.new
    render 'new'
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: @comment.post_id)
    @topic = @post.topic
    if @comment.save
      redirect_to topic_post_path(@topic, @post)
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

  def comment_params
    params.require(:comment).permit(:user_id, 
                                    :post_id,
                                    :content)
  end
  
end
