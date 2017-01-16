class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.user_groups.build
  end

  def index
    @group = Group.all
  end

  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: "グループ作成しました。"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(name: params[:group][:name])
    redirect_to action: :index
  end

  def group_params
    params.require(:group).permit(:text, {user_ids => []})
  end



end
