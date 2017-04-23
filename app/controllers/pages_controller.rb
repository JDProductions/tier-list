class PagesController < ApplicationController
  include ApplicationHelper
  def home
  @articles = Article.all
  end
  def tierlist

  end

end