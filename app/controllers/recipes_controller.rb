class RecipesController < ApplicationController

  before_action :find_dish, only: [:index, :show]

  def new
    @homepage = true
  end

  def index
    @nav = true
    # @dish = params[:dish]

    if @dish == nil or @dish == ""
      flash[:error] = "Please enter a dish. Search can't be blank."
      redirect_to root_path
    else

    @recipes = EdamamApiWrapper.find_recipes('q', @dish)
    if @recipes.empty?
      flash[:error] = "Sorry, something went wrong. No recipes found for #{@dish}. Try another search."
      redirect_to root_path
    else
      render :index
      #list recipes
    end
  end
  end

  def show
    @nav = true
    # @dish = params[:dish]

    find_uri
    # @uri = params[:uri]

    if @uri == nil || @uri == ""
      flash[:error] = "Something went wrong. Can't locate link to this #{@dish}."
      redirect_to root_path
    else
      @recipe = EdamamApiWrapper.find_recipes('r', @uri)
    end
  end

  private

  def find_dish
    @dish = params[:dish]
  end

  def find_uri
    @uri = params[:uri]
  end

end
