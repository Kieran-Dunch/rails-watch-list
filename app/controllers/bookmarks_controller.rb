class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:create, :destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end

  def destroy
    bookmark = set_bookmark
    bookmark.delete
    redirect_to list_path(bookmark.list)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def bookmark_params
    params.require(:list).permit(:name)
  end
end
