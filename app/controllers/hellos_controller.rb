class HellosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_hello, only: [:show, :edit, :update, :destroy]

	def index
		@hellos = Hello.all		
	end

	def show
	end

	def new
		@hello = Hello.new	
		@hello.user = current_user	
	end

	def create
		@hello = Hello.new(hello_params)
		@hello.user = current_user	
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

	def my_links
 		@links = Hello.where(user_id: current_user.id) 		
 	end

	private

	def set_hello
		@hello = Hello.find(params[:id])		
	end

	def hello_params
		params.require(:hello).permit(:url, :summary, :all_tags)
	end
end
