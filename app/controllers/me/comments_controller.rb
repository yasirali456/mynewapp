class Me::CommentsController < ApplicationController

def create
	@comment = current_user.comments.new(comment_params)
	byebug
	if @comment.save
  		redirect_to root_path
	else
  		request.referrer
	end
end

def edit
	@comment = Comment.friendly.find(params[:id])
end

def update
	@comment = Comment.find(params[:id])

	if @comment.update(comment_params)
		redirect_to @comment
	else
		render :edit, status: :unprocessable_entity
	end
end

def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy

	redirect_to me_comments_path, status: :see_other
end

	private
		def comment_params
  			params.require(:comment).permit(:content)
		end
end
