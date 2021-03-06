class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
	end

	def destroy
		User.find(params[:id]).destroy

		redirect_to "/users"
	end

	def new
		@user = User.new
 end

	def create
		User.create(user_params)

	 	redirect_to "/users"
 	end

 	def edit
 		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])

 		user.update_attributes(user_params)

 		redirect_to user_path
	end

	def sign_in
		@user = User.find(user_params)

		
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :email, :password, :avatar, :bio)
	end

end
