class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.user_groups.build
  end

  def index
    @group = Group.all
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to :root_path, notice: "グループ作成しました。"
    else
      redirect_to '/groups/new', alert: "グループを作成してください。"
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

  private
  def group_params
    params.require(:group).permit(chat_grop:[:name], group:[:user_ids])
  end
end
