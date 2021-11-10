class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)

    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to @list
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
    redirect_to root_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
