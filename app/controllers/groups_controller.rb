class GroupsController < ApplicationController

   def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end


  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_chats_path(@group.id), notice: "グループ作成しました。"
    else
      flash.now[:alert] = "再入力してください。"
      render :action => :new

    end
  end

  def edit
    @group = Group.find(params[:id])
    @group.user_groups
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to group_chats_path(group.id), notice: "編集しました。"
  end

  private
  def group_params
    params.require(:group).permit(:name, {:user_ids =>[]})
  end
end


