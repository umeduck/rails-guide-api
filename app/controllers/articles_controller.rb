class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def show
    article = Article.find(params[:id])
    comments = Comment.where(article_id: params[:id])
    render json: { article: article, comments: comments }, status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: { errors: article.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: article, status: :ok
    else
      render json: { errors: article.errors.messages }, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
