class SessionsController < ApplicationController
	def new	
	
		if session[:user_id]
			redirect_to "/users/#{session[:user_id]}"
		end
	end

	def create
		user = User.where(email: params[:email]).first

		if user && user.password == params[:password]

			session[:user_id] = user.id
			redirect_to root_path
		else
			redirect_to :back
		end

	end

	def destroy
		session.clear
		
		redirect_to root_path
	end
end