class TagsController < ApplicationController
	
	def index
		@tags = Tag.all					
	end

	def show
		@tag = Tag.find_by(name: params[:id])
		@hellos = @tag.hellos
	end	

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy 
		redirect_to tags_path
	end

end