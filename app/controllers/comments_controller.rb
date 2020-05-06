class CommentsController < ApplicationController
	def create
		@article = Article.find params[:article_id]
		@comment = current_user.comments.new(comment_params)
		@comment.article = @article
		@comment.save
		redirect_to article_path(@article)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@article = @comment.article
		@comment.destroy
		redirect_to article_path(@article)
	end
	
   private

   def comment_params
		params.require(:comment).permit(:body)
   end
end
