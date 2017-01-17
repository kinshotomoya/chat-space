class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.users << current_user
  end

  def index
    @group = Group.all
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to '/', notice: "グループ作成しました。"
    else
      flash.now[:alert] = "グループを作成してください。"
      render :action => :new

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
    params.require(:group).permit(:name, {:user_ids =>[]})
  end
end
