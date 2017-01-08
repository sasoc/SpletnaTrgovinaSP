class RecordsController < ApplicationController
  layout "add"

  def new
    @records = Record.new
  end

  def create
    @records = Record.new(record_params)
    puts params[:genre]
    @records.genres = Genre.where(id: params[:genre])
    @records.user = User.find(current_user.id)
    @records.save
    redirect_to root_path
  end

  def edit

  end

  def update

  end

  private
    def record_params
      params.require(:record).permit(:album, :artist, :description, :price, :image)
    end
end
