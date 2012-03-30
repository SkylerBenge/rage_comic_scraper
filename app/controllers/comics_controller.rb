class ComicsController < ApplicationController

  def index
    @comics = Comic.all

    respond_to do |format|
      format.html
      format.json { render json: @comics }
    end
  end

  def show
    @comic = Comic.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @comic }
    end
  end

end
