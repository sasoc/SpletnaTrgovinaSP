class HomeController < ApplicationController
  layout "application"
  load_and_authorize_resource :only => [:new]
  before_filter :authenticate_user!, :except => [:index, :search]

  def index
    @records = Record.all
    @records_search = Record.new
    @item = CardItem.new
  end

  def search

    if params[:genre].nil?
      if params[:album] == ""
        if params[:artist] == ""
          if params[:media].nil?

            @records=Record.all.order('updated_at ASC')
          else
            @records=Record.where(media: params[:media])
          end
        else
          if params[:media].nil?
            @records=Record.where("artist ILIKE ?", '%'+params[:artist]+'%')
          else
            @records=Record.where("artist ILIKE ?", '%'+params[:artist]+'%').where(media: params[:media])
          end
        end
      else
        if params[:artist] == ""
          if params[:media].nil?
            @records=Record.where("album ILIKE ?", '%'+params[:album]+'%')
          else
            @records=Record.where(media: params[:media]).where("album ILIKE ?", '%'+params[:album]+'%')
          end
        else
          if params[:media].nil?
            @records=Record.where("artist ILIKE ?", '%'+params[:artist]+'%').where("album ILIKE ?", '%'+params[:album]+'%')
          else
            @records=Record.where("artist ILIKE ?", '%'+params[:artist]+'%').where(media: params[:media]).where("album ILIKE ?", '%'+params[:album]+'%')
          end
        end
      end
    else
      if params[:album] == ""
        if params[:artist] == ""
          if params[:media].nil?
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]})
          else
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where(media: params[:media])
          end
        else
          if params[:media].nil?
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where("artist ILIKE ?", '%'+params[:artist]+'%')
          else
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where("artist ILIKE ?", '%'+params[:artist]+'%').where(media: params[:media])
          end
        end
      else
        if params[:artist] == ""
          if params[:media].nil?
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where("album ILIKE ?", '%'+params[:album]+'%')
          else
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where(media: params[:media]).where("album ILIKE ?", '%'+params[:album]+'%')
          end
        else
          if params[:media].nil?
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where("artist ILIKE ?", '%'+params[:artist]+'%').where("album ILIKE ?", '%'+params[:album]+'%')
          else
            @records=Record.includes(:record_genres).where(record_genres: {genre_id: params[:genre]}).where("artist ILIKE ?", '%'+params[:artist]+'%').where(media: params[:media]).where("album ILIKE ?", '%'+params[:album]+'%')
          end
        end
      end

    end
  end



  def add_to_card
    record = Record.find(params[:id])
    if record.user_id != current_user.id
      item=CardItem.new(record_id: params[:id], user_id: current_user.id)
      item.save
    end
  end

end
