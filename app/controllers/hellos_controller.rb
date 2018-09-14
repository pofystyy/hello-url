class HellosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_hello, only: [:show, :edit, :update, :destroy]
  before_action :delete_tags, only: [:destroy]
	before_action :require_permission, only: :edit
	
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
			@tags = @hello.tags
			if @tags
				redirect_to hellos_path, success: 'Hello successfully deleted'
			end
	end

	def my_links
 		@links = Hello.where(user_id: current_user.id)
 		@tags = []
 	end

	private

	def set_hello
		@hello = Hello.find(params[:id])		
	end

	def hello_params
		params.require(:hello).permit(:url, :summary, :all_tags)
	end

	def find_tags
		@tags = []
		@hello.tags.each { |tag| @tags << tag }
	end

	def delete_tags
		find_tags
		@tags.each do |tag|
			if tag.hellos.count == 1 
				tag.destroy
			end
		end		
	end

	def require_permission
	  if current_user != Hello.find(params[:id]).user
	    redirect_to root_path
	  end
	end

end
