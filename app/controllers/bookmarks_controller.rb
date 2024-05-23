class BookmarksController < ApplicationController
  def create
    list = List.find(params[:list_id])

    @bookmark = list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to list_path(list)
    else
      @list = list
      @bookmarks = list.bookmarks.where.not(updated_at: nil)
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
