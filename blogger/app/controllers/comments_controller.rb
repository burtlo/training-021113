class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new params[:comment]
    @comment.article_id = params[:article_id]

    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end

end