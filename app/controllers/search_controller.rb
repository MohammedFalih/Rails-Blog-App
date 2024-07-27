class SearchController < ApplicationController
  def index
    @q = Post.joins(:user).ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
