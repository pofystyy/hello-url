class HellosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_hello, only: [:show, :edit, :update, :destroy]

	def index
		@hellos = Hello.all		
	end

	def show
	end

	def new
		@hello = current_user.hellos.new	
	end

	def create
		@hello = current_user.hellos.new(hello_params)
		if @hello.save
			redirect_to @hello, success: 'Hello successfully created'
		else
			render :new, danger: 'Hello don`t created'
		end
	end

	def edit		
	end

	def update
		if @hello.update_attributes(hello_params)
			redirect_to @hello, success: 'Hello successfully updated'
		else
			render :edit, danger: 'Hello don`t updated'
		end		
	end

	def destroy
			@hello.destroy
			redirect_to hellos_path, success: 'Hello successfully deleted'
	end

	private

	def set_hello
		@hello = Hello.find(params[:id])		
	end

	def hello_params
		params.require(:hello).permit(:url, :summary, :all_tags)
	end
end
