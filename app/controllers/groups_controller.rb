class GroupsController < ApplicationController

  def index
    @group = Group.find(1)
  end

  def new
  end

  def create
    Group.create(name: params[:chat_group][:name])
    redirect_to action: :index
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(name: params[:group][:name])
    redirect_to action: :index, :notice => "更新完了"
  end


end
