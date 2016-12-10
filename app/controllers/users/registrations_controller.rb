class Users::RegistrationsController < Devise::RegistrationsController

  def update
    user = User.find_by(encrypted_password: params[:user][:current_password])
    user.update(user_params)
  end


  private
  def user_params
    params.permit(:name, :email, :password, :passsword_confirmation)
  end

end