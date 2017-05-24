class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :validate_rol, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @cycle = Cycle.find(params[:cycle_id])
    @enrollment = @cycle.enrollments.new(cycle_id: @cycle.id)
    @students = Student.all
  end

  # GET /enrollments/1/edit
  def edit
    @students = Student.all
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @cycle = Cycle.find(params[:cycle_id])
    @enrollment = Enrollment.new(enrollment_params.merge(cycle_id: @cycle.id))
    @students = Student.all

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to cycle_enrollment_path(id: @enrollment.id, cycle_id: @cycle.id), notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    @cycle = Cycle.fin(params[:cycle_id])

    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to cycle_enrollment_path(id: @enrollment.id, cycle_id: @cycle.id), notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to cycle_enrollments_path, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:voucher, :active, :student_id, :cycle_id)
    end

    def validate_rol
      (redirect_to root_path, notice: 'Acceso solo para personal administrativo') unless current_person.person.rol == 'Directivo'
    end
end
