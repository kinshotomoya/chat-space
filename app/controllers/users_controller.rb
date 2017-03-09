class UsersController < ApplicationController

  def index
  end

  def search
    @users = User.where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do |format|
      format.json{
        render json: @users
      }
    end
  end


end
