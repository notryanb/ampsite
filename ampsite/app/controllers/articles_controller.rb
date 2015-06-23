class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render 'index'
  end

  def show
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

  def article_params
    params.require(:article).permit(:title,
                                    :body,
                                    :user_id)
  end
end