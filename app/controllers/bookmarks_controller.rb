class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    # @list_bookmark = List.find(params[:bookmark])
    # @list = @list_bookmark[:list_id]
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to @list
    else
      render :new
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
