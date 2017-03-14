class ChatsController < ApplicationController

  before_action :set_group, only:[:index, :create]

  def index
    @groups = current_user.groups
    @users = @group.users
    @chat = Chat.new
    @chats = @group.chats
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create #画像をアップロードした時にパラメータとして送られてくる値をここで、とる！imageの中に入っている。
    @chat = Chat.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html{redirect_to group_chats_path(@chat.group_id)}
        format.json
      end
    else
      redirect_to group_chats_path(@chat.group_id), alert: "メッセージを入力してください。"
    end
  end


  private

  def chat_params
    params.permit(:image, :text).merge(group_id: params[:group_id], user_id: current_user.id) #ストロングパラメータで、imageを許可してあげる。
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end

