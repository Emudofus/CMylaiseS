class ArticlesController < ApplicationController
	before_filter :admin!, except: [:index, :show]

	# GET /articles
	# GET /articles.json
	def index
		@articles = Article
			.order{created_at.desc}.page(params[:page]).per_page(2)
			.includes{comments} #no need to join it
			.includes{account}.joins{account}
	end

	# GET /articles/1
	# GET /articles/1.json
	def show
		@article = Article.includes{comments.account}.find(params[:id])
	end

	# GET /articles/new
	# GET /articles/new.json
	def new
		@article = Article.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @article }
		end
	end

	# GET /articles/1/edit
	def edit
		@article = Article.find(params[:id])
	end

	# POST /articles
	# POST /articles.json
	def create
		@article = Article.new(params[:article])
		@article.account = current_account

		respond_to do |format|
			if @article.save
				format.html { redirect_to @article, notice: 'Article was successfully created.' }
				format.json { render json: @article, status: :created, location: @article }
			else
				format.html { render action: "new" }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /articles/1
	# PUT /articles/1.json
	def update
		@article = Article.find(params[:id])
		@article.account = current_account

		respond_to do |format|
			if @article.update_attributes(params[:article])
				format.html { redirect_to @article, notice: 'Article was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /articles/1
	# DELETE /articles/1.json
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		respond_to do |format|
			format.html { redirect_to articles_url }
			format.json { head :no_content }
		end
	end
end
