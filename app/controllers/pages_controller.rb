class PagesController < ApplicationController
  include ApplicationHelper
  def home
    redirect_to articles_path if logged_in?
  end
  def tierlist

  end

end