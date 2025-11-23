class ListsController < ApplicationController
  def index
    @lists = List.all
    @images = ["cinema-projector-modern", "cinema-projector-tape", "cinema-projector", "cinema-seats-dark", "cinema-sign"].shuffle
    @lists_length = @lists.length
  end

  def new
    @list = List.new
    # @image = ["cinema-projector-modern", "cinema-projector-tape", "cinema-projector", "cinema-seats-dark", "cinema-sign"].sample
    # @list.image.attach(io: File.open("app/assets/images/#{@image}.jpg"), filename: "image.jpg", content_type: "image/jpeg")
  end

  def create
    @list = List.new(list_params)
    image = ["cinema-projector-modern", "cinema-projector-tape", "cinema-projector", "cinema-seats-dark", "cinema-sign"].sample
    @list.image.attach(io: File.open("app/assets/images/#{image}.jpg"), filename: "image.jpg", content_type: "image/jpeg")
    if @list.save
      redirect_to lists_path
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @movies = Movie.all
    @bookmarks_length = @bookmarks.length
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path
    end

  end

  def test
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
