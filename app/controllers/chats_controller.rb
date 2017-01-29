class ChatsController < ApplicationController

  def index
     @groups = UserGroup.where(user_id: current_user.id)
     @users = UserGroup.where(group_id: params[:group_id])
     @chat = Chat.new
     @group = Group.find(params[:group_id])

  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.text.empty?
      flash[:alert] = "メッセージを入力してください。"
    else
      if @chat.save
        redirect_to group_chats_path(@chat.group_id)
      else
        flash[:alert] = "入力してください。"
      end
    end

  end


  private
  def chat_params
    params.require(:chat).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

