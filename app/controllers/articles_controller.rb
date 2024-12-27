class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def create
    article = Article.create(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: { errors: article.errors.messages }, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
