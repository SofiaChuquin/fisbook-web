class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])
    @note = @course.notes.new(student_id: @student.id)
    if @student.notes.size >= 1
      redirect_to root_path, notice: 'Alumno ya cuenta con nota del curso'
    end
  end

  # GET /notes/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])
    @note = Note.new(note_params.merge(course_id: @course.id, student_id: @student.id))

    respond_to do |format|
      if @note.save
        format.html { redirect_to course_student_note_path(id: @note.id, course_id: @course.id, student_id: @student.id), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to course_student_note_path(id: @note.id, course_id: @course.id, student_id: @student.id), notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to course_student_notes_path, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:first_practice, :second_practice, :third_practice, :first_exam, :second_exam, :permanent, :unique_exam, :defer_exam, :average)
    end
end
