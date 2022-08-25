class MoviesController < ApplicationController
  def index
    # sql_query = <<~SQL
    #   movies.title @@ :query
    #   OR movies.synopsis @@ :query
    #   OR directors.first_name @@  :query
    #   OR directors.last_name @@  :query
    # SQL

    if params[:query].present?  
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
