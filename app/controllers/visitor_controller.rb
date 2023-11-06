class VisitorController < ApplicationController
  def index
    @articles = Article.all
  end
end
