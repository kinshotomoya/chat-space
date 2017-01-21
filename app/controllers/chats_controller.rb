class ChatsController < ApplicationController

  def index
     @user_groups = UserGroup.where(user_id: current_user.id)
  end
end
