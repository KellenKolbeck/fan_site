class ArticlesController < ApplicationController

  before_action :find_article, except: [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    @comments = @article.comments
    @comments.each do |comment|
      comment.destroy
    end
    @article.destroy
    redirect_to articles_path
  end

  def edit
    render :edit
  end

  def update
    @article.update(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :edit
    end
  end

  private
    def article_params
      params.require(:article).permit(:content, :author, :title)
    end
    def find_article
      @article = Article.find(params[:id])
    end
end
