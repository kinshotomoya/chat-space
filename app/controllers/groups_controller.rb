class GroupsController < ApplicationController

  def index
  end

  def new
  end

  def create
    Group.create(name: params[:chat_group][:name])
    redirect_to action: :index
  end


end
