class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_person

  def current_person
    p current_user.inspect + '=================='
    person = Person.find_by(email: current_user.email)
    if person.rol == 'Estudiante'
      person.students.first
    elsif person.rol == 'Docente'
      person.teachers.first
    elsif person.rol == 'Directivo'
      person.executives.first
    end
  end
end
