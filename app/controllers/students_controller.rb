class StudentsController < ApplicationController

	def new
		@student = Student.new
	end

	def create
		@student = Student.create(student_params)

		@student.student_id.downcase

		if @student.

			flash[:notice] = "Account created successfully!"
			redirect_to root_path
		else
			flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid student_id and password and try again."
			render :new
		end
	end

	private

	def student_params
		params.require(:student).permit(:name, :student_id, :password, :password_confirmation)
	end
end
