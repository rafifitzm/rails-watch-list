class ListsController < ApplicationController
  def index
    @lists = List.all
    @images = ["cinema-projector-modern", "cinema-projector-tape", "cinema-projector", "cinema-seats-dark", "cinema-sign"].shuffle
    @lists_length = @lists.length
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def test
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
