class CommentsController < ApplicationController

  before_action :find_comment_and_article, except: [:index, :new, :create]

  def index
    @comments = Comment.all
    @article = Article.find(params[:article_id])
  end

  def show
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
    render :new
  end

  def create
    @article = Article.find_by_id(params[:article_id])
    @parent_comment = Article.find_by_id(params[:commentable_id])
    @comment = Comment.new(comment_params)
    if (@article)
      @comment.update_attribute(:commentable, @article)
      if (@comment.save)
        redirect_to article_path(@article)
      else
        render :new
      end
    else
      @comment.update_attribute(:commentable, @parent_comment)
      if (@comment.save)
        redirect_to comment_path(@parent_comment)
      else
        render :new
      end
    end

    # if @article.save
    #   redirect_to article_path()
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.new(comment_params)

    # if @comment.save
    #   redirect_to article_path(@article)
    # else
    #   render :new
    # end
    # if (params[:article_id])
    #   @parent = Article.find(params[:article_id])
    #   @article = @parent
    # else
    #   @parent = Comment.find(params[:comment_id])
    #   @article = Article.find(params[:article])
    # end
    # @comment = @parent.comments.new(comment_params)
    # @comment.save
    # if @article
    #   redirect_to article_path(@article)
    # else
    #   redirect_to articles_path
    # end

  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end

  def edit
    render :edit
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user)
    end
    def find_comment_and_article
      @comment = Comment.find(params[:id])
      @article = Article.find(params[:article_id])
    end
end
