class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR synopsis ILIKE :query"
      @movies = @movies.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end
end
