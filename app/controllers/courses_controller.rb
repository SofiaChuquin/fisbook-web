class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :validate_rol, only: [:new, :create, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  # def index
  #   @courses = Course.all
  # end

  # GET /courses/1
  # GET /courses/1.json
  def show
    if current_person.person.rol == 'Estudiante'
      p @students = Cycle.first.enrollments.map { |e| e.student }.select { |x| x.id == current_person.id }
    else
      @students = Cycle.first.enrollments.map { |e| e.student }.uniq
    end
  end

  # GET /courses/new
  def new
    @cycle = Cycle.find(params[:cycle_id])
    @course = @cycle.courses.new(cycle_id: @cycle.id)
    @teachers = Teacher.all
  end

  # GET /courses/1/edit
  def edit
    @teachers = Teacher.all
  end

  # POST /courses
  # POST /courses.json
  def create
    @cycle = Cycle.find(params[:cycle_id])
    @course = Course.new(course_params.merge(cycle_id: @cycle.id))
    @teachers = Teacher.all

    respond_to do |format|
      if @course.save
        format.html { redirect_to cycle_course_path(id: @course.id, cycle_id: @cycle.id), notice: 'Curso creado exitosamente.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to root_path, notice: 'Curso actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Curso eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :credits, :type_evaluation, :hours, :teacher_id)
    end

    def validate_rol
      (redirect_to root_path, notice: 'Acceso solo para personal administrativo') unless current_person.person.rol == 'Directivo'
    end
end
