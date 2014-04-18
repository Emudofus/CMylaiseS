class CommentsController < ApplicationController
	before_filter :logged!
	before_filter :admin!, only: [:destroy]

	# POST /comments
	# POST /comments.js
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(params[:comment])
		@comment.account = current_account

		respond_to do |format|
			if @comment.save
				format.html { redirect_to @article, notice: 'Comment was successfully created.' }
				format.js
			else
				format.html { render action: "new" }
				format.js { }
			end
		end
	end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    article = @comment.article
    @comment.destroy

	redirect_to article
  end
end
