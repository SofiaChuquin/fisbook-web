class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :validate_rol, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)


    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Persona creada exitosamente.' }
        format.json { render :show, status: :created, location: @person }
        if person_params[:rol] == 'Docente'
          if @person.teachers.create(rank: 'Nombrado')
            redirect_to teachers_path, notice: 'Docente ha sido creado'
          else
            render :new, alert: 'No se ha creado el docente'
          end
        elsif person_params[:rol] == 'Estudiante'
          @person.students.create(turn: 'Mañana')
        elsif person_params[:rol] == 'Directivo'
          @person.executives.create(position: 'Secretario')
        end
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Persona actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Persona eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:lastname, :name, :dni, :phone, :email, :gender, :state, :rol)
    end

    def validate_rol
      (redirect_to root_path, notice: 'Acceso solo para personal administrativo.') unless current_person.rol == 'Directivo'
    end
end
