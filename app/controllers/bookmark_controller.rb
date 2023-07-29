class BookmarkController < ApplicationController
  def create
    content = Content.find(params[:content_id])
    bookmark = current_user.bookmarks.new(content_id: content.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    content = Content.find(params[:content_id])
    bookmark = current_user.bookmarks.find_by(content_id: content.id)
    bookmark.destroy
    redirect_to request.referer
  end
end
