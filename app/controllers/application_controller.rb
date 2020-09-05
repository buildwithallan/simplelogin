class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception


    # Make the current_user method available to views also, not just controllers:
	helper_method :current_student

	def current_student
		# Look up the current user based on user_id in the session cookie
		@current_student ||= Student.find(session[:std_id]) if session[:std_id]
	end

	def authorize
		# authroize method redirects user to login page if not logged in:
		redirect_to login_path, alert: 'You must be logged in to access this page' if current_student.nil?
	end
end
