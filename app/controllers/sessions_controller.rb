class SessionsController < ApplicationController

	def new
		
	end

	def create
	  student = Student.find_by(student_id: params[:login][:student_id].downcase)

	  if student && student.authenticate(params[:login][:password])
	  	session[:std_id] = student.id.to_s
	  	redirect_to root_path, notice: 'Successfully logged in!'
	  else
	  	flash.now.alert = "Incorrect student_id or password, try again."
	  	render :new
	  	
	  end
	end

	def destroy
		session.delete(:std_id)
		redirect_to login_path
	end
end
