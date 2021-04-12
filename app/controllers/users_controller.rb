class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    #name = user.name
    #@comments = user.comments
  end

end