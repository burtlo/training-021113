class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show

    @tag = Tag.find_by_name(params[:id])

    if @tag.nil?
      flash[:message] = "The tag could not be found"
      redirect_to tags_path
    end

    # When the tag is not found redirect to the the tags index page
  end
end
