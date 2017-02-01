class ChatsController < ApplicationController

  def index
     @group = Group.find(params[:group_id])
     @groups = current_user.groups
     @users = @group.users
     @chat = Chat.new

  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.text.empty?
    if @chat.save
      redirect_to group_chats_path(@chat.group_id)
    else
      if @chat.text.empty?
        flash[:alert] = "メッセージを入力してください。"
      end
    end
  end


  private
  def chat_params
    params.require(:chat).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

