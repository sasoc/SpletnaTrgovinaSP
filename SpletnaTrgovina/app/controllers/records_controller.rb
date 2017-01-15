require "open-uri"
class RecordsController < ApplicationController
  load_and_authorize_resource
  layout "add"

  def index
    @records = Record.where(user_id: current_user)
  end

  def all
    @records = Record.all
  end

  def new
    @records = Record.new
    @Qparam=params[:q]
    if params[:q]=="PL"
      @media="defaultPL.png"
    else
      @media="defaultCD.png"
    end
  end

  def create
    puts params[:image]
    #Če ni uporabnik izbral slike se doda defaul slika
    if params.require(:record)[:image].nil?
      @records = Record.new(record_params)
      if params[:media] == "PL"
        @records.image = File.open("public/defaultPl.png")
      else
        @records.image = File.open("public/defaultCD.png")
      end
    else
      @records = Record.new(record_params_img)
    end
    @records.genres = Genre.where(id: params[:genre])
    @records.user = User.find(current_user.id)
    @records.media = params[:media]
    if @records.save
      redirect_to records_path
    else
      @records.errors.full_messages.each {|x| flash[:x] = x}
      redirect_to new_record_path(:artist => @record.artist, :album => @record.album, :description => @record.description, :q => params[:media])
    end

  end

  def edit
    @records = Record.find(params[:id])
    @genre = [false, false, false, false, false, false, false, false, false]
    selected_genres=RecordGenre.where(record_id: params[:id])

    selected_genres.each do |i|
      @genre[i.genre_id - 1] = true
    end

  end

  def update
    @records = Record.find(params[:id])

    if @records.update_attributes(record_params)
      @records.genres = Genre.where(id: params[:genre])
      @records.save
      redirect_to records_path
    else
      @records.errors.full_messages.each {|x| flash[:x] = x}
      redirect_to edit_record_path(:artist => @record.artist, :album => @record.album, :description => @record.description, :q => params[:media])
    end

  end

  def destroy
    Record.find(params[:id]).destroy
    redirect_to records_path
  end

  def card
    item_ids=CardItem.where(user_id: current_user.id).pluck(:record_id)
    @records = Record.where(id: item_ids)
  end

  def remove_carditem
    item = CardItem.where(record_id: params[:format]).where(user_id: current_user.id).first.destroy
    redirect_to card_path
  end

  private
    def record_params
      params.require(:record).permit(:album, :artist, :description, :price)
    end
    def record_params_img
      params.require(:record).permit(:album, :artist, :description, :price, :image)
    end


end
