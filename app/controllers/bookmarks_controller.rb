class BookmarksController < ApplicationController
  before_action :find_content # アクション呼び出し前にかならずContentを取得する
  
  def create
    # ユーザーに紐づくコンテンツのBookmarkを作成
    current_user.bookmarks.create(content_id: @content.id)
  end

  def destroy
    # ユーザーとコンテンツに紐づくBookmarkを探し出し削除
    # MEMO: find_byは、はじめに見つけた1件を取得のメソッド
    current_user.bookmarks.find_by(content_id: @content.id).destroy
  end

  private
  
  def find_content
    # before_actionで呼び出しされる箇所
    @content = Content.find(params[:content_id])
  end
end
