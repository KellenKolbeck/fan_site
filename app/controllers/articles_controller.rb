class ArticlesController < ApplicationController

  before_action :find_article, except: [:index, :new, :create]

  def index
    if (params[:sort])
      if (params[:sort] == "Alphabetical ASC")
        @articles = Article.all.sort{|a, b| a.title <=> b.title}
      elsif (params[:sort] == "Alphabetical DESC")
        @articles = Article.all.sort{|a, b| b.title <=> a.title}
      elsif (params[:sort] == "Newest")
        @articles = Article.all.sort{|a, b| b.created_at <=> a.created_at}
      else
        @articles = Article.all.sort{|a, b| a.created_at <=> b.created_at}
      end
    else
      @articles = Article.all
    end
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
