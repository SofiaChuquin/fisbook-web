class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :validate_rol, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @y = "edit"
  end

  # POST /students
  # POST /students.json
  def create

    @student = Student.new(student_params)
    @student.create_person(student_params[:person_attributes])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Estudiante creado exitosamente.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Estudiante actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Estudiante eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:turn, person_attributes: [:lastname, :name, :dni, :phone, :email, :gender, :state, :rol])
    end

    def validate_rol
      (redirect_to root_path, notice: 'Acceso solo para personal administrativo.') unless current_person.person.rol == 'Directivo'
    end
end
