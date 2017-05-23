class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    if Person.find_by(email: params[:user][:email])
      super
    else
      redirect_to new_user_registration_path, notice: 'Tu correo no se encuentra registrado en el sistema.'
    end
  end

end
