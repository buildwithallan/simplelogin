class StudentsController < ApplicationController

	def new
		@student = Student.new
	end

	def create
		@student = Student.create(student_params)

		@student.student_id.downcase

		if @student.save
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def student_params
		params.require(:student).permit(:name, :student_id, :password, :password_confirmation)
	end
end
