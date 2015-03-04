class UsersController < ApplicationController
	before_filter :authorize

  def show
    @user = User.find(params[:id])         

    authorize! :read, @user #Check that the current_user (Richard) is authorized to read @user? 
    #authorize! method is built in to cancancan 
  end

  private

  def authorize
  	if current_user.nil?
  		redirect_to login_path, alert: "Not authorized"
  		#this alert is a flash message
  	end
  end
end
