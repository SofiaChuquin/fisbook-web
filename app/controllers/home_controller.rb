class HomeController < ApplicationController

  def index
    @hola = current_person.rol
  end
end
