class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_person
  before_filter :load_sidebar

  def current_person
    p current_user.inspect + '=================='
    if current_user
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

  def load_sidebar
    if current_person
      if current_person.person.rol == 'Estudiante'
        cycle_id = current_person.enrollments.last.cycle_id
        @courses = Course.where(cycle_id: cycle_id)
      elsif current_person.person.rol == 'Docente'
        teacher_id = current_person.id
        @courses = Course.where(teacher_id: teacher_id)
      elsif current_person.person.rol == 'Directivo'
        @cycles = Cycle.all
      end
    end
  end
end
