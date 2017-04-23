class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update , :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article Successfully Created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    set_article()
  end

  def destroy
    set_article()
    @article.destroy
    flash[:danger] = "Article was sucessfully deleted"
    redirect_to articles_path
  end

  def edit
    set_article()
  end

  def update
    set_article()
    if @article.update(article_params)
      flash[:success] = "Article was sucessfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
      end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:danger] = "You can only edit or delete your own articles."
      redirect_to root_path
    end
  end
  end