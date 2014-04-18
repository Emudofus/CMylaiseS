class ScreensController < ApplicationController
  before_filter :admin!, except: [:index]

  # GET /screens
  # GET /screens.json
  def index
    @screens = Screen.all
  end

  # GET /screens/new
  # GET /screens/new.json
  def new
    @screen = Screen.new
  end

  # GET /screens/1/edit
  def edit
    @screen = Screen.find(params[:id])
  end

  # POST /screens
  # POST /screens.json
  def create
    @screen = Screen.new(params[:screen])

	respond_to do |format|
		if @screen.save
			format.html { redirect_to screens_path, notice: 'screen was successfully created.' }
			format.json { render json: @screen, status: :created, location: screens_path }
		else
			format.html { render action: "new" }
			format.json { render json: @screen.errors, status: :unprocessable_entity }
		end
	end
  end

  # PUT /screens/1
  # PUT /screens/1.json
  def update
    @screen = Screen.find(params[:id])
	
	respond_to do |format|
		if @screen.update_attributes(params[:screen])
			format.html { redirect_to screens_path, notice: 'screen was successfully updated.' }
			format.json { head :no_content }
		else
			format.html { render action: "edit" }
			format.json { render json: @screen.errors, status: :unprocessable_entity }
		end
	end
  end

  # DELETE /screens/1
  # DELETE /screens/1.json
  def destroy
    @screen = Screen.find(params[:id])
    @screen.destroy
  end
end
