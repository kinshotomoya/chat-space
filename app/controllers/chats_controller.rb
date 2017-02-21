class ChatsController < ApplicationController

  def index
     @group = Group.find(params[:group_id])
     @groups = current_user.groups
     @users = @group.users
     @chat = Chat.new
     @chats = @group.chats

  end

  def create
    @chat = Chat.new(chat_params)
      if @chat.save
        respond_to do |format|
          format.html{redirect_to group_chats_path(@chat.group_id)}
          format.json{
            render json: {text: @chat.text, name: current_user.name, time: @chat.created_at}
          } #json形式でこの値を送ることができる。次はchat.jsを見る
        end
      else
        redirect_to group_chats_path(@chat.group_id), alert: "メッセージを入力してください。"
      end
  end


  private
  def chat_params
    params.permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

