class ListsController < ApplicationController
  before_action :find_list, only: [:show]
  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks.sort_by{ |bookmark| bookmark.updated_at }
    @movies = @list.movies
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(params_list)
    if list.save
      redirect_to list_path(list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name)
  end
end
