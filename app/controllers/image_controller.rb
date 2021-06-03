class ImageController < ApplicationController
  def new
  	@image = Image.new
  end
  def create
  	@image.save
  end

  def edit
  end
 def update
 end
  def show
  end
end
