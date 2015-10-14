class SearchesController < ApplicationController

  def index
    @search_results = Article.search(params[:q])
    render :index
  end

end
