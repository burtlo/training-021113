class ArticlesController < ApplicationController

  before_filter :require_login, except: [ :index, :show ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create params[:article]

    if @article.valid?
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes params[:article]

    # An alternative to updating the article
    # Article.update @article, params[:article]

    flash[:message] = "You're awesome, you updated the article"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:message] = "You're awesome, You deleted article '#{@article.title}'"
    redirect_to articles_path
  end

end