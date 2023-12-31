class Me::ArticlesController < ApplicationController
def index
	@articles = Article.all
end

def show
	@article = Article.friendly.find(params[:id])
end

def new
	@article = Article.new
end

def create
	@article = current_user.articles.new(article_params)
	if @article.save
  		redirect_to me_articles_path
	else
  		render :new, status: :unprocessable_entity
	end
end

def edit
	@article = Article.friendly.find(params[:id])
end

def update
	@article = Article.find(params[:id])

	if @article.update(article_params)
		redirect_to @article
	else
		render :edit, status: :unprocessable_entity
	end
end

def destroy
	@article = Article.find(params[:id])
	@article.destroy

	redirect_to me_articles_path, status: :see_other
end

private
	def article_params
  		params.require(:article).permit(:title, :description)
	end
end
