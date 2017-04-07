class PagesController < ActionController::Base
  def home
  @articles = Article.all
  end
  def tierlist

  end

end