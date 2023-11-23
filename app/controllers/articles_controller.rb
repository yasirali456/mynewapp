class ArticlesController < ApplicationController
	def show
		@comment = Comment.new
		@article = Article.friendly.find(params[:id])
	end 
end
