class SearchController < ApplicationController
  def index
    @q = Post.joins(:user).includes(:rich_text_body, :user, :category).ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
